import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:garagego/features/settings/widgets/commercial_contact_cards.dart';
import 'package:garagego/core/constants/app_colors.dart';
import 'package:garagego/core/theme/app_theme.dart';
import 'package:garagego/l10n/app_localizations.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';

class _FakeLauncher extends Fake
    with MockPlatformInterfaceMixin
    implements UrlLauncherPlatform {
  _FakeLauncher(this.result, {this.throws = false});
  final bool result;
  final bool throws;
  final List<String> urls = [];

  @override
  Future<bool> canLaunch(String url) async => true;

  @override
  Future<bool> launchUrl(String url, LaunchOptions options) async {
    urls.add(url);
    if (throws) throw PlatformException(code: 'ACTIVITY_NOT_FOUND');
    return result;
  }
}

Widget _app({bool isDark = false}) => MaterialApp(
  theme: isDark ? AppTheme.darkTheme : AppTheme.lightTheme,
  locale: const Locale('en'),
  localizationsDelegates: const [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
  supportedLocales: AppLocalizations.supportedLocales,
  home: Scaffold(body: CommercialContactCards(appName: 'GarageGo')),
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    PackageInfo.setMockInitialValues(
      appName: 'garagego',
      packageName: 'id.faishal.garagego',
      version: '1.2.3',
      buildNumber: '45',
      buildSignature: '',
    );
  });

  testWidgets('renders both titles', (tester) async {
    await tester.pumpWidget(_app());
    expect(find.text('Commercial use'), findsOneWidget);
    expect(find.text('Acquire this app'), findsOneWidget);
  });

  testWidgets('commercial tap launches mailto with subject', (tester) async {
    final fake = _FakeLauncher(true);
    UrlLauncherPlatform.instance = fake;
    await tester.pumpWidget(_app());
    await tester.tap(find.text('Commercial use'));
    await tester.pumpAndSettle();
    expect(fake.urls, hasLength(1));
    final uri = Uri.parse(fake.urls.single);
    expect(uri.scheme, 'mailto');
    expect(uri.path, 'contact@faishal.id');
    expect(fake.urls.single, contains('%20'));
    expect(uri.queryParameters['subject'], '[Commercial] GarageGo');
    expect(uri.queryParameters['body'], contains('v1.2.3+45'));
    expect(uri.queryParameters['body'], contains('Platform:'));
  });

  testWidgets('acquisition tap launches mailto with fixed brand subject', (
    tester,
  ) async {
    final fake = _FakeLauncher(true);
    UrlLauncherPlatform.instance = fake;
    await tester.pumpWidget(_app());
    await tester.tap(find.text('Acquire this app'));
    await tester.pumpAndSettle();
    expect(fake.urls, hasLength(1));
    final uri = Uri.parse(fake.urls.single);
    expect(uri.queryParameters['subject'], '[Acquisition] GarageGo');
  });

  testWidgets('launch failure copies email and shows snackbar', (tester) async {
    UrlLauncherPlatform.instance = _FakeLauncher(false);
    String? copied;
    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
      SystemChannels.platform,
      (call) async {
        if (call.method == 'Clipboard.setData') {
          copied = (call.arguments as Map)['text'] as String?;
        }
        return null;
      },
    );
    addTearDown(
      () => tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
        SystemChannels.platform,
        null,
      ),
    );
    await tester.pumpWidget(_app());
    await tester.tap(find.text('Acquire this app'));
    await tester.pumpAndSettle();
    expect(copied, 'contact@faishal.id');
    expect(
      find.text('Email address copied: contact@faishal.id'),
      findsOneWidget,
    );
  });

  testWidgets('launcher exception copies email and shows snackbar', (
    tester,
  ) async {
    UrlLauncherPlatform.instance = _FakeLauncher(false, throws: true);
    String? copied;
    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
      SystemChannels.platform,
      (call) async {
        if (call.method == 'Clipboard.setData') {
          copied = (call.arguments as Map)['text'] as String?;
        }
        return null;
      },
    );
    addTearDown(
      () => tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
        SystemChannels.platform,
        null,
      ),
    );
    await tester.pumpWidget(_app());
    await tester.tap(find.text('Acquire this app'));
    await tester.pumpAndSettle();
    expect(copied, 'contact@faishal.id');
    expect(
      find.text('Email address copied: contact@faishal.id'),
      findsOneWidget,
    );
  });

  testWidgets(
    'clipboard failure shows plain address in snackbar without copied claim',
    (tester) async {
      UrlLauncherPlatform.instance = _FakeLauncher(false);
      tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
        SystemChannels.platform,
        (call) async {
          if (call.method == 'Clipboard.setData') {
            throw PlatformException(code: 'CLIPBOARD_UNAVAILABLE');
          }
          return null;
        },
      );
      addTearDown(
        () => tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
          SystemChannels.platform,
          null,
        ),
      );
      await tester.pumpWidget(_app());
      await tester.tap(find.text('Acquire this app'));
      await tester.pumpAndSettle();
      expect(
        find.text('Email address copied: contact@faishal.id'),
        findsNothing,
      );
      expect(find.text('contact@faishal.id'), findsNWidgets(2));
    },
  );

  testWidgets('card is one semantics button with title and description', (
    tester,
  ) async {
    final handle = tester.ensureSemantics();
    await tester.pumpWidget(_app());
    expect(find.bySemanticsLabel(RegExp('Commercial use')), findsOneWidget);
    handle.dispose();
  });

  for (final isDark in [false, true]) {
    testWidgets('description and email contrast >= 4.5 (dark: $isDark)', (
      tester,
    ) async {
      await tester.pumpWidget(_app(isDark: isDark));
      final bg = isDark ? (AppColors.bgCard) : (AppColors.bgLightSurface);
      double ratio(Color a, Color b) {
        final la = a.computeLuminance(), lb = b.computeLuminance();
        return (la > lb ? la + 0.05 : lb + 0.05) /
            (la > lb ? lb + 0.05 : la + 0.05);
      }

      final desc = tester.widget<Text>(
        find.text(
          'Need a commercial license, white-label, or customization? Get in touch.',
        ),
      );
      final trailing = tester.widget<Text>(find.text('contact@faishal.id'));
      for (final t in [desc, trailing]) {
        final style = DefaultTextStyle.of(
          tester.element(find.byWidget(t)),
        ).style.merge(t.style);
        final c = Color.alphaBlend(style.color!, bg);
        expect(ratio(c, bg), greaterThanOrEqualTo(4.5));
        expect(style.fontSize, greaterThanOrEqualTo(12));
      }
    });
  }
}
