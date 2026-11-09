import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:utility_toolbox/core/files/output_record.dart';
import 'package:utility_toolbox/features/qr_barcode/models/scan_history_item.dart';

class StorageService {
  StorageService(this._prefs);

  final SharedPreferences _prefs;
  Box<Map>? _scanHistoryBox;

  static const _themeModeKey = 'theme_mode';
  static const _removeAdsKey = 'remove_ads_purchased';
  static const _lastInterstitialKey = 'last_interstitial_shown_at';
  static const _translationCountKey = 'translation_count';
  static const _pinnedCitiesKey = 'pinned_cities';
  static const _scanHistoryBoxName = 'scan_history';
  static const _clipboardBoxName = 'clipboard_items';
  static const _hasSeenOnboardingKey = 'has_seen_onboarding';
  static const _cloudUpscaleEnabledKey = 'ai_upscaler_cloud_enabled';
  static const _favoritesKey = 'favorite_tools';
  static const _recentToolsKey = 'recent_tools';
  static const _outputsKey = 'output_records_v1';
  static const _successCountKey = 'success_count';
  static const _lastReviewPromptKey = 'last_review_prompt_at';
  static const _localeKey = 'locale_code';

  static const maxRecentTools = 8;
  static const maxOutputs = 100;

  static const _defaultPinnedCities = ['Lahore', 'London', 'New York', 'Dubai'];

  Future<void> initHive() async {
    try {
      _scanHistoryBox = await Hive.openBox<Map>(_scanHistoryBoxName);
    } catch (_) {
      try {
        await Hive.deleteBoxFromDisk(_scanHistoryBoxName);
        _scanHistoryBox = await Hive.openBox<Map>(_scanHistoryBoxName);
      } catch (_) {}
    }

    try {
      await Hive.openBox<Map>(_clipboardBoxName);
    } catch (_) {
      try {
        await Hive.deleteBoxFromDisk(_clipboardBoxName);
        await Hive.openBox<Map>(_clipboardBoxName);
      } catch (_) {}
    }
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

  bool getHasSeenOnboarding() => _prefs.getBool(_hasSeenOnboardingKey) ?? false;

  Future<void> setHasSeenOnboarding(bool value) async {
    await _prefs.setBool(_hasSeenOnboardingKey, value);
  }

  /// Whether the user has explicitly opted in to sending photos to the
  /// cloud upscaling server. Defaults to OFF: images never leave the device
  /// unless the user has accepted the consent dialog in the AI Upscaler.
  bool getCloudUpscaleEnabled() =>
      _prefs.getBool(_cloudUpscaleEnabledKey) ?? false;

  Future<void> setCloudUpscaleEnabled(bool value) async {
    await _prefs.setBool(_cloudUpscaleEnabledKey, value);
  }

  bool getRemoveAdsPurchased() => _prefs.getBool(_removeAdsKey) ?? false;

  Future<void> setRemoveAdsPurchased(bool value) async {
    await _prefs.setBool(_removeAdsKey, value);
  }

  int getLastInterstitialShownAt() => _prefs.getInt(_lastInterstitialKey) ?? 0;

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

  /// World Clock's pinned-city list.
  ///
  /// NOTE: this used to live purely in an in-memory StateProvider with a
  /// hardcoded default, so pins silently reset every time the app was
  /// killed and reopened — and, since nothing persisted, there was nothing
  /// durable for the World Clock home-screen widget to read either. Now
  /// it's backed by shared_preferences like the rest of the app's settings.
  List<String> getPinnedCities() {
    final raw = _prefs.getString(_pinnedCitiesKey);
    if (raw == null) return List.of(_defaultPinnedCities);
    try {
      final decoded = jsonDecode(raw);
      if (decoded is List) {
        return decoded.map((e) => e.toString()).toList();
      }
    } catch (_) {
      // Corrupted value — fall back to the default rather than crash.
    }
    return List.of(_defaultPinnedCities);
  }

  Future<void> setPinnedCities(List<String> cities) async {
    await _prefs.setString(_pinnedCitiesKey, jsonEncode(cities));
  }

  // ── Tools: favorites & recents ─────────────────────────────────────────

  List<String> getFavoriteTools() => _prefs.getStringList(_favoritesKey) ?? [];

  Future<void> setFavoriteTools(List<String> ids) async {
    await _prefs.setStringList(_favoritesKey, ids);
  }

  List<String> getRecentTools() => _prefs.getStringList(_recentToolsKey) ?? [];

  Future<void> setRecentTools(List<String> ids) async {
    await _prefs.setStringList(
      _recentToolsKey,
      ids.take(maxRecentTools).toList(),
    );
  }

  // ── My Files ───────────────────────────────────────────────────────────

  List<OutputRecord> getOutputs() {
    final raw = _prefs.getString(_outputsKey);
    if (raw == null) return [];
    try {
      final decoded = jsonDecode(raw);
      if (decoded is! List) return [];
      return decoded.map(OutputRecord.fromJson).whereType<OutputRecord>().toList();
    } catch (_) {
      return [];
    }
  }

  Future<void> setOutputs(List<OutputRecord> records) async {
    await _prefs.setString(
      _outputsKey,
      jsonEncode(records.take(maxOutputs).map((r) => r.toJson()).toList()),
    );
  }

  // ── Engagement (review prompt, ad pacing) ──────────────────────────────

  /// Number of jobs the user has completed successfully (files saved,
  /// scans done, …). Drives the in-app review prompt and ad pacing.
  int getSuccessCount() => _prefs.getInt(_successCountKey) ?? 0;

  Future<int> incrementSuccessCount() async {
    final next = getSuccessCount() + 1;
    await _prefs.setInt(_successCountKey, next);
    return next;
  }

  int getLastReviewPromptAt() => _prefs.getInt(_lastReviewPromptKey) ?? 0;

  Future<void> setLastReviewPromptAt(int epochMs) async {
    await _prefs.setInt(_lastReviewPromptKey, epochMs);
  }

  // ── Language ───────────────────────────────────────────────────────────

  /// Null means "follow the device language".
  String? getLocaleCode() => _prefs.getString(_localeKey);

  Future<void> setLocaleCode(String? code) async {
    if (code == null) {
      await _prefs.remove(_localeKey);
    } else {
      await _prefs.setString(_localeKey, code);
    }
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

/// Null = follow the device language.
final localeProvider = StateProvider<Locale?>((ref) {
  final code = ref.watch(storageServiceProvider).getLocaleCode();
  return code == null ? null : Locale(code);
});
