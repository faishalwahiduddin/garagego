import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:garagego/core/providers/app_providers.dart';
import 'package:garagego/core/providers/locale_provider.dart';
import 'package:garagego/core/storage/local_storage_service.dart';
import 'package:garagego/core/utils/app_timezone.dart';
import 'package:garagego/l10n/app_localizations.dart';
import 'package:garagego/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  // Production calls this in main() before runApp; widget tests bypass
  // main() so they must init the tz database themselves.
  setUpAll(AppTimeZone.initAppTimeZones);

  testWidgets('GarageGoApp smoke test', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    final storageService = await LocalStorageService.init();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          localStorageServiceProvider.overrideWithValue(storageService),
        ],
        child: const GarageGoApp(),
      ),
    );

    await tester.pumpAndSettle();

    // Verify main brand and initial vehicles
    expect(find.text('GarageGo'), findsOneWidget);
    expect(find.text('Toyota Innova Zenix'), findsWidgets);
    expect(find.text('B 1234 ABC'), findsWidgets);
  });

  testWidgets('GarageGoApp localization test (English)', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({'locale': 'en'});
    final storageService = await LocalStorageService.init();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          localStorageServiceProvider.overrideWithValue(storageService),
        ],
        child: const GarageGoApp(),
      ),
    );

    await tester.pumpAndSettle();

    // Verify English navigation bar items
    expect(find.text('Garage'), findsOneWidget);
    expect(find.text('Service'), findsNWidgets(2)); // Navigation bar & TCO breakdown card
    expect(find.text('Fuel'), findsAtLeastNWidgets(1));
    expect(find.text('Glovebox'), findsOneWidget);
    expect(find.text('Settings'), findsOneWidget);

    // Verify English dashboard cards & action button
    expect(find.text('Quick Actions'), findsOneWidget);
    expect(find.text('Odometer (km)'), findsOneWidget);
    expect(find.text('Cost / KM'), findsOneWidget);
    expect(find.text('Fuel Economy'), findsOneWidget);
    expect(find.text('Total Cost of Ownership (TCO)'), findsNWidgets(2));
  });

  testWidgets('AppLocalizations loads all 8 supported locales with complete translations', (WidgetTester tester) async {
    const expectedWords = {
      'id': {'garage': 'Garasi', 'quick': 'Aksi Cepat'},
      'en': {'garage': 'Garage', 'quick': 'Quick Actions'},
      'es': {'garage': 'Garaje', 'quick': 'Acciones Rápidas'},
      'ja': {'garage': 'ガレージ', 'quick': 'クイック操作'},
      'zh': {'garage': '车库', 'quick': '快捷操作'},
      'ar': {'garage': 'المرآب', 'quick': 'إجراءات سريعة'},
      'jv': {'garage': 'Garasi', 'quick': 'Tumindak Cepet'},
      'su': {'garage': 'Garasi', 'quick': 'Tindakan Gancang'},
    };

    for (final locale in supportedLocales) {
      final l10n = await AppLocalizations.delegate.load(locale);
      expect(l10n.appName, 'GarageGo');
      expect(l10n.navGarage, isNotEmpty);
      expect(l10n.aksiCepat, isNotEmpty);

      final expected = expectedWords[locale.languageCode]!;
      expect(l10n.navGarage, expected['garage']);
      expect(l10n.aksiCepat, expected['quick']);
    }
  });
}


