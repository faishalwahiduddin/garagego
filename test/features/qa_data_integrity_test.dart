// Real-user QA (P10) fixes: odometer history validation, numeric input,
// defensive km/L, one schedule status, undoable deletes, service form.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:garagego/core/models/vehicle.dart';
import 'package:garagego/core/providers/app_providers.dart';
import 'package:garagego/core/services/analytics_service.dart';
import 'package:garagego/core/storage/local_storage_service.dart';
import 'package:garagego/core/theme/app_theme.dart';
import 'package:garagego/core/utils/app_timezone.dart';
import 'package:garagego/core/utils/number_input.dart';
import 'package:garagego/core/utils/validators.dart';
import 'package:garagego/features/fuel/fuel_logs_screen.dart';
import 'package:garagego/features/gamification/presentation/widgets/garage_achievements_card.dart';
import 'package:garagego/features/garage/garage_dashboard_screen.dart';
import 'package:garagego/features/maintenance/maintenance_screen.dart';
import 'package:garagego/l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../support/real_fonts.dart';

FuelLog _fuel(String id, DateTime date, int odo, double liters) => FuelLog(
      id: id,
      vehicleId: 'v1',
      date: date,
      odometer: odo,
      liters: liters,
      pricePerLiter: 10000,
    );

final _car = Vehicle(
  id: 'v1',
  name: 'Test Car',
  type: VehicleType.car,
  plateNumber: 'B 1 TST',
  currentOdometer: 1500,
  manufactureYear: 2020,
  taxDueDate: DateTime.utc(2027, 1, 1),
);

