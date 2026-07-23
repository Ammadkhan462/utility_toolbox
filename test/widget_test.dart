import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:utility_toolbox/app.dart';
import 'package:utility_toolbox/core/services/storage_service.dart';

void main() {
  testWidgets('Home screen renders app title', (tester) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    final storage = StorageService(prefs);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          storageServiceProvider.overrideWithValue(storage),
        ],
        child: const UtilityToolboxApp(),
      ),
    );

    expect(find.text('Utility Toolbox'), findsOneWidget);
  });
}
