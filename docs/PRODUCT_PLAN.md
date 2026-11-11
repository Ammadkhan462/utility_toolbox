# Utility Toolbox: Product Plan

Updated 2026-11-11. Builds on [GROWTH_STRATEGY.md](GROWTH_STRATEGY.md) (store, reach) and [AUDIT_REPORT.md](../AUDIT_REPORT.md) (code health).

## 1. Goal

Be the one utility app people open every day. When they need to do something with a paper, a PDF, a photo, a QR code, a number or a message, the job should take under 10 seconds, work offline, and keep their files on the phone.

We win against single-purpose apps (CamScanner, iLovePDF, QR readers, calculators) on four things:

| Pillar | What it means in practice |
|---|---|
| **Fast to the job** | The app opens straight on the tools. Search understands everyday words. Users arrive from the share sheet, text selection, launcher shortcuts and the Quick Settings tile, so they rarely need to look for us. |
| **Works for everyone** | Big tap targets, plain words, 12 languages with right-to-left support, and good behaviour on 2 GB-RAM phones on slow data. |
| **Private and offline** | Scanning, PDF, OCR, translation and photo tools run on the phone. The network is used only where it's unavoidable (speed test, exchange rates, ads), and the privacy policy says so. |
| **Small and stable** | Every megabyte counts in our main markets. A crash-free rate above 99.5% and an ANR rate below 0.2% keep Play ranking us. |

## 2. Who uses it and what they need daily

| User | Daily jobs | Tools |
|---|---|---|
| Student | Scan notes, merge assignments, compress for upload, copy text from photos, translate | Doc Scanner, Merge/Compress PDF, OCR, Translate, PDF to Text |
| Office and small business | Sign and send PDFs, add page numbers, protect files, calculate GST/discounts, message customers | **Sign PDF**, **Watermark & Page Numbers**, Lock PDF, **Percentage & Discount**, **Direct Chat** |
| Form filler (jobs, visas, exams) | Resize photo to exact size, passport photo with white background, image to PDF under a size limit | Resize & Convert, **Remove Background**, Image to PDF, Compress |
| Traveller / overseas worker | Currency, time zones, translate, QR | **Currency Converter**, World Clock, Translate, QR |
| Everyone at home | Torch, timer, level, calculator, Wi-Fi QR | **Flashlight**, **Stopwatch & Timer**, **Bubble Level**, Calculator, Wi-Fi QR |

Tools in **bold** are new in 1.2.0.

## 3. Release 1.2.0 (this update)

**Brand**
- New logo: a flat four-tile toolbox (QR, document, text and AI spark) on the brand indigo, drawn as vectors from one source (`tool/logo/make_logo.py`). It's used for:
  - the adaptive launcher icon;
  - the Android 13 themed icon;
  - the notification icon;
  - the splash screen on all Android versions;
  - the in-app header;
  - the Play icon (`store_listing/icon_512.png`) and the feature graphic.

**12 new tools (33 to 45)**, chosen from what is trending in top utility apps and kept small (no bundled models):
- **PDF:** Sign PDF, Organize PDF (reorder, rotate, delete), Watermark & Page Numbers, PDF to Text.
- **Photo:** Remove Background (ML Kit model from Google Play services).
- **Calculate:** Currency Converter (150+ currencies, works offline from the last cached rates), Percentage & Discount (also tip split and GST/VAT), BMI.
- **Everyday:** Flashlight (SOS, strobe, screen light), Bubble Level, Stopwatch & Timer, Direct Chat.

**Quality**
- A line-by-line review of all 33 existing tools covering crashes, leaks, jank, number and date errors, and permission flows.
- An on-device smoke test (`integration_test/tools_smoke_test.dart`) opens every tool on an emulator and fails on any error.

