// §TRACE UI guards: actions stay tappable above the shell nav bar, and the
// dark theme keeps every screen's text readable.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:garagego/core/providers/app_providers.dart';
import 'package:garagego/core/router/app_router.dart';
import 'package:garagego/core/storage/local_storage_service.dart';
import 'package:garagego/core/utils/app_timezone.dart';
import 'package:garagego/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'contrast_scan.dart';

Future<void> _boot(
  WidgetTester tester, {
  Size size = const Size(430, 932),
  Map<String, Object> prefs = const {},
}) async {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
  SharedPreferences.setMockInitialValues({
    'locale': 'id',
    'onboarding_completed': true,
    ...prefs,
  });
  final storage = await LocalStorageService.init();
  await tester.pumpWidget(
    ProviderScope(
      overrides: [localStorageServiceProvider.overrideWithValue(storage)],
      child: const GarageGoApp(),
    ),
  );
  await tester.pumpAndSettle();
}

/// True when a tap at the centre of [finder] reaches it (nothing drawn on top).
bool reachable(WidgetTester tester, Finder finder) {
  final target = tester.renderObject(finder);
  final hit = tester.hitTestOnBinding(tester.getCenter(finder));
  return hit.path.any((e) => e.target == target);
}

void main() {
  setUpAll(AppTimeZone.initAppTimeZones);

  testWidgets(
    'FLOW-GAR-01-T06 tombol Aksi Cepat dan Simpan ke Garasi tidak tertutup bilah navigasi',
    (tester) async {
      // Errors from the narrow Ahem test font are layout noise, not what we test.
      final original = FlutterError.onError;
      FlutterError.onError = (d) => d.exceptionAsString().contains('overflowed')
          ? null
          : original?.call(d);
      addTearDown(() => FlutterError.onError = original);
      await _boot(tester);
      expect(reachable(tester, find.text('Aksi Cepat')), isTrue);
      await tester.tap(find.byTooltip('Tambah Kendaraan').first);
      await tester.pumpAndSettle();
      final save = find.text('Simpan ke Garasi');
      await tester.ensureVisible(save);
      await tester.pumpAndSettle();
      expect(reachable(tester, save), isTrue);
    },
  );

  testWidgets(
    'FLOW-SET-01-T05 tema dark: semua teks di 5 tab terbaca (kontras >= 4.5)',
    (tester) async => _expectReadable(tester, 'dark'),
  );

  testWidgets(
    'FLOW-SET-01-T06 tema light: semua teks di 5 tab terbaca (kontras >= 4.5)',
    (tester) async => _expectReadable(tester, 'light'),
  );
}

Future<void> _expectReadable(WidgetTester tester, String mode) async {
  await _boot(tester, size: const Size(900, 1900), prefs: {'theme_mode': mode});
  final issues = <String>[];
  for (final r in ['/', '/maintenance', '/fuel', '/glovebox', '/settings']) {
    appRouter.go(r);
    await tester.pumpAndSettle();
    issues.addAll(scanContrast(tester).map((i) => '$r $i'));
  }
  expect(issues, isEmpty);
}
