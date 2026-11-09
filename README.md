# Utility Toolbox

Multi-tool Flutter app (QR, PDF, OCR, translation, image tools, network tools and more), published on Google Play as `com.utilitytoolbox.smarttools`.

- Audit findings and remediation plan: [AUDIT_REPORT.md](AUDIT_REPORT.md)
- Public privacy policy: [PRIVACY_POLICY.md](PRIVACY_POLICY.md)
- Optional cloud upscaler backend: [ai_upscaler_backend/](ai_upscaler_backend/)
- TFLite model setup: [docs/AI_MODEL_SETUP.md](docs/AI_MODEL_SETUP.md)

## Requirements

- Flutter 3.x with Dart SDK ^3.8
- Android: JDK 17, Android SDK 36, NDK 28.2.13676358
- `android/key.properties` + the release keystore (git-ignored, never commit)

## Build

Debug/profile builds use Google's test ad IDs automatically.

Release builds **must** receive the live AdMob unit IDs at build time, otherwise ads are disabled entirely (see `lib/core/constants/ad_unit_ids.dart`):

```bash
flutter build appbundle --release --dart-define=ADMOB_BANNER_ID=ca-app-pub-7294611786504566/XXXXXXXXXX --dart-define=ADMOB_INTERSTITIAL_ID=ca-app-pub-7294611786504566/XXXXXXXXXX
```

If the cloud upscaler backend is deployed with an `API_TOKEN`, pass the same value so the client can authenticate:

```bash
--dart-define=UPSCALER_API_TOKEN=<token>
```

## Checks

```bash
flutter analyze
```

```bash
flutter test
```

## Privacy

Photos never leave the device unless the user explicitly enables cloud mode in the AI Upscaler and accepts the consent dialog. Any new feature that transmits data must be added to `PRIVACY_POLICY.md` and to the Play Console Data Safety form before release.