**Size** (per-device download for arm64, measured from the release bundle):
- OCR switched to the Google Play services models, which removes the bundled ML Kit OCR library (about 4.4 MB). Hindi (Devanagari), Chinese, Japanese and Korean OCR are now available at no size cost.
- The AI Upscaler model (about 3.7 MB compressed) downloads the first time someone uses the tool, instead of every user downloading it.
- Old raster logos removed (about 1.7 MB).
- Dart code obfuscated, with symbols kept for crash reports.

## 4. Roadmap after 1.2.0

**1.3: Daily habit (4–6 weeks)**
- A home-screen widget with four quick actions (Scan, QR, Translate, Torch). Widgets are the strongest daily-return driver in this category.
- A "Continue where you left off" card and a recent-files strip on the Tools tab.
- Scanner upgrades: auto-crop presets (ID card, receipt, A4), OCR on scan, and searchable PDF output.
- PDF compression with a target-size picker ("under 200 KB"), because government and job portals require it.
- Passport and visa photo presets that chain Remove Background, then Resize to a country preset, then Print sheet.

**1.4: Smart tools**
- An in-app AI assistant for documents: summarise a PDF, explain a photo of a bill, draft a reply. It runs on-device where possible, with a clearly labelled opt-in cloud option.
- Batch mode everywhere: many photos to many PDFs, compress 20 photos.
- Unit converter extras: fuel economy, cooking, and shoe and clothing sizes.

**2.0: Platform**
- Optional Google Drive / OneDrive export.
- Tablet and foldable layouts.
- Wear OS tile (torch, timer, QR on the watch).

## 5. Size budget

| Part (arm64 download) | 1.1.0 | 1.2.0 target | Note |
|---|---|---|---|
| Flutter engine + app code | ~11 MB | ~10.5 MB | obfuscated; keep new packages out unless they earn their keep |
| ffmpeg (video tools) | ~10.5 MB | ~10.5 MB | Next candidate. Moving Video to MP4/audio onto Android's Media3 Transformer would save ~10 MB, but MP3 output would become M4A and GIF needs its own encoder. Decide from Video tool usage in Firebase/Play stats. |
| ML Kit translation | ~6.8 MB | ~6.8 MB | No Play-services version exists |
| ML Kit OCR | ~4.4 MB | 0 | Play services |
| AI upscaler model | ~3.7 MB | 0 | downloaded on first use |
| TFLite runtime | ~2.8 MB | ~2.8 MB | needed for the upscaler |
| Images | ~1.7 MB | 0 | vector logo |

Measured by Play Console on the 1.2.0 (9) bundle: **35.5 MB for new installs, 11 MB smaller than 1.1.0** (about 20 s to download), with no devices dropped (12,608 phones, 6,838 tablets).

Rule: any new dependency that adds more than 500 KB per device needs a usage case that beats the existing tools.

## 6. Quality gates for every release

1. `flutter analyze` is clean, and the unit and widget tests are green.
2. The on-device smoke test passes on an emulator. Each new tool is also checked by hand on a real low-end phone.
3. Release with a staged rollout: 20%, then 50% after 48 h if Android vitals stay under the thresholds, then 100%.
4. Store listing, screenshots and privacy policy are updated whenever a tool adds a network call or a permission.

## 7. Metrics

| Metric | Target | Why |
|---|---|---|
| Day-1 / Day-7 retention | 35% / 15% | Shows whether the app became a habit |
| Jobs completed per user per week | ≥ 3 | Core value |
| Share-sheet and shortcut launches | ≥ 25% of sessions | Shows we're where users already are |
| Store listing conversion | ≥ 30% | Icon, screenshots and size |
| Rating | ≥ 4.5 with 500+ ratings by month 3 | Ranking |
| Crash-free users / ANR | ≥ 99.5% / ≤ 0.2% | Ranking and trust |

## 8. Monetisation (unchanged principles)

- Ads never interrupt a job. Interstitials appear only after two completed jobs, at most once every three minutes, and banners stay away from result screens.
- One-time "Remove ads" purchase; no subscription.
- Any future paid tier only adds heavy cloud features (the AI assistant, large-batch cloud upscaling). It never locks a tool that's free today.
