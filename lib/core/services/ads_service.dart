import 'dart:async';

import 'package:flutter/foundation.dart' show debugPrint;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:utility_toolbox/core/constants/ad_unit_ids.dart';
import 'package:utility_toolbox/core/constants/app_constants.dart';
import 'package:utility_toolbox/core/services/engagement_service.dart';
import 'package:utility_toolbox/core/services/storage_service.dart';

class AdsService {
  AdsService(this._storage);

  final StorageService _storage;
  InterstitialAd? _interstitialAd;
  bool _isLoadingInterstitial = false;

  bool _canRequestAds = false;

  Future<void> initialize() async {
    if (!AdUnitIds.isConfigured) {
      // Release build without real ad unit IDs (see AdUnitIds). Don't even
      // initialise the SDK: no ads, no invalid requests.
      debugPrint(
        '[AdsService] Live ad unit IDs not configured — ads disabled. '
        'Pass --dart-define=ADMOB_BANNER_ID/ADMOB_INTERSTITIAL_ID.',
      );
      return;
    }
    // Google UMP: shows the consent form to EEA/UK/Swiss users when needed
    // (Google requires this for AdMob), no-op elsewhere. Ads are only
    // requested once consent allows it.
    await _gatherConsent();
    _canRequestAds = await ConsentInformation.instance.canRequestAds();
    if (!_canRequestAds) return;

    await MobileAds.instance.initialize();
    if (shouldShowAds) {
      loadInterstitial();
    }
  }

  Future<void> _gatherConsent() {
    final done = Completer<void>();
    ConsentInformation.instance.requestConsentInfoUpdate(
      ConsentRequestParameters(),
      () async {
        await ConsentForm.loadAndShowConsentFormIfRequired((error) {
          if (error != null) debugPrint('[AdsService] consent form: ${error.message}');
          if (!done.isCompleted) done.complete();
        });
      },
      (error) {
        debugPrint('[AdsService] consent update failed: ${error.message}');
        if (!done.isCompleted) done.complete();
      },
    );
    return done.future;
  }

  /// Whether Settings must offer "Ad privacy choices" (UMP requirement).
  Future<bool> privacyOptionsRequired() async {
    if (!AdUnitIds.isConfigured) return false;
    try {
      return await ConsentInformation.instance.getPrivacyOptionsRequirementStatus() ==
          PrivacyOptionsRequirementStatus.required;
    } catch (_) {
      return false;
    }
  }

  Future<void> showPrivacyOptions() async {
    await ConsentForm.showPrivacyOptionsForm((error) {
      if (error != null) debugPrint('[AdsService] privacy options: ${error.message}');
    });
    _canRequestAds = await ConsentInformation.instance.canRequestAds();
  }

  bool get shouldShowAds =>
      AdUnitIds.isConfigured && _canRequestAds && !_storage.getRemoveAdsPurchased();

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
    // No full-screen ads until the user has finished a couple of jobs:
    // first impressions (and first ratings) shouldn't be ad-led.
    if (_storage.getSuccessCount() < EngagementService.adsAfterSuccesses) return;

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
