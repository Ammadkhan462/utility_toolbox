import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:utility_toolbox/core/services/ads_service.dart';
import 'package:utility_toolbox/core/services/storage_service.dart';

class IapService {
  IapService(this._storage, this._adsService);

  static const String removeAdsProductId = 'remove_ads';

  final StorageService _storage;
  final AdsService _adsService;
  StreamSubscription<List<PurchaseDetails>>? _subscription;

  final InAppPurchase _iap = InAppPurchase.instance;

  Future<void> initialize() async {
    if (!await _iap.isAvailable()) return;

    _subscription = _iap.purchaseStream.listen(
      _onPurchaseUpdate,
      onError: (Object error) {
        debugPrint('IAP stream error: $error');
      },
    );

    if (_storage.getRemoveAdsPurchased()) return;

    final response = await _iap.queryProductDetails({removeAdsProductId});
    if (response.notFoundIDs.isNotEmpty) {
      debugPrint('IAP product not found: ${response.notFoundIDs}');
    }
  }

  Future<void> purchaseRemoveAds() async {
    if (_storage.getRemoveAdsPurchased()) return;
    if (!await _iap.isAvailable()) return;

    final response = await _iap.queryProductDetails({removeAdsProductId});
    if (response.productDetails.isEmpty) return;

    final purchaseParam = PurchaseParam(
      productDetails: response.productDetails.first,
    );
    await _iap.buyNonConsumable(purchaseParam: purchaseParam);
  }

  Future<void> restorePurchases() async {
    if (!await _iap.isAvailable()) return;
    await _iap.restorePurchases();
  }

  Future<void> _onPurchaseUpdate(List<PurchaseDetails> purchases) async {
    for (final purchase in purchases) {
      if (purchase.productID == removeAdsProductId) {
        switch (purchase.status) {
          case PurchaseStatus.purchased:
          case PurchaseStatus.restored:
            await _storage.setRemoveAdsPurchased(true);
            _adsService.dispose();
          case PurchaseStatus.error:
            debugPrint('Purchase error: ${purchase.error}');
          case PurchaseStatus.pending:
          case PurchaseStatus.canceled:
            break;
        }
      }

      if (purchase.pendingCompletePurchase) {
        await _iap.completePurchase(purchase);
      }
    }
  }

  void dispose() {
    _subscription?.cancel();
  }
}

final iapServiceProvider = Provider<IapService>((ref) {
  final storage = ref.watch(storageServiceProvider);
  final ads = ref.watch(adsServiceProvider);
  return IapService(storage, ads);
});
