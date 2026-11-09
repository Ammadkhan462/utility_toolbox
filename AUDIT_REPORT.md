# Utility Toolbox — Application Audit

Date: 2026-11-10
Scope: `lib/` (22,164 lines Dart), `android/`, `ios/`, `pubspec.yaml`, repository hygiene.
Baseline: `flutter analyze` → 0 issues. `flutter test` → 1/1 passing (a single "app builds" smoke test).
Published as `com.utilitytoolbox.smarttools` on Google Play, version `1.0.0+7`, listed as "Contains ads".

---

## 1. Critical — fix before the next release

| # | Finding | Where |
|---|---------|-------|
| C1 | **Live AdMob ad unit IDs are placeholders.** Release builds request `ca-app-pub-7294611786504566/XXXXXXXXXX`, so the shipped app can never load a real ad. The listing says "Contains ads" but earns nothing. | `lib/core/constants/ad_unit_ids.dart:16-18` |
| C2 | **Privacy policy URL is `https://example.com/...`.** The Settings link goes nowhere. Play requires a working policy for apps using camera, mic, location, ads and IAP. This is a removal-grade policy violation. | `lib/core/constants/app_constants.dart:6-7`, `lib/features/settings/screens/settings_screen.dart:126` |
| C3 | **User photos are uploaded to a public Cloud Run server while the UI says "no internet needed".** The upscaler tries the cloud path first, POSTs the full image to `ai-upscaler-994914491739.us-central1.run.app` with no auth token (`cloudApiToken = ''`) and no consent dialog. The backend has CORS `*` and auth disabled when `API_TOKEN` is unset. Undisclosed data transfer is a Data Safety violation and the endpoint is abusable by anyone. | `lib/features/ai_upscaler/services/ai_upscaler_service.dart:19-24,74-85,132-136`, `lib/features/ai_upscaler/screens/ai_upscaler_screen.dart:135,150`, `ai_upscaler_backend/app.py:29,36` |
| C4 | **The shipped source is not in git.** HEAD is the July commit; the working tree has 77 modified tracked files (+6,620 / −1,281) and large untracked sets: the whole `assets/` dir (icons and the 13 MB TFLite models), all new Android `res/` folders, `WorldClockWidgetProvider.kt`, `proguard-rules.pro`, the backend. A fresh clone cannot build the app that is on the store. | `git status` |

## 2. High

| # | Finding | Where |
|---|---------|-------|
| H1 | **No GDPR / UMP consent flow for AdMob.** Ads initialise and load with a plain `AdRequest()`; no `ConsentInformation` anywhere. Required for EEA/UK users. | `lib/core/services/ads_service.dart:14-18` |
| H2 | **Remove-ads entitlement is an unverified SharedPreferences bool.** Set to `true` on `purchased`/`restored` without checking `verificationData`. Trivially spoofable on rooted devices. | `lib/core/services/iap_service.dart:57-63`, `lib/core/services/storage_service.dart:70-74` |
| H3 | **Release build has no shrinking or obfuscation.** `isMinifyEnabled = false`, `isShrinkResources = false`, so the 50-line `proguard-rules.pro` is dead and the APK ships every unused class from ffmpeg, Syncfusion, ML Kit and TFLite. | `android/app/build.gradle.kts:52-55` |
| H4 | **FileProvider referenced but never declared.** `MainActivity.saveToDownloads` uses `"$packageName.fileprovider"` on Android 7–9 (minSdk 24), but the manifest has no `<provider>`. Every Downloads save on those devices throws and silently falls back to the share sheet. `res/xml/file_paths.xml` is orphaned. | `android/app/src/main/kotlin/.../MainActivity.kt:92-94`, `AndroidManifest.xml` |
| H5 | **Sensitive data stored in plaintext and included in cloud backups.** Clipboard captures (passwords, OTPs) in Hive box `clipboard_items` with no cipher and no retention cap; GPS history in SharedPreferences; QR scan history keeps raw `WIFI:...P:<password>` payloads. No `allowBackup="false"` or `dataExtractionRules`. | `lib/features/smart_clipboard/providers/clipboard_providers.dart:119`, `lib/features/location_saver/providers/location_providers.dart:99,117-123`, `lib/core/services/storage_service.dart:28,37,128` |
| H6 | **Ping / lookup pass raw user input into URLs and DNS.** `http.head(Uri.parse('https://$host'))` with no validation; 20 requests at 800 ms can be pointed at any host or path. | `lib/features/ip_ping/providers/ip_ping_providers.dart:68,73,149,166` |
| H7 | **Compass sensor streams never stop.** `compassProvider` is not `autoDispose`; accelerometer + magnetometer subscriptions live for the app lifetime after the first visit. Battery drain. | `lib/features/compass/providers/compass_providers.dart:44-54,100-102` |
| H8 | **Upscaler cancel leaks the run.** `cancel()` kills the isolate but the caller awaits `receivePort.first` forever; both ports only closed on the success path. | `lib/features/ai_upscaler/services/ai_upscaler_service.dart:39-42,311-315,422-424` |
| H9 | **Heavy work on the UI isolate.** File hashing (whole file in memory, synchronous), pure-Dart image fallback encode, and Word→PDF layout all run on the main isolate. ANR risk on large inputs. | `hash_generator_screen.dart:296-297`, `image_compressor_service.dart:53-65`, `word_to_pdf_providers.dart:78-113` |
| H10 | **Repository is full of junk and two ~1 GB heap dumps.** 29 `*.zip` backups (~230 MB), 16 `hs_err_pid*.log`, 9 `replay_pid*.log`, `android/java_pid22516.hprof` (1.14 GB) and `java_pid30000.hprof` (0.96 GB). The hprofs come from `-XX:+HeapDumpOnOutOfMemoryError` in `gradle.properties` and can contain signing secrets from memory. | project root, `android/`, `android/gradle.properties:1` |

