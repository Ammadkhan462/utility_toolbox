/// Shared app-wide constants.
class AppConstants {
  AppConstants._();

  static const String appName = 'Utility Toolbox';
  static const String privacyPolicyUrl =
      'https://example.com/utility-toolbox-privacy';
  static const String playStoreUrl =
      'https://play.google.com/store/apps/details?id=com.utilitytoolbox.utility_toolbox';

  static const Duration interstitialCooldown = Duration(seconds: 60);
  static const int translationsBeforeInterstitial = 3;
}
