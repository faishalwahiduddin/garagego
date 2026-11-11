import 'dart:io';

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'store_status_bar.dart';

// Host font files. Roboto ships with the Flutter SDK, SF with macOS,
// CJK/Arabic with the fleet font folder (tools/gen-store-scaffold/fonts).
final _flutterRoot =
    Platform.environment['FLUTTER_ROOT'] ?? '/usr/local/share/flutter';
final _material = '$_flutterRoot/bin/cache/artifacts/material_fonts';
const _fleet = '../tools/gen-store-scaffold/fonts';
const _sys = '/System/Library/Fonts';

List<String> get _roboto => [
      '$_material/Roboto-Regular.ttf',
      '$_material/Roboto-Medium.ttf',
      '$_material/Roboto-Bold.ttf',
    ];
const _sf = ['$_sys/SFNS.ttf'];

/// family -> files. Theme families (Roboto / CupertinoSystem*) are the names
/// Material typography asks for; Store* are used by [StoreTextStyle].
Map<String, List<String>> get _families => {
      'Roboto': _roboto,
      'CupertinoSystemText': _sf,
      'CupertinoSystemDisplay': _sf,
      '.AppleSystemUIFont': _sf,
      'StoreDefault_android': _roboto,
      'StoreDefault_ios': _sf,
      'StoreArabic_ios': ['$_sys/SFArabic.ttf'],
      'StoreArabic_android': ['$_fleet/Amiri-Regular.ttf', '$_fleet/Amiri-Bold.ttf'],
      'StoreJP': ['$_fleet/NotoSansJP-VF.ttf'],
      'StoreSC': ['$_fleet/NotoSansSC-VF.ttf'],
      'StoreEmoji': ['$_sys/Apple Color Emoji.ttc'],
      'MaterialIcons': ['$_material/MaterialIcons-Regular.otf'],
    };

bool _loaded = false;

Future<ByteData> _read(String path) async =>
    ByteData.sublistView(Uint8List.fromList(await File(path).readAsBytes()));

/// Registers every font once per test process. Must run inside runAsync.
Future<void> loadStoreFonts() async {
  if (_loaded) return;
  _loaded = true;
  for (final e in _families.entries) {
    final loader = FontLoader(e.key);
    for (final f in e.value) {
      loader.addFont(_read(f));
    }
    await loader.load();
  }
}

/// The test engine resolves a null fontFamily to its box font and has no
/// per-glyph system fallback. On a device both come from the OS, so emulate
/// them: give every text span the platform default family (when unset) plus a
/// script/emoji fallback chain.
class StoreTextStyle {
  StoreTextStyle(StoreDevice device, String lang)
      : family = 'StoreDefault_${device.name}',
        fallback = List.unmodifiable([
          if (lang == 'zh') 'StoreSC',
          'StoreJP',
          if (lang != 'zh') 'StoreSC',
          'StoreArabic_${device.name}',
          'StoreEmoji',
        ]);

  final String family;
  final List<String> fallback;

  TextStyle _style(TextStyle? s) => (s ?? const TextStyle()).copyWith(
        fontFamily: s?.fontFamily ?? family,
        fontFamilyFallback: fallback,
      );

  bool _done(InlineSpan s) => identical(s.style?.fontFamilyFallback, fallback);

  InlineSpan _span(InlineSpan s) {
    if (s is! TextSpan) return s;
    return TextSpan(
      text: s.text,
      style: _style(s.style),
      children: s.children?.map(_span).toList(),
      recognizer: s.recognizer,
      mouseCursor: s.mouseCursor,
      onEnter: s.onEnter,
      onExit: s.onExit,
      semanticsLabel: s.semanticsLabel,
      locale: s.locale,
      spellOut: s.spellOut,
    );
  }

  /// Patches the render tree in place and returns how many paragraphs changed.
  /// Rebuilt widgets reset their text, so patch + pump until it returns 0.
  int patch(RenderObject root) {
    var changed = 0;
    void visit(RenderObject o) {
      if (o is RenderParagraph && !_done(o.text)) {
        o.text = _span(o.text);
        changed++;
      } else if (o is RenderEditable && o.text != null && !_done(o.text!)) {
        o.text = _span(o.text!);
        changed++;
      }
      o.visitChildren(visit);
    }

    visit(root);
    return changed;
  }
}
