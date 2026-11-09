import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:utility_toolbox/app.dart';
import 'package:utility_toolbox/core/services/ads_service.dart';
import 'package:utility_toolbox/core/services/iap_service.dart';
import 'package:utility_toolbox/core/services/notification_service.dart';
import 'package:utility_toolbox/core/services/storage_service.dart';
import 'package:utility_toolbox/features/timezone/providers/timezone_providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Hive.initFlutter();
  } catch (e) {
    debugPrint('Hive.initFlutter error: $e');
  }

  final prefs = await SharedPreferences.getInstance();
  final storageService = StorageService(prefs);
  try {
    await storageService.initHive();
  } catch (e) {
    debugPrint('storageService.initHive error: $e');
  }

  final container = ProviderContainer(
    overrides: [storageServiceProvider.overrideWithValue(storageService)],
  );

  if (!kIsWeb) {
    // Defer heavy initializations until after first frame to reduce cold-start latency.
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        await NotificationService.initialize();
      } catch (e, st) {
        debugPrint('NotificationService init failed: $e\n$st');
      }
      try {
        await container.read(adsServiceProvider).initialize();
      } catch (e, st) {
        debugPrint('AdsService init failed: $e\n$st');
      }
      try {
        await container.read(iapServiceProvider).initialize();
      } catch (e, st) {
        debugPrint('IAPService init failed: $e\n$st');
      }
      try {
        await container.read(timezoneActionsProvider).syncWidgetWithCurrentPins();
      } catch (e, st) {
        debugPrint('World Clock widget sync failed: $e\n$st');
      }
    });
  }

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const UtilityToolboxApp(),
    ),
  );
}
