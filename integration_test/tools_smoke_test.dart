// On-device smoke test: opens every registered tool on a real Android
// device/emulator (real plugins, real platform channels), lets it settle and
// fails on any uncaught Flutter or async error.
//
//   flutter test integration_test/tools_smoke_test.dart -d <device-id>
//
// Grant runtime permissions first so system dialogs don't cover the app:
//   adb shell pm grant com.utilitytoolbox.smarttools android.permission.CAMERA
//   (and ACCESS_FINE_LOCATION, RECORD_AUDIO, POST_NOTIFICATIONS)
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:integration_test/integration_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:utility_toolbox/app.dart';
import 'package:utility_toolbox/core/services/storage_service.dart';
import 'package:utility_toolbox/core/tools/tool_registry.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('every tool opens without errors', (tester) async {
    SharedPreferences.setMockInitialValues({'has_seen_onboarding': true});
    // Same storage start-up as main.dart (Clipboard needs its Hive box open).
    await Hive.initFlutter();
    final storage = StorageService(await SharedPreferences.getInstance());
    await storage.initHive();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [storageServiceProvider.overrideWithValue(storage)],
        child: const UtilityToolboxApp(),
      ),
    );
    await tester.pump(const Duration(seconds: 2));

    final failures = <String>[];
    // Tools that hand over to a system activity as soon as they open (the
    // Play services document scanner) pause the app, so skip them with
    // --dart-define=SMOKE_SKIP=doc_scanner on devices without Play sign-in.
    const skip = String.fromEnvironment('SMOKE_SKIP');
    for (final tool in ToolRegistry.all) {
      if (skip.split(',').contains(tool.id)) continue;
      final errors = <String>[];
      final oldOnError = FlutterError.onError;
      FlutterError.onError = (d) => errors.add(d.exceptionAsString());

      final context = tester.element(find.byType(Navigator).first);
      unawaited(GoRouter.of(context).push(tool.route));
      // Not pumpAndSettle: scanners, compasses and timers animate forever.
      for (var i = 0; i < 20; i++) {
        await tester.pump(const Duration(milliseconds: 100));
      }
      final ex = tester.takeException();
      if (ex != null) errors.add('$ex');
      if (find.byType(Scaffold).evaluate().isEmpty) errors.add('no Scaffold rendered');

      GoRouter.of(context).pop();
      for (var i = 0; i < 6; i++) {
        await tester.pump(const Duration(milliseconds: 100));
      }
      final exPop = tester.takeException();
      if (exPop != null) errors.add('on close: $exPop');
      FlutterError.onError = oldOnError;

      debugPrint('SMOKE ${tool.id}: ${errors.isEmpty ? 'ok' : errors.join(' | ')}');
      if (errors.isNotEmpty) failures.add('${tool.id}: ${errors.first}');
    }
    expect(failures, isEmpty, reason: failures.join('\n'));
  });
}
