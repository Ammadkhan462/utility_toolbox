# Utility Toolbox

All-in-one offline utility app for Android (Flutter), published on Google Play as `com.utilitytoolbox.smarttools`: document scanner, PDF tools, QR, OCR, offline translation, photo resize/compress, calculators, converters and network tools.

- Growth strategy and why the app is shaped this way: [docs/GROWTH_STRATEGY.md](docs/GROWTH_STRATEGY.md)
- Audit findings: [AUDIT_REPORT.md](AUDIT_REPORT.md)
- Privacy policy (linked from the app and the store): [PRIVACY_POLICY.md](PRIVACY_POLICY.md)
- Play Store listing copy in 12 languages: [store_listing/](store_listing/)
- Optional cloud upscaler backend: [ai_upscaler_backend/](ai_upscaler_backend/)

## How the app is put together

| Area | Where | Notes |
|---|---|---|
| Tool catalogue | `lib/core/tools/tool_registry.dart` | One `ToolDefinition` per tool. Home, search, favorites, recents, shortcuts, deep links and the share sheet all read from it. Add a tool here, then add its route in `app_router.dart` and its strings in `lib/l10n/app_en.arb`. |
| Home | `lib/features/home/`, `lib/features/files/` | Tools tab (search, quick actions, favorites, recent, categories) and My Files tab. |
| Entry points | `MainActivity.kt`, `lib/core/intents/` | Share sheet, "Open with", text-selection Translate, launcher shortcuts (`res/xml/shortcuts.xml`), Quick Settings tile, pinned shortcuts, `utilitytoolbox://tool/<id>`. |
| Passing input to tools | `ToolInput` via GoRouter `extra` | Screens take it as constructor params, or via `SeedInput` for provider-based screens. |
| Saving files | `FileUtils.saveToDownloads` / `saveImageToGallery` | Always use these: they record the file in My Files and count a successful job (review prompt, ad pacing). |
| Ratings & ads pacing | `lib/core/services/engagement_service.dart`, `ads_service.dart` | Review after 3 jobs; interstitials only after 2 jobs, max 1 per 3 minutes; Google UMP consent first. |
| Localization | `lib/l10n/*.arb`, `l10n.yaml` | 12 languages for the shell, onboarding, settings and tool names. Tool screens are still English. Run `flutter gen-l10n` after editing ARB files. |

## Requirements

- Flutter 3.47+ (Dart ^3.8)
- Android: JDK 17, SDK 36, NDK 28.2.13676358
- `android/key.properties` + the release keystore (git-ignored). Without them, release builds fall back to debug signing so CI and worktrees can still build.

## Build a release

Run the release script. It passes the live AdMob unit IDs (without them ads are disabled, see `lib/core/constants/ad_unit_ids.dart`), obfuscates Dart code and copies the bundle and debug symbols into `release/`:

```bash
powershell -File tool/build_release.ps1
```

If the cloud upscaler backend has an `API_TOKEN`, also pass `--dart-define=UPSCALER_API_TOKEN=<token>`.

Bump `version:` in `pubspec.yaml` before every upload.

## Checks

```bash
flutter analyze
```

```bash
flutter test
```

## Before each Play release

1. Test on a real device: share a photo and a PDF into the app, select text in Chrome → Translate, long-press the icon, add the Quick Settings tile, scan a document, save a PDF and reopen it from My Files.
2. Upload the release notes and any listing changes from `store_listing/`.
3. Keep the Data Safety form in line with `PRIVACY_POLICY.md`.
4. Watch Android vitals (crash and ANR rate) for the first days of the rollout; use a staged rollout.

## Privacy

Photos never leave the device unless the user enables cloud mode in the AI Upscaler and accepts the consent dialog. Any new feature that sends data off the device must be added to `PRIVACY_POLICY.md` and the Data Safety form before release.
