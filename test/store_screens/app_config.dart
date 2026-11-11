// Per-app hook for the store screen harness (store_screens_test.dart).
// install-harness.sh never overwrites this file. Checklist:
// tools/gen-store-scaffold/flutter_harness/README.md.
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:garagego/core/providers/app_providers.dart';
import 'package:garagego/core/router/app_router.dart';
import 'package:garagego/core/storage/local_storage_service.dart';
import 'package:garagego/core/utils/app_timezone.dart';
import 'package:garagego/main.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Splash hands off after 750 ms.
const kStoreSplash = Duration(seconds: 1);

Future<void> storeSetUpAll() async {
  AppTimeZone.initAppTimeZones();
  AppTimeZone.cachedDeviceZone = 'Asia/Jakarta';
  PackageInfo.setMockInitialValues(
    appName: 'GarageGo',
    packageName: 'id.faishal.garagego',
    version: '1.0.0',
    buildNumber: '1',
    buildSignature: '',
  );
}

/// Same state main() produces under STORE_DEMO: the saved locale drives both
/// the seed language and the UI language; onboarding already done.
Future<Widget> storeBuildApp(String lang) async {
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

Future<void> storeGo(WidgetTester tester, String route) async =>
    appRouter.go(route);

Future<void> storeAfterNavigate(
    WidgetTester tester, int slide, String action) async {
  if (action.isNotEmpty) {
    throw UnimplementedError('garagego has no slide actions (got "$action")');
  }
}
