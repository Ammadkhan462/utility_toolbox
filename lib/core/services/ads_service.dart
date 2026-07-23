import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:utility_toolbox/core/constants/ad_unit_ids.dart';
import 'package:utility_toolbox/core/constants/app_constants.dart';
import 'package:utility_toolbox/core/services/storage_service.dart';

class AdsService {
  AdsService(this._storage);

  final StorageService _storage;
  InterstitialAd? _interstitialAd;
  bool _isLoadingInterstitial = false;

  Future<void> initialize() async {
    await MobileAds.instance.initialize();
    if (!_storage.getRemoveAdsPurchased()) {
      loadInterstitial();
    }
  }

  bool get shouldShowAds => !_storage.getRemoveAdsPurchased();

  BannerAd? getBannerAd(String placement) {
    if (!shouldShowAds) return null;

    return BannerAd(
      adUnitId: AdUnitIds.banner,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    )..load();
  }

  void loadInterstitial() {
    if (!shouldShowAds || _isLoadingInterstitial || _interstitialAd != null) {
      return;
    }

    _isLoadingInterstitial = true;
    InterstitialAd.load(
      adUnitId: AdUnitIds.interstitial,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          _isLoadingInterstitial = false;
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
              _interstitialAd = null;
              loadInterstitial();
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              ad.dispose();
              _interstitialAd = null;
              loadInterstitial();
            },
          );
        },
        onAdFailedToLoad: (_) {
          _isLoadingInterstitial = false;
        },
      ),
    );
  }

  Future<void> showInterstitialIfAllowed() async {
    if (!shouldShowAds) return;

    final lastShown = _storage.getLastInterstitialShownAt();
    final now = DateTime.now().millisecondsSinceEpoch;
    final elapsed = now - lastShown;

    if (elapsed < AppConstants.interstitialCooldown.inMilliseconds) {
      return;
    }

    final ad = _interstitialAd;
    if (ad == null) {
      loadInterstitial();
      return;
    }

    await ad.show();
    await _storage.setLastInterstitialShownAt(now);
    _interstitialAd = null;
  }

  void dispose() {
    _interstitialAd?.dispose();
    _interstitialAd = null;
  }
}

final adsServiceProvider = Provider<AdsService>((ref) {
  final storage = ref.watch(storageServiceProvider);
  return AdsService(storage);
});
