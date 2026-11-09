import 'package:flutter/foundation.dart';

/// AdMob unit IDs.
///
/// Debug/profile builds always use Google's official test IDs so you never
/// click your own live ads (which can get the AdMob account suspended).
///
/// Release builds read the live IDs from `--dart-define` so they are never
/// committed by accident and so a build cannot ship with a placeholder:
///
///   flutter build appbundle --release \
///     --dart-define=ADMOB_BANNER_ID=ca-app-pub-7294611786504566/1234567890 \
///     --dart-define=ADMOB_INTERSTITIAL_ID=ca-app-pub-7294611786504566/0987654321
///
/// Get the values from AdMob → Apps → Utility Toolbox → Ad units.
/// If either value is missing or malformed, [isConfigured] is false and the
/// app shows no ads at all instead of sending invalid requests.
class AdUnitIds {
  AdUnitIds._();

  // Google's official test IDs (used in debug/profile builds)
  static const String _testBanner = 'ca-app-pub-3940256099942544/6300978111';
  static const String _testInterstitial =
      'ca-app-pub-3940256099942544/1033173712';

  static const String _liveBanner = String.fromEnvironment('ADMOB_BANNER_ID');
  static const String _liveInterstitial = String.fromEnvironment(
    'ADMOB_INTERSTITIAL_ID',
  );

  static final RegExp _unitIdPattern = RegExp(r'^ca-app-pub-\d{16}/\d{10}$');

  static bool _isValid(String id) => _unitIdPattern.hasMatch(id);

  /// Whether this build can legitimately request ads.
  /// Always true outside release; in release, true only when both live IDs
  /// were supplied and look like real AdMob unit IDs.
  static bool get isConfigured =>
      !kReleaseMode || (_isValid(_liveBanner) && _isValid(_liveInterstitial));

  static String get banner => kReleaseMode ? _liveBanner : _testBanner;
  static String get interstitial =>
      kReleaseMode ? _liveInterstitial : _testInterstitial;
}
