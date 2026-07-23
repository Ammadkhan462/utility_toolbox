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

  Future<void> setThemeMode(ThemeMode mode) async {
    await _ref.read(storageServiceProvider).setThemeMode(mode);
    _ref.read(themeModeProvider.notifier).state = mode;
  }
}
