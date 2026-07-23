import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:utility_toolbox/features/qr_barcode/models/scan_history_item.dart';

class StorageService {
  StorageService(this._prefs);

  final SharedPreferences _prefs;
  Box<Map>? _scanHistoryBox;

  static const _themeModeKey = 'theme_mode';
  static const _removeAdsKey = 'remove_ads_purchased';
  static const _lastInterstitialKey = 'last_interstitial_shown_at';
  static const _translationCountKey = 'translation_count';
  static const _scanHistoryBoxName = 'scan_history';

  Future<void> initHive() async {
    _scanHistoryBox = await Hive.openBox<Map>(_scanHistoryBoxName);
  }

  ThemeMode getThemeMode() {
    final value = _prefs.getString(_themeModeKey);
    return switch (value) {
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      _ => ThemeMode.system,
    };
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    final value = switch (mode) {
      ThemeMode.light => 'light',
      ThemeMode.dark => 'dark',
      ThemeMode.system => 'system',
    };
    await _prefs.setString(_themeModeKey, value);
  }

  bool getRemoveAdsPurchased() => _prefs.getBool(_removeAdsKey) ?? false;

  Future<void> setRemoveAdsPurchased(bool value) async {
    await _prefs.setBool(_removeAdsKey, value);
  }

  int getLastInterstitialShownAt() =>
      _prefs.getInt(_lastInterstitialKey) ?? 0;

  Future<void> setLastInterstitialShownAt(int epochMs) async {
    await _prefs.setInt(_lastInterstitialKey, epochMs);
  }

  int getTranslationCount() => _prefs.getInt(_translationCountKey) ?? 0;

  Future<void> incrementTranslationCount() async {
    final count = getTranslationCount() + 1;
    await _prefs.setInt(_translationCountKey, count);
  }

  Future<void> resetTranslationCount() async {
    await _prefs.setInt(_translationCountKey, 0);
  }

  List<ScanHistoryItem> getScanHistory() {
    final box = _scanHistoryBox;
    if (box == null) return [];

    return box.values
        .map((map) => ScanHistoryItem.fromMap(Map<String, dynamic>.from(map)))
        .toList()
      ..sort((a, b) => b.scannedAt.compareTo(a.scannedAt));
  }

  Future<void> addScanHistoryItem(ScanHistoryItem item) async {
    await _scanHistoryBox?.put(item.id, item.toMap());
  }

  Future<void> deleteScanHistoryItem(String id) async {
    await _scanHistoryBox?.delete(id);
  }

  Future<void> clearScanHistory() async {
    await _scanHistoryBox?.clear();
  }
}

final storageServiceProvider = Provider<StorageService>((ref) {
  throw UnimplementedError('StorageService must be overridden in main.dart');
});

final themeModeProvider = StateProvider<ThemeMode>((ref) {
  return ref.watch(storageServiceProvider).getThemeMode();
});
