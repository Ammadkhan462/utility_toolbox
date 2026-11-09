/// Shared app-wide constants.
class AppConstants {
  AppConstants._();

  static const String appName = 'Utility Toolbox';
  /// Public privacy policy. Source of truth is PRIVACY_POLICY.md in the repo
  /// root; this URL must stay reachable for as long as the app is listed on
  /// Google Play (also enter it in Play Console → App content → Privacy
  /// policy). If you move it to a website, update both places.
  static const String privacyPolicyUrl =
      'https://github.com/Ammadkhan462/utility_toolbox/blob/master/PRIVACY_POLICY.md';
  static const String playStoreUrl =
      'https://play.google.com/store/apps/details?id=com.utilitytoolbox.smarttools';

  static const Duration interstitialCooldown = Duration(seconds: 60);
  static const int translationsBeforeInterstitial = 3;
}
