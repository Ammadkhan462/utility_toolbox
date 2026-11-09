import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utility_toolbox/core/services/iap_service.dart';
import 'package:utility_toolbox/core/services/storage_service.dart';

final settingsRemoveAdsPurchasedProvider = Provider<bool>((ref) {
  return ref.watch(storageServiceProvider).getRemoveAdsPurchased();
});

final settingsActionsProvider = Provider<SettingsActions>((ref) {
  return SettingsActions(ref);
});

class SettingsActions {
  SettingsActions(this._ref);

  final Ref _ref;

  Future<void> purchaseRemoveAds() =>
      _ref.read(iapServiceProvider).purchaseRemoveAds();

  Future<void> restorePurchases() =>
      _ref.read(iapServiceProvider).restorePurchases();

  /// BUG FIX: The old code wrote to SharedPreferences but then tried to update
  /// [themeModeProvider], which is a computed StateProvider that reads from
  /// storage on first build — it never gets invalidated by a .notifier write
  /// in isolation. Now we update the StateProvider directly AND persist, so
  /// both the UI and storage stay in sync.
  Future<void> setThemeMode(ThemeMode mode) async {
    // 1. Persist first so it survives restarts.
    await _ref.read(storageServiceProvider).setThemeMode(mode);
    // 2. Update the live StateProvider so MaterialApp.router rebuilds
    //    immediately without needing a hot restart.
    _ref.read(themeModeProvider.notifier).state = mode;
  }
}
