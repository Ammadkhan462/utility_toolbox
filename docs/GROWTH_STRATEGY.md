# Utility Toolbox — Organic Growth Strategy

Date: 2026-11-10. Companion to [AUDIT_REPORT.md](../AUDIT_REPORT.md).

## 1. Where the app stands

| Signal | Today | Why it matters for organic reach |
|---|---|---|
| Installs | 10+ | No ranking history yet, so listing quality and early vitals decide everything. |
| Release bundle | 254 MB AAB, roughly 70 MB+ per-device download | Play conversion drops sharply with size; large apps are skipped on metered data, which is most of the target markets. |
| Cold start | Native splash, then a 1.1 s Flutter splash, then a 7 s looping animated hero | Slow first paint and constant repaint on the home screen hurt both perceived speed and battery. |
| Entry points | Launcher icon only | Users only meet the app when they remember to open it. |
| Store listing | English only; title "Utility Toolbox: PDF, QR, OCR" | Most utility-app searches happen in Spanish, Portuguese, Hindi, Indonesian, Arabic, Turkish, Russian and Urdu markets. |
| Ratings | No in-app review prompt | Rating volume and average are the strongest conversion factor after icon and screenshots. |
| Vitals | Sensor and isolate leaks, heavy work on UI thread, R8 off | Play down-ranks apps above the bad-behaviour thresholds for crashes and ANRs. |

## 2. What users actually search for

The all-in-one toolbox category on Play is driven by a handful of jobs. Each one has dedicated single-purpose competitors with millions of installs, so the toolbox wins only by doing the top jobs as well as those apps, faster, offline and with fewer ads.

| Job | Typical search terms | Status before rebuild | Rebuild |
|---|---|---|---|
| Scan paper into PDF | document scanner, pdf scanner, cam scanner | Missing | **New: Document Scanner** with edge detection, multi-page, PDF out |
| Scan or create QR codes | qr scanner, barcode scanner, qr generator | Present, no scan-from-gallery | Add scan from image, Quick Settings tile, launcher shortcut |
| PDF tools | merge pdf, compress pdf, split pdf, pdf to jpg, lock pdf | Merge, compress, image→PDF, Word→PDF | **New: Split/extract pages, PDF to images, Protect PDF, Unlock PDF** |
| Image to text | ocr, text scanner, image to text | Present | Reachable from share sheet and from scanner results |
| Translate | translator, translate offline | Present, on-device | **Text-selection "Translate" action** in every app |
| Photo size | compress image, resize image, photo resizer, jpg to png | Compress only | **New: Resize & Convert** (exact size, presets, JPG/PNG/WEBP, batch) |
| Calculators | calculator, age calculator, emi calculator | EMI only | **New: Calculator, Age & Date calculator** |
| Network | speed test, wifi password qr | Present | Unchanged |

## 3. Growth levers built into the app

1. **Be where the user already is.** Organic installs in this category compound through habit, not through the launcher.
   - *Share sheet target*: images, PDFs, Word files, text and video shared from any app open a "What do you want to do?" sheet with the right tools.
   - *Open with*: PDFs and Word documents.
   - *Text selection*: select text anywhere, tap **Translate**.
   - *Launcher shortcuts*: long-press the icon for Scan document, Scan QR, Image to PDF, Translate.
   - *Quick Settings tile*: one-tap QR scanner from the notification shade.
   - *Pin any tool to the home screen* from its long-press menu.
2. **Fast to the job.** Home opens straight on the tools: no Flutter splash, no animated hero. Search understands intent words ("jpg", "lock", "emi", "scan"). Quick actions for the four top jobs, then Favourites and Recent.
3. **Come back for files.** A *My Files* tab lists everything the app produced, with open and share, so the app becomes the place to find "that PDF".
4. **Ratings at the right moment.** The system in-app review sheet is requested only after the third successful job and at most every 120 days.
5. **Ads that don't cost ratings.** No interstitial until the user has completed two jobs, then at most one every three minutes. Google UMP consent for EEA/UK users.
6. **Small and fast.** LGPL ffmpeg variant, deduplicated AI model, compressed assets, unbundled barcode model, R8 shrinking.
7. **Local language.** In-app shell (home, categories, tool names, settings, sheets) in 12 languages; store listing copy in the same 12 languages.

## 4. Store listing (Play Console)

Full copy per language lives in [`store_listing/`](../store_listing/). Principles applied:

- **Title (30 chars)** leads with the highest-volume job, then the brand: `PDF Scanner & QR: Toolbox`.
- **Short description (80 chars)** lists the top three jobs and the offline/privacy angle.
- **Full description** front-loads jobs and natural search phrases in the first 170 characters, then groups tools by job, with no keyword stuffing and no superlatives (Play policy).
- **Screenshots**: one job per screenshot in this order — Document Scanner, PDF tools, QR scanner, Translate anywhere, Image resize, All tools. Caption first, UI second.
- **Localise listings** for es-419, pt-BR, hi-IN, id, ar, fr-FR, de-DE, ru-RU, tr-TR, ur, bn-BD.

## 5. Metrics to watch after release

| Metric | Where | Target |
|---|---|---|
| Store listing conversion | Play Console → Store performance | Above category median |
| Download size | Play Console → App size | Under 40 MB on arm64 |
| User-perceived crash rate / ANR rate | Android vitals | Below 1.09% / 0.47% |
| Average rating, rating count | Ratings | 4.4+, growing weekly |
| Day-1 / Day-7 retention | Play Console → Retention | Track before/after share-sheet launch |
| Share-sheet and shortcut launches | In-app counters (add if analytics are introduced) | Rising share of sessions |

## 6. Roadmap after this release

- Encrypt local history (clipboard, locations, scan history) and cap retention.
- Localise every tool screen, not just the shell.
- Organise PDF pages (reorder, rotate, delete), sign PDF.
- Home-screen widgets for Scan and Quick Translate.
- Verified purchase tokens for Remove Ads.