## 3. Medium

- **M1 — No per-screen provider is `autoDispose`.** 66 `StateProvider`s, 11 `StateNotifierProvider`s, zero `autoDispose`. Reopening any tool shows the previous session's image/result and keeps `File` objects in memory. Also a 1 Hz `clockTickProvider` runs for the app lifetime (`timezone_providers.dart:110-112`).
- **M2 — iOS config is not shippable.** `GADApplicationIdentifier` is Google's *test* app ID; no `NSMicrophoneUsageDescription`, `NSSpeechRecognitionUsageDescription` or `NSLocationWhenInUseUsageDescription` (the app uses all three), no `SKAdNetworkItems`, no `NSUserTrackingUsageDescription`. First mic or location access on iOS would crash. (`ios/Runner/Info.plist`)
- **M3 — Android permission declarations.** `READ_EXTERNAL_STORAGE`/`WRITE_EXTERNAL_STORAGE` without `maxSdkVersion` (Play flags this on targetSdk 36); `ACCESS_FINE_LOCATION` without `ACCESS_COARSE_LOCATION` (Android 12+ requires both so users can choose approximate); no `<uses-feature android:name="android.hardware.camera" android:required="false"/>`, so camera-less devices are excluded from the listing; no `<queries>` for `url_launcher`. (`AndroidManifest.xml:3-16`)
- **M4 — World Clock widget exact alarms.** Kotlin calls `setExactAndAllowWhileIdle` every minute, but `SCHEDULE_EXACT_ALARM`/`USE_EXACT_ALARM` is not declared, so on Android 12+ it always takes the inexact fallback and the widget drifts. If you do declare it, Play requires justification for a clock widget. (`WorldClockWidgetProvider.kt:224-248`)
- **M5 — Third-party data flows not disclosed.** ipinfo.io is called automatically on opening the Ping tool (device IP → geo); speed test contacts Cloudflare and `api.fast.com` with a hard-coded public token; `speech_to_text` sends audio to the OS recogniser (Google). None appear in a privacy policy or Data Safety form. (`ip_ping_providers.dart:39-47`, `wifi_speed_test_service.dart:37,66`)
- **M6 — Scanned / clipboard URLs opened without confirmation.** Clipboard uses `Uri.parse(item.content)` with no try/catch; a malformed string throws. (`smart_clipboard_screen.dart:450-453`, `qr_scanner_screen.dart:105-118`)
- **M7 — Image enhancer shows stale output.** Output path is fixed `${name}_enhanced.jpg`; Flutter's `ImageCache` keys by path so re-applying shows the old render. (`image_enhancer_service.dart:22`, `image_enhancer_screen.dart:77`)
- **M8 — Video converter.** No cancel path, progress stuck at 0.1 until completion, command built by string interpolation with quoted paths (breaks on `"` in filenames). Use `executeWithArguments` + `enableStatisticsCallback`. (`video_converter_providers.dart:174-188`)
- **M9 — Fragile Gradle setup.** `android/build.gradle.kts` reflectively forces `compileSdk 36` into every plugin subproject and rewrites every Kotlin task's JVM target; `enableJetifier=true`; AGP 9.0.1 / Kotlin 2.3.20 / Gradle 9.1 with `builtInKotlin=false` and `newDsl=false` migration flags. Works today, will break on the next plugin bump.
- **M10 — Kotlin source directory mismatch.** Files live in `kotlin/com/utilitytoolbox/utility_toolbox/` but declare `package com.utilitytoolbox.smarttools`.
- **M11 — Three save paths, three PDF libraries.** Gallery saves via `gal` with `saver_gallery` fallback in one place, Downloads via a custom MethodChannel; album names differ (`Utility Toolbox`, `UtilityBox`, `Pictures/UtilityToolbox`). PDF via `pdf`, `syncfusion_flutter_pdf` (merge only) and `printing` (raster only). Syncfusion also requires a registered (community) licence.
- **M12 — Architecture inconsistency.** `image_compressor_screen.dart:18`, `image_enhancer_screen.dart:16` and `hash_generator_screen.dart:16` instantiate services as globals and run Loading/Success/Error orchestration inside widgets. `Result<T>` is used by 6 features; the rest roll their own status enums. God widgets: `ocr_screen.dart` 1,182 lines, `ai_upscaler_screen.dart` 1,005, `tool_grid.dart` 976 (hard-coded 22-tool catalogue), `image_enhancer_screen.dart` 905.
- **M13 — No localisation.** `lib/l10n/` is empty; ~890 hard-coded English strings in a translation app.

