# Privacy Policy — Utility Toolbox

**Developer:** ProManage Apps
**App:** Utility Toolbox: PDF, QR, OCR (`com.utilitytoolbox.smarttools`)
**Last updated:** 11 November 2026

Utility Toolbox is a collection of offline-first utilities. We do not require an account, we do not run analytics or crash-reporting SDKs, and we do not sell or share personal data. This policy explains what the app can access, why, and what (if anything) leaves your device.

## 1. Data that stays on your device

The following tools process data entirely on your phone. Nothing is transmitted to us or to anyone else.

| Tool | Data accessed | Stored? |
|---|---|---|
| QR & barcode scanner / generator | Camera frames, scanned text | Scan history is saved on-device; you can delete items or clear it in the app |
| OCR (text recognition) | Photos you pick or capture; the recognition models are provided by Google Play services on your phone | Not stored by the app |
| Translation | Text you type or dictate; language models downloaded from Google ML Kit | Models are cached on-device |
| PDF tools (merge, compress, split, sign, organize, watermark, PDF to text, image→PDF, Word→PDF) | Files you select; your drawn signature if you choose to save it for reuse | Output is saved to your Downloads folder; a saved signature stays in the app's private storage until you delete it |
| Image compressor, resizer, image enhancer, background remover, AI upscaler (on-device mode) | Photos you select; background removal uses a Google Play services model on your phone | Output saved to your gallery or Downloads |
| Location saver | Precise location (GPS) when you tap "save current location" | Saved on-device only; delete any entry in the app |
| Smart clipboard | Text you copy while the tool is open | Saved on-device only; clear at any time in the app |
| Compass, bubble level | Accelerometer and magnetometer | Not stored (a level calibration offset is saved as a preference) |
| Flashlight | Camera flash LED (no camera images are captured) | Not stored |
| Direct Chat | The phone number and message you type | Recent numbers are saved on-device; delete them in the app. The chat opens in WhatsApp, which is governed by WhatsApp's own privacy policy |
| Wi-Fi QR generator | Network name and password you type | Held in memory only, never saved |
| Password generator, hash generator, calculators (calculator, age, loan, percentage, BMI), unit converter, color picker, time zones, stopwatch & timer, text utilities | Values you enter | Not stored, or stored only as preferences |

## 2. Data that may leave your device

| Feature | What is sent | To whom | Why |
|---|---|---|---|
| **AI upscaler — cloud mode (off by default)** | The single photo you choose to upscale | Our processing server hosted on Google Cloud Run (US) | Higher-quality face restoration. You must turn this on and accept an in-app consent dialog first. The image is processed in memory and is not retained after the result is returned. |
| **IP & ping tool** | Your public IP address, and any host name you type | ipinfo.io (for IP geolocation) and the host you enter | Showing your IP details and testing reachability of a host |
| **Wi-Fi speed test** | Test traffic and your public IP | Cloudflare (speed.cloudflare.com) and Netflix fast.com | Measuring download/upload speed. These providers see your IP as part of any connection. |
| **Currency converter** | A request for the latest exchange-rate table (no personal data; your IP is visible to the server as for any connection) | jsDelivr CDN (cdn.jsdelivr.net) and Cloudflare Pages (currency-api.pages.dev), serving the open-source fawazahmed0/exchange-api data | Showing current exchange rates. The last table is cached so the tool works offline. |
| **AI upscaler model download** | A one-time download request (no personal data) | GitHub Pages (ammadkhan462.github.io) | Fetching the on-device upscaling model the first time you use the tool, instead of including it in every install. |
| **Speech input (translation)** | Your voice | Your device's speech-recognition service (Google on most Android devices) | Converting speech to text. Governed by Google's privacy policy. |
| **Advertising** | Advertising ID, approximate location derived from IP, device and app information | Google AdMob | Showing ads in the free version. See "Advertising" below. |
| **In-app purchase** | Purchase token | Google Play Billing | Unlocking "Remove ads". We never see payment details. |

We do not operate any other servers and we receive no copy of the data above except the upscaler image, which is discarded immediately after processing.

## 3. Permissions

| Permission | Used for |
|---|---|
| Camera | Scanning QR codes, capturing images for OCR and PDF tools |
| Photos / storage | Picking images and files; saving results to Gallery or Downloads |
| Microphone | Voice input in the translation tool |
| Location | Saving your current position in the Location Saver (only when you tap the button) |
| Notifications | Telling you when a file has finished saving to Downloads |
| Internet | Ads, the optional cloud upscaler, the IP/ping and speed-test tools, exchange rates, and downloading translation and upscaler models |

You can revoke any permission in Android Settings; the related tool will stop working but the rest of the app is unaffected.

## 4. Advertising

The free version shows ads served by Google AdMob. AdMob may use your device's advertising ID and IP address to show relevant ads and to measure them, as described in [Google's privacy policy](https://policies.google.com/privacy) and [how Google uses data from partner apps](https://policies.google.com/technologies/partner-sites). Where required by law you will be asked for consent before personalised ads are shown. You can reset or delete your advertising ID in Android Settings, and you can remove ads entirely with the "Remove ads" purchase.

## 5. Children

Utility Toolbox is a general-audience utility app and is not directed at children under 13. We do not knowingly collect personal information from children.

## 6. Data retention and deletion

- Everything the app stores (scan history, saved locations, clipboard items, preferences) lives on your device and is removed when you uninstall the app. Each tool also has an in-app clear/delete option.
- Files you export go to your Downloads folder or gallery and remain under your control.
- Images sent in cloud upscaler mode are not retained on our server.

## 7. Security

Network traffic uses HTTPS. We do not store any of your data on our servers, so there is no account database to breach. Local data is protected by Android's app sandbox.

## 8. Changes to this policy

We will update this page and the "Last updated" date when the app's data practices change. Material changes will be noted in the app's release notes.

## 9. Contact

Questions about this policy or your data: **[contact email — fill in before publishing]**
