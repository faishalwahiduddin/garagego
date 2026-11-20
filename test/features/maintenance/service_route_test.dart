import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:garagego/core/providers/app_providers.dart';
import 'package:garagego/core/router/app_router.dart';
import 'package:garagego/core/storage/local_storage_service.dart';
import 'package:garagego/core/utils/app_timezone.dart';
import 'package:garagego/core/ui/form_sheet_body.dart';
import 'package:garagego/features/maintenance/maintenance_screen.dart';
import 'package:garagego/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../support/real_fonts.dart';

Future<void> _pumpApp(WidgetTester tester) async {
  SharedPreferences.setMockInitialValues({
    'locale': 'en',
    'onboarding_completed': true,
  });
  final storage = await LocalStorageService.init();
  await tester.pumpWidget(ProviderScope(
    overrides: [localStorageServiceProvider.overrideWithValue(storage)],
    child: const GarageGoApp(),
  ));
  await tester.pump(const Duration(seconds: 1));
  await tester.pumpAndSettle();
}

TabController _tabs(WidgetTester tester) =>
    tester.widget<TabBarView>(find.byType(TabBarView)).controller!;

void main() {
  // Real Roboto: phone-width layout measured like a device (no square-font
  // overflow false-positives; real overflows still fail the test).
  setUpAll(() async {
    AppTimeZone.initAppTimeZones();
    await loadRealRoboto();
  });

  setUp(() => appRouter.go('/splash'));

  testWidgets('/service redirects to maintenance with service tab selected',
      (tester) async {
    tester.view
      ..physicalSize = const Size(1170, 2532)
      ..devicePixelRatio = 3;
    addTearDown(tester.view.reset);

    await _pumpApp(tester);
    appRouter.go('/service');
    await tester.pumpAndSettle();

    expect(find.byType(MaintenanceScreen), findsOneWidget);
    expect(
      appRouter.routerDelegate.currentConfiguration.uri.path,
      '/maintenance',
    );
    expect(_tabs(tester).index, 1);
  });

  testWidgets('/maintenance opens the first tab', (tester) async {
    tester.view
      ..physicalSize = const Size(1170, 2532)
      ..devicePixelRatio = 3;
    addTearDown(tester.view.reset);

    await _pumpApp(tester);
    appRouter.go('/maintenance');
    await tester.pumpAndSettle();

    expect(_tabs(tester).index, 0);
  });

  testWidgets('fuel add form opens as a sheet, not a dialog', (tester) async {
    tester.view
      ..physicalSize = const Size(1170, 2532)
      ..devicePixelRatio = 3;
    addTearDown(tester.view.reset);

    await _pumpApp(tester);
    appRouter.go('/fuel');
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.add).first);
    await tester.pumpAndSettle();

    expect(find.byType(FormSheetBody), findsOneWidget);
    expect(find.byType(AlertDialog), findsNothing);
    expect(find.byType(TextFormField), findsWidgets);
  });
}
