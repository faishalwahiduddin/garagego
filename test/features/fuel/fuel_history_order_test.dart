import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:garagego/core/models/vehicle.dart';
import 'package:garagego/core/providers/app_providers.dart';
import 'package:garagego/core/storage/local_storage_service.dart';
import 'package:garagego/core/theme/app_theme.dart';
import 'package:garagego/core/utils/app_timezone.dart';
import 'package:garagego/features/fuel/fuel_logs_screen.dart';
import 'package:garagego/l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../support/real_fonts.dart';

FuelLog _log(String id, DateTime date, int odo, double liters) => FuelLog(
      id: id,
      vehicleId: 'v1',
      date: date,
      odometer: odo,
      liters: liters,
      pricePerLiter: 10000,
    );

void main() {
  setUpAll(() async {
    await loadRealRoboto();
    AppTimeZone.initAppTimeZones();
  });

  test('sortFuelLogsNewestFirst: date desc, odometer desc tie-break, copy', () {
    final a = _log('a', DateTime.utc(2026, 9, 14), 1000, 30);
    final b = _log('b', DateTime.utc(2026, 9, 24), 1500, 25);
    final c = _log('c', DateTime.utc(2026, 9, 24), 1600, 25);
    final input = [a, b, c];
    final out = sortFuelLogsNewestFirst(input);
    expect(out.map((l) => l.id), ['c', 'b', 'a']);
    expect(input.map((l) => l.id), ['a', 'b', 'c']);
  });

  testWidgets('fill-up history shows newest first; km/L stays on newest', (tester) async {
    tester.view.physicalSize = const Size(1170, 2532);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.reset);

    SharedPreferences.setMockInitialValues({});
    final storage = await LocalStorageService.init();
    await storage.saveVehicles([
      Vehicle(
        id: 'v1',
        name: 'Test Car',
        type: VehicleType.car,
        plateNumber: 'B 1 TST',
        currentOdometer: 1500,
        manufactureYear: 2020,
        taxDueDate: DateTime.utc(2027, 1, 1),
      ),
    ]);
    // Old: 1000 km, new: 1500 km with 25 L => 500 km / 25 L = 20.0 km/L.
    await storage.saveFuelLogs([
      _log('old', DateTime.utc(2026, 9, 14), 1000, 30),
      _log('new', DateTime.utc(2026, 9, 24), 1500, 25),
    ]);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [localStorageServiceProvider.overrideWithValue(storage)],
        child: MaterialApp(
          theme: AppTheme.darkTheme,
          locale: const Locale('en'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const FuelLogsScreen(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    final oldY = tester.getTopLeft(find.textContaining('1.000 km').first).dy;
    final newY = tester.getTopLeft(find.textContaining('1.500 km').first).dy;
    expect(newY, lessThan(oldY), reason: 'newest entry must be listed first');

    // Summary cards also print 20.0 km/L; the per-entry chip is the 11pt one.
    final chip = find.byWidgetPredicate(
      (w) => w is Text && w.data == '20.0 km/L' && w.style?.fontSize == 11,
    );
    expect(chip, findsOneWidget);
    final chipY = tester.getTopLeft(chip).dy;
    expect(chipY, greaterThan(newY));
    expect(chipY, lessThan(oldY), reason: 'km/L chip belongs to the newer entry');
  });
}
