import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:garagego/core/providers/app_providers.dart';
import 'package:garagego/core/storage/local_storage_service.dart';
import 'package:garagego/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
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
    expect(find.text('Toyota Innova Zenix (B 1234 ABC)'), findsOneWidget);
  });
}