## 4. Low

- `lib/features/image_compressor/providers/Untitled` is a stale copy of the providers file; `lib/AI_MODEL_SETUP.md` is a doc inside `lib/`; `.github/modernize/java-upgrade/` is a leftover from a VS Code extension; `README.md` is Flutter boilerplate.
- Seven empty `catch (_) {}` blocks (`storage_service.dart:33,42`, `color_picker_screen.dart:154`, `ocr_service.dart:110,181`, `translation_voice_service.dart:196`, `word_to_pdf_screen.dart:288`).
- `debugPrint` of backend error bodies and IAP errors is not gated on `kDebugMode`.
- Dialog `TextEditingController`s never disposed (`location_saver_screen.dart:97-98`, `smart_clipboard_screen.dart:50,480`); `hash_generator_screen.dart:293-305` uses `ref` after `await` with no mounted guard.
- `interpreter.close()` not in `finally`; GPU probe interpreter leaks if the probe throws (`real_esrgan_processor.dart:205,254-276`). `_DoubleSqrt` reimplements `dart:math.sqrt`.
- Size formatter duplicated three times. `PermissionService.requestPhotos()` is dead code. Replicate code path in the upscaler is dead code with no polling timeout.
- Unused platform folders (`web/`, `windows/`, `linux/`, `macos/`) are tracked and generate churn in every diff.
- Test coverage: one smoke test. No unit tests for pure logic (`text_service`, `conversion_data`, hash, QR classify, loan maths).

### Unused or redundant dependencies

| Package | Imported in `lib/`? | Note |
|---|---|---|
| `cupertino_icons` | no | remove |
| `hive` | no (via `hive_flutter`) | remove direct dep |
| `flutter_native_splash` | no | move to `dev_dependencies` |
| `google_mlkit_language_id` | no | remove |
| `syncfusion_flutter_gauges` | no | remove |
| `web_socket_channel` | no | remove |
| `file_saver` | no | remove (explicitly rejected in `file_utils.dart`) |
| `saver_gallery` | 1 file, fallback only | consolidate with `gal` |
| `printing` | 1 file, raster only | consider dropping |
| `syncfusion_flutter_pdf` | 1 file, merge only | consider dropping or use it everywhere |

## 5. What is in good shape

- `flutter analyze` is clean with `flutter_lints`; the smoke test passes.
- Passwords use `Random.secure()`; Wi-Fi QR credentials are in-memory only.
- OCR and translation are fully on-device; the translator is closed in `finally`.
- `BannerAdWidget` creates one ad per mount and disposes it; IAP stream is cancelled; `MobileScannerController`, all `AnimationController`/`TabController`/`PageController` fields are disposed; most async code captures the messenger before awaits or checks `mounted`.
- Downloads go through MediaStore (API 29+) via a method channel; temp files use `getTemporaryDirectory()`; no cleartext endpoints, no `Process.run`, no custom TLS handling.
- Debug/profile builds correctly use Google's test ad IDs; signing keystore is git-ignored and not tracked.
- The World Clock widget is well-reasoned (RemoteViews-safe views, minute-aligned ticks, per-instance sizing).
- Routing: all 22 tools have routes, no dead routes; splash/onboarding flow is correct.

## 6. Recommended order of work

1. **Release blockers (C1–C3):** paste real ad unit IDs, publish a real privacy policy covering camera/mic/location/clipboard/ads/IAP and the ipinfo/Cloudflare/fast.com/Cloud Run transfers, update the Play Data Safety form, and either remove the cloud upscaler path or gate it behind an explicit opt-in with server auth.
2. **Get the source under control (C4, H10):** delete the hprofs, zips and crash logs, add them to `.gitignore`, remove `HeapDumpOnOutOfMemoryError`, then commit `assets/`, the Android resources, the Kotlin widget and the current `lib/`.
3. **Policy and build hygiene (H1, H3, H4, M2–M4):** add UMP consent, enable `minifyEnabled`/`shrinkResources` with the existing ProGuard rules, declare the FileProvider (or drop pre-Q support), fix manifest permissions, fix the iOS plist.
4. **Data protection (H2, H5, H6):** encrypt Hive with `HiveAesCipher` keyed from secure storage, add `allowBackup="false"` or extraction rules, cap clipboard retention, validate ping hosts, verify purchase tokens.
5. **Runtime quality (H7–H9, M1, M5–M8):** `autoDispose` per-screen providers, fix the upscaler cancel leak, move hashing/compress/Word→PDF onto isolates, fix enhancer cache and video converter.
6. **Structure (M9–M13, Low):** consolidate save/PDF helpers, prune dependencies, split god widgets, add unit tests for pure logic, delete stray files.
