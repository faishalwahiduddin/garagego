import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:garagego/core/models/vehicle.dart';
import 'package:garagego/core/providers/app_providers.dart';
import 'package:garagego/core/storage/local_storage_service.dart';
import 'package:garagego/core/theme/app_theme.dart';
import 'package:garagego/core/utils/app_timezone.dart';
import 'package:garagego/features/garage/garage_dashboard_screen.dart';
import 'package:garagego/l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../support/real_fonts.dart';

void main() {
  setUpAll(() async {
    await loadRealRoboto();
    AppTimeZone.initAppTimeZones();
  });

  testWidgets('scrolled to end, last content clears the Quick Actions FAB', (tester) async {
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

    await tester.pumpWidget(
      ProviderScope(
        overrides: [localStorageServiceProvider.overrideWithValue(storage)],
        child: MaterialApp(
          theme: AppTheme.darkTheme,
          locale: const Locale('en'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const GarageDashboardScreen(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    final scrollable = find
        .descendant(
          of: find.byType(SingleChildScrollView),
          matching: find.byType(Scrollable),
        )
        .first;
    await tester.drag(scrollable, const Offset(0, -20000));
    await tester.pumpAndSettle();

    final fabTop = tester.getTopLeft(find.byType(FloatingActionButton)).dy;
    final contentBottom = tester
        .getBottomLeft(
          find
              .descendant(
                of: find.byType(SingleChildScrollView).first,
                matching: find.byType(Column),
              )
              .first,
        )
        .dy;
    expect(contentBottom, lessThanOrEqualTo(fabTop));
  });
}
