import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:utility_toolbox/app.dart';
import 'package:utility_toolbox/core/services/storage_service.dart';

void main() {
  testWidgets('App builds without crashing', (WidgetTester tester) async {
    // Mock SharedPreferences to avoid platform channel errors.
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    final storage = StorageService(prefs);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [storageServiceProvider.overrideWithValue(storage)],
        child: const UtilityToolboxApp(),
      ),
    );

    // Allow any async initialisation to settle.
    await tester.pumpAndSettle(const Duration(seconds: 1));
  });
}

