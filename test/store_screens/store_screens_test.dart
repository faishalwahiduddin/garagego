// Device-free store screenshot renderer (pilot).
//
// Renders the real app per locale x route x platform with the Flutter test
// renderer and writes raw PNGs at store pixel size. No simulator/emulator.
//
//   flutter test test/store_screens/store_screens_test.dart \
//     --dart-define=STORE_RAWS_OUT=build/store_raws
//
// Optional: --dart-define=STORE_RAWS_LOCALES=en-US,ar  (subset)
//           --dart-define=STORE_RAWS_PLATFORMS=ios     (subset)
//
// Not part of the normal suite: without STORE_RAWS_OUT every case is skipped.
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:garagego/core/providers/app_providers.dart';
import 'package:garagego/core/router/app_router.dart';
import 'package:garagego/core/storage/local_storage_service.dart';
import 'package:garagego/core/utils/app_timezone.dart';
import 'package:garagego/main.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'store_fonts.dart';
import 'store_status_bar.dart';

// ---- App-specific config (the only part that changes per app) -------------

const _routes = ['/', '/maintenance', '/service', '/fuel', '/glovebox'];

/// Store locale -> app language code.
const _locales = {
  'id': 'id',
  'en-US': 'en',
  'ar': 'ar',
  'ja-JP': 'ja',
  'zh-CN': 'zh',
  'es-ES': 'es',
};

Future<Widget> _buildApp(String lang) async {
  // Same state main() produces under STORE_DEMO: saved locale drives both the
  // seed language and the UI language; onboarding already done.
  SharedPreferences.setMockInitialValues({
    'locale': lang,
    'onboarding_completed': true,
  });
  final storage = await LocalStorageService.init();
  return ProviderScope(
    overrides: [localStorageServiceProvider.overrideWithValue(storage)],
    child: const GarageGoApp(),
  );
}

void _go(String route) => appRouter.go(route);

// ---- Generic harness -----------------------------------------------------

const _outDir = String.fromEnvironment('STORE_RAWS_OUT');
const _onlyLocales = String.fromEnvironment('STORE_RAWS_LOCALES');
const _onlyPlatforms = String.fromEnvironment('STORE_RAWS_PLATFORMS');

final _overflows = <String>[];

void main() {
  setUpAll(() async {
    AppTimeZone.initAppTimeZones();
    AppTimeZone.cachedDeviceZone = 'Asia/Jakarta';
    PackageInfo.setMockInitialValues(
      appName: 'GarageGo',
      packageName: 'id.faishal.garagego',
      version: '1.0.0',
      buildNumber: '1',
      buildSignature: '',
    );
  });

  tearDownAll(() {
    if (_outDir.isEmpty) return;
    final f = File('$_outDir/overflows.txt')
      ..createSync(recursive: true)
      ..writeAsStringSync('${_overflows.join('\n')}\n');
    // ignore: avoid_print
    print('overflow report: ${f.path} (${_overflows.length} entries)');
  });

  for (final device in StoreDevice.all) {
    if (_onlyPlatforms.isNotEmpty &&
        !_onlyPlatforms.split(',').contains(device.name)) {
      continue;
    }
    for (final entry in _locales.entries) {
      if (_onlyLocales.isNotEmpty &&
          !_onlyLocales.split(',').contains(entry.key)) {
        continue;
      }
      for (var i = 0; i < _routes.length; i++) {
        final label = '${device.name}/${entry.key}/${i + 1} ${_routes[i]}';
        testWidgets(label, (tester) async {
          // flutter_test paints elevation as a hard black outline by default.
          debugDisableShadows = false;
          try {
            await _renderOne(tester, device, entry.value, _routes[i],
                '$_outDir/${device.dir}/${entry.key}/${i + 1}.png', label);
          } finally {
            // Must be unset before the binding checks invariants.
            debugDefaultTargetPlatformOverride = null;
            debugDisableShadows = true;
          }
        }, skip: _outDir.isEmpty, timeout: const Timeout(Duration(seconds: 90)));
      }
    }
  }
}

