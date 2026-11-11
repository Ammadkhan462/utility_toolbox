import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utility_toolbox/core/services/iap_service.dart';
import 'package:utility_toolbox/core/services/storage_service.dart';

// autoDispose: re-read on every visit, so after buying/restoring "Remove ads"
// the tile disappears next time Settings opens (a plain Provider cached the
// first value for the whole app session).
final settingsRemoveAdsPurchasedProvider = Provider.autoDispose<bool>((ref) {
  return ref.watch(storageServiceProvider).getRemoveAdsPurchased();
});

final settingsActionsProvider = Provider<SettingsActions>((ref) {
  return SettingsActions(ref);
});

class SettingsActions {
  SettingsActions(this._ref);

  final Ref _ref;

  /// A purchase/restore flow is in flight; a second tap would start another
  /// billing flow and fail with "already in progress".
  bool _billingBusy = false;

  Future<void> purchaseRemoveAds() =>
      _billing(() => _ref.read(iapServiceProvider).purchaseRemoveAds());

  Future<void> restorePurchases() =>
      _billing(() => _ref.read(iapServiceProvider).restorePurchases());

  Future<void> _billing(Future<void> Function() action) async {
    if (_billingBusy) return;
    _billingBusy = true;
    try {
      await action();
    } catch (e) {
      // Billing unavailable / Play Store error: don't crash the settings page.
      debugPrint('Billing action failed: $e');
    } finally {
      _billingBusy = false;
      _ref.invalidate(settingsRemoveAdsPurchasedProvider);
    }
  }

  /// BUG FIX: The old code wrote to SharedPreferences but then tried to update
  /// [themeModeProvider], which is a computed StateProvider that reads from
  /// storage on first build — it never gets invalidated by a .notifier write
  /// in isolation. Now we update the StateProvider directly AND persist, so
  /// both the UI and storage stay in sync.
  Future<void> setThemeMode(ThemeMode mode) async {
    // 1. Update the live StateProvider first so MaterialApp.router rebuilds
    //    on the tap, not after the disk write.
    _ref.read(themeModeProvider.notifier).state = mode;
    // 2. Persist so it survives restarts.
    await _ref.read(storageServiceProvider).setThemeMode(mode);
  }
}
