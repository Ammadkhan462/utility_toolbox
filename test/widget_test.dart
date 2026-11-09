import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:utility_toolbox/app.dart';
import 'package:utility_toolbox/core/services/storage_service.dart';

Future<void> _pumpApp(WidgetTester tester, Map<String, Object> prefs) async {
  SharedPreferences.setMockInitialValues(prefs);
  final storage = StorageService(await SharedPreferences.getInstance());
  await tester.pumpWidget(
    ProviderScope(
      overrides: [storageServiceProvider.overrideWithValue(storage)],
      child: const UtilityToolboxApp(),
    ),
  );
  await tester.pumpAndSettle(const Duration(seconds: 1));
}

void main() {
  testWidgets('first launch shows onboarding', (tester) async {
    await _pumpApp(tester, {});
    expect(find.text('Skip'), findsOneWidget);
  });

  testWidgets('returning user lands on Tools with quick actions and search', (tester) async {
    await _pumpApp(tester, {'has_seen_onboarding': true});
    expect(find.text('Quick actions'), findsOneWidget);
    expect(find.text('Document Scanner'), findsWidgets);
    expect(find.byType(NavigationBar), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'compress pdf');
    await tester.pumpAndSettle();
    expect(find.text('Compress PDF'), findsWidgets);
    expect(find.text('Quick actions'), findsNothing);
  });

  testWidgets('My Files tab shows the empty state', (tester) async {
    await _pumpApp(tester, {'has_seen_onboarding': true});
    await tester.tap(find.text('My Files'));
    await tester.pumpAndSettle();
    expect(find.text('No files yet'), findsOneWidget);
  });

  testWidgets('UI follows the saved language', (tester) async {
    await _pumpApp(tester, {'has_seen_onboarding': true, 'locale_code': 'es'});
    expect(find.text('Quick actions'), findsNothing);
    expect(find.byType(NavigationBar), findsOneWidget);
  });
}
