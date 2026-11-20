// Contrast coverage (DESIGN_GUIDANCE rule 1): every main screen and the
// maintenance sub-tabs, seeded with the demo garage, in light AND dark at
// phone size with real fonts. No text may fall below WCAG AA.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:garagego/core/constants/app_colors.dart';
import 'package:garagego/core/providers/app_providers.dart';
import 'package:garagego/core/router/app_router.dart';
import 'package:garagego/core/storage/local_storage_service.dart';
import 'package:garagego/core/utils/app_timezone.dart';
import 'package:garagego/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../support/contrast_audit.dart';
import '../support/real_fonts.dart';

Future<void> _boot(WidgetTester tester, String mode) async {
  tester.view.physicalSize = const Size(1170, 2532);
  tester.view.devicePixelRatio = 3;
  addTearDown(tester.view.reset);
  SharedPreferences.setMockInitialValues({
    'locale': 'id',
    'onboarding_completed': true,
    'theme_mode': mode,
  });
  // Seeds the demo garage (2 vehicles, service/fuel logs, schedules, docs).
  final storage = await LocalStorageService.init();
  await tester.pumpWidget(
    ProviderScope(
      overrides: [localStorageServiceProvider.overrideWithValue(storage)],
      child: const GarageGoApp(),
    ),
  );
  await tester.pumpAndSettle();
}

Future<List<String>> _auditAllScreens(WidgetTester tester, Color base) async {
  final issues = <String>[];
  void audit(String where) =>
      issues.addAll(lowContrastTexts(tester, base: base).map((i) => '$where $i'));

  for (final route in ['/', '/fuel', '/glovebox', '/settings']) {
    appRouter.go(route);
    await tester.pumpAndSettle();
    audit(route);
  }

  appRouter.go('/maintenance');
  await tester.pumpAndSettle();
  audit('/maintenance schedules');
  for (final (icon, name) in [
    (Icons.history, 'history'),
    (Icons.fact_check_outlined, 'inspections'),
  ]) {
    await tester.tap(find.descendant(of: find.byType(TabBar), matching: find.byIcon(icon)));
    await tester.pumpAndSettle();
    audit('/maintenance $name');
  }
  return issues;
}

void main() {
  setUpAll(() async {
    await loadRealRoboto();
    AppTimeZone.initAppTimeZones();
  });

  for (final (mode, base) in [
    ('light', AppColors.bgLight),
    ('dark', AppColors.bgDark),
  ]) {
    testWidgets('every main screen is readable in $mode (WCAG AA)', (tester) async {
      await _boot(tester, mode);
      expect(await _auditAllScreens(tester, base), isEmpty);
    });
  }
}