Future<void> _renderOne(WidgetTester tester, StoreDevice device, String lang,
    String route, String outPath, String label) async {
  await tester.runAsync(loadStoreFonts);
  final text = StoreTextStyle(device, lang);

  tester.view
    ..physicalSize = device.physicalSize
    ..devicePixelRatio = device.dpr
    ..padding = FakeViewPadding(
        top: device.topInset * device.dpr,
        bottom: device.bottomInset * device.dpr)
    ..viewPadding = FakeViewPadding(
        top: device.topInset * device.dpr,
        bottom: device.bottomInset * device.dpr);
  tester.platformDispatcher.localeTestValue = ui.Locale(lang);
  debugDefaultTargetPlatformOverride = device.platform;
  addTearDown(() {
    tester.view.reset();
    tester.platformDispatcher.clearLocaleTestValue();
  });

  // Overflow reports from frames laid out before the font patch are noise
  // (box glyphs); real overflow is measured on the final layout instead.
  final previousOnError = FlutterError.onError;
  FlutterError.onError = (details) {
    if (!details.exceptionAsString().contains('overflowed')) {
      previousOnError?.call(details);
    }
  };
  addTearDown(() => FlutterError.onError = previousOnError);

  final key = GlobalKey();
  final app = await tester.runAsync(() => _buildApp(lang));
  await tester.pumpWidget(RepaintBoundary(
    key: key,
    child: StoreStatusBarFrame(device: device, child: app!),
  ));
  // Splash handoff timer (750 ms) then the requested route.
  await tester.pump(const Duration(seconds: 1));
  _go(route);
  for (var i = 0; i < 20; i++) {
    await tester.pump(const Duration(milliseconds: 100));
  }
  // Decode asset images for real (fake-async never finishes the decode).
  await tester.runAsync(() async {
    for (final e in find.byType(Image).evaluate()) {
      await precacheImage((e.widget as Image).image, e);
    }
  });
  final root = key.currentContext!.findRenderObject()!;
  for (var i = 0; i < 10 && text.patch(root) > 0; i++) {
    await tester.pump(const Duration(milliseconds: 100));
  }
  await tester.pump(const Duration(milliseconds: 100));

  for (final o in findFlexOverflows(root)) {
    _overflows.add('$label: $o');
  }

  final boundary = root as RenderRepaintBoundary;
  final bytes = await tester.runAsync(() async {
    final image = await boundary.toImage(pixelRatio: device.dpr);
    final data = await image.toByteData(format: ui.ImageByteFormat.png);
    image.dispose();
    return data!.buffer.asUint8List();
  });
  File(outPath)
    ..createSync(recursive: true)
    ..writeAsBytesSync(bytes!);

  // Leave the tree before teardown so timers/animations are disposed.
  await tester.pumpWidget(const SizedBox.shrink());
  await tester.pump(const Duration(seconds: 1));
}

/// RenderFlex children that do not fit the flex's main axis, measured on the
/// visible tree only (offstage and hidden IndexedStack children skipped).
List<String> findFlexOverflows(RenderObject root) {
  final out = <String>[];
  void visit(RenderObject o) {
    if (o is RenderOffstage && o.offstage) return;
    if (o is RenderIndexedStack) {
      var i = 0;
      o.visitChildren((c) {
        if (i++ == (o.index ?? 0)) visit(c);
      });
      return;
    }
    if (o is RenderFlex && o.hasSize) {
      final horizontal = o.direction == Axis.horizontal;
      var used = 0.0;
      var n = 0;
      o.visitChildren((c) {
        final b = c as RenderBox;
        if (b.hasSize) used += horizontal ? b.size.width : b.size.height;
        n++;
      });
      if (n > 1) used += o.spacing * (n - 1);
      final avail = horizontal ? o.size.width : o.size.height;
      if (used - avail > 0.5) {
        out.add('${horizontal ? 'Row' : 'Column'} overflows by '
            '${(used - avail).toStringAsFixed(1)} px near "${_firstText(o)}" '
            '(${o.debugCreator})');
      }
    }
    o.visitChildren(visit);
  }

  visit(root);
  return out;
}

String _firstText(RenderObject o) {
  String? found;
  void visit(RenderObject c) {
    if (found != null) return;
    if (c is RenderParagraph) {
      found = c.text.toPlainText();
      return;
    }
    c.visitChildren(visit);
  }

  visit(o);
  final t = found ?? '';
  return t.length > 40 ? '${t.substring(0, 40)}...' : t;
}