Future<ProviderContainer> _pump(
  WidgetTester tester,
  Widget home, {
  List<FuelLog> fuels = const [],
}) async {
  tester.view.physicalSize = const Size(1170, 2532);
  tester.view.devicePixelRatio = 3;
  addTearDown(tester.view.reset);
  SharedPreferences.setMockInitialValues({});
  final storage = await LocalStorageService.init();
  await storage.saveVehicles([_car]);
  await storage.saveFuelLogs(fuels);
  await storage.saveServiceLogs(const []);
  final container = ProviderContainer(
    overrides: [localStorageServiceProvider.overrideWithValue(storage)],
  );
  addTearDown(container.dispose);
  await tester.pumpWidget(
    UncontrolledProviderScope(
      container: container,
      child: MaterialApp(
        theme: AppTheme.darkTheme,
        locale: const Locale('en'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: home,
      ),
    ),
  );
  await tester.pumpAndSettle();
  return container;
}

void main() {
  setUpAll(() async {
    await loadRealRoboto();
    AppTimeZone.initAppTimeZones();
  });

  group('odometer history (§VAL)', () {
    final entries = <OdometerEntry>[
      (id: 'a', date: DateTime.utc(2026, 1, 1), odometer: 1000),
      (id: 'b', date: DateTime.utc(2026, 2, 1), odometer: 1500),
    ];

    test('a new entry must be above the latest earlier reading', () {
      final b = AppValidators.odometerBounds(entries, DateTime.utc(2026, 3, 1));
      expect(b.above, 1500);
      expect(b.below, isNull);
      expect(AppValidators.validateOdometerInHistory(1500, b), 'validationOdometerAbove');
      expect(AppValidators.validateOdometerInHistory(1501, b), isNull);
    });

    test('a back-dated entry must sit between its neighbours', () {
      final b = AppValidators.odometerBounds(entries, DateTime.utc(2026, 1, 15));
      expect((b.above, b.below), (1000, 1500));
      expect(AppValidators.validateOdometerInHistory(1600, b), 'validationOdometerBelow');
      expect(AppValidators.validateOdometerInHistory(1200, b), isNull);
    });

    test('editing excludes the entry itself; services may share a reading', () {
      final b = AppValidators.odometerBounds(entries, DateTime.utc(2026, 2, 1), excludeId: 'b');
      expect((b.above, b.below), (1000, null));
      expect(
        AppValidators.validateOdometerInHistory(1000, b, strict: false),
        isNull,
      );
      expect(
        AppValidators.validateOdometerInHistory(999, b, strict: false),
        'validationOdometerAtLeast',
      );
    });

    test('empty cost / odometer get "required" codes, not "negative"', () {
      expect(AppValidators.validateCost(null), 'validationCostRequired');
      expect(AppValidators.validateOdometer(null), 'validationOdometerRequired');
      expect(AppValidators.validateFuelPrice(0), 'validationPriceRequired');
    });
  });

  test('decimal input accepts the id comma and the en point', () {
    expect(NumberInput.parseDecimal('35,5'), 35.5);
    expect(NumberInput.parseDecimal('35.5'), 35.5);
    expect(NumberInput.parseDecimal('QA'), isNull);
    expect(NumberInput.parseDecimal(''), isNull);
  });

  test('a later fill at a repeated odometer cannot steal the km/L interval', () {
    // QA repro: seed 24,500 km / 32.5 L, then a stray 24,500 km / 10 L entry.
    final s = AnalyticsService.computeFuelEfficiency([
      _fuel('seed0', DateTime.utc(2026, 9, 1), 24100, 30),
      _fuel('qa', DateTime.utc(2026, 11, 1), 24500, 10),
      _fuel('seed1', DateTime.utc(2026, 10, 1), 24500, 32.5),
    ]);
    expect(s.points.single.logId, 'seed1');
    expect(s.points.single.kmPerLiter, closeTo(400 / 32.5, 1e-9));
    expect(s.averageKmPerLiter, closeTo(400 / 32.5, 1e-9));
  });

  test('schedule reports ONE status: the more urgent trigger', () {
    // 4,500 km overdue but 193 days left: the card must say "overdue by km".
    final s = MaintenanceSchedule(
      id: 's',
      vehicleId: 'v1',
      title: 'Oil',
      category: 'Oil',
      intervalKm: 5000,
      intervalMonths: 12,
      lastPerformedOdometer: 15000,
      lastPerformedDate: AppTimeZone.nowUtc(),
    );
    final t = s.mostUrgentTrigger(24500);
    expect(t.byKm, isTrue);
    expect(t.remaining, -4500);
    // Plenty of km left, ~10 days left: report the days.
    final aging = s.copyWith(
      lastPerformedDate: AppTimeZone.nowUtc().subtract(const Duration(days: 355)),
    );
    final soon = aging.mostUrgentTrigger(15100);
    expect(soon.byKm, isFalse);
    expect(soon.remaining, lessThanOrEqualTo(14));
  });

  testWidgets('fuel sheet rejects a repeated odometer and filters letters', (tester) async {
    final c = await _pump(tester, const FuelLogsScreen(), fuels: [
      _fuel('old', DateTime.utc(2026, 9, 14), 1000, 30),
      _fuel('new', DateTime.utc(2026, 9, 24), 1500, 25),
    ]);
    await tester.tap(find.byTooltip('Log Fuel Fill-Up'));
    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(const Key('fuel-liters')), 'QA');
    expect(tester.widget<TextFormField>(find.byKey(const Key('fuel-liters'))).controller!.text, isEmpty);
    await tester.enterText(find.byKey(const Key('fuel-liters')), '35,5');
    // Odometer is prefilled with the vehicle's 1,500 km: same as the last fill.
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();
    expect(find.text('Odometer must be above 1.500 km'), findsOneWidget);
    expect(c.read(fuelLogsProvider), hasLength(2));

    // Live re-validation clears the error as soon as the reading is valid.
    await tester.enterText(find.byKey(const Key('fuel-odometer')), '1900');
    await tester.pump();
    expect(find.text('Odometer must be above 1.500 km'), findsNothing);
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();
    final saved = c.read(fuelLogsProvider).firstWhere((f) => f.odometer == 1900);
    expect(saved.liters, 35.5);
  });

  testWidgets('deleting a fill-up offers Undo that restores it', (tester) async {
    final c = await _pump(tester, const FuelLogsScreen(), fuels: [
      _fuel('old', DateTime.utc(2026, 9, 14), 1000, 30),
      _fuel('new', DateTime.utc(2026, 9, 24), 1500, 25),
    ]);
    await tester.tap(find.byTooltip('Delete').first);
    await tester.pumpAndSettle();
    expect(c.read(fuelLogsProvider), hasLength(1));
    expect(find.text('Deleted'), findsOneWidget);
    await tester.tap(find.text('Undo'));
    await tester.pumpAndSettle();
    expect(c.read(fuelLogsProvider).map((f) => f.id), containsAll(['old', 'new']));
  });

  testWidgets('tapping a fill-up opens it for editing', (tester) async {
    await _pump(tester, const FuelLogsScreen(), fuels: [
      _fuel('old', DateTime.utc(2026, 9, 14), 1000, 30),
    ]);
    await tester.tap(find.textContaining('1.000 km').first);
    await tester.pumpAndSettle();
    expect(find.text('Edit Fuel Log'), findsOneWidget);
    expect(find.text('Fill-up Date'), findsOneWidget);
  });

  testWidgets('service form: oil switch off by default, cost error is "required" and clears live', (tester) async {
    await _pump(tester, const MaintenanceScreen(initialTab: 1));
    await tester.tap(find.byTooltip('Log New Service').first);
    await tester.pumpAndSettle();

    final oil = tester.widget<SwitchListTile>(find.byKey(const Key('service-oil-switch')));
    expect(oil.value, isFalse);
    expect(find.text('Service Date'), findsOneWidget);

    await tester.enterText(find.byKey(const Key('service-title')), 'Tyre rotation');
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();
    expect(find.text('Enter the total cost (0 if free)'), findsOneWidget);

    await tester.enterText(find.byKey(const Key('service-cost')), '850000');
    await tester.pump();
    expect(find.text('Enter the total cost (0 if free)'), findsNothing);
  });

  testWidgets('dashboard: owner info first, gamification last; FAB hides while scrolling down', (tester) async {
    await _pump(tester, const GarageDashboardScreen());
    final scrollable = find
        .descendant(of: find.byType(SingleChildScrollView), matching: find.byType(Scrollable))
        .first;

    await tester.drag(scrollable, const Offset(0, -300));
    await tester.pumpAndSettle();
    final fabOpacity = tester.widget<AnimatedOpacity>(
      find.ancestor(of: find.byType(FloatingActionButton), matching: find.byType(AnimatedOpacity)),
    );
    expect(fabOpacity.opacity, 0, reason: 'FAB hides while scrolling down');

    await tester.drag(scrollable, const Offset(0, 120));
    await tester.pumpAndSettle();
    expect(
      tester.widget<AnimatedOpacity>(
        find.ancestor(of: find.byType(FloatingActionButton), matching: find.byType(AnimatedOpacity)),
      ).opacity,
      1,
      reason: 'FAB returns on scroll up',
    );

    await tester.drag(scrollable, const Offset(0, -20000));
    await tester.pumpAndSettle();
    // Same scroll state: the cost metrics sit above the badges card.
    final odoY = tester.getTopLeft(find.text('Odometer (km)').first).dy;
    final badgesY = tester.getTopLeft(find.byType(GarageAchievementsCard)).dy;
    expect(badgesY, greaterThan(odoY));
  });
}
