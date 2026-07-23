import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:utility_toolbox/app.dart';
import 'package:utility_toolbox/core/services/ads_service.dart';
import 'package:utility_toolbox/core/services/iap_service.dart';
import 'package:utility_toolbox/core/services/storage_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  final prefs = await SharedPreferences.getInstance();
  final storageService = StorageService(prefs);
  await storageService.initHive();

  final container = ProviderContainer(
    overrides: [storageServiceProvider.overrideWithValue(storageService)],
  );

  if (!kIsWeb) {
    // Ads and IAP have no web implementation — skip entirely on Chrome/web.
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
  }

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const UtilityToolboxApp(),
    ),
  );
}
