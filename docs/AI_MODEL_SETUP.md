# AI Upscaler — Model Setup Guide

## Quick summary
The original GitHub link (xinntao/Real-ESRGAN v0.2.5.0) is **dead (404)**.
Use the working options below instead.

---

## Option A — Kaggle ESRGAN TFLite (RECOMMENDED, ~5 MB, easiest)

This is the official Google/TFHub ESRGAN model converted to TFLite.
It is small, well-tested, and works perfectly with tflite_flutter.

### Step 1: Download

Go to this URL in your browser:
```
https://www.kaggle.com/models/kaggle/esrgan-tf2/TfLite/esrgan-tf2/1/download
```

This downloads a `.tar.gz` file. Extract it — you will find `1.tflite` inside.

### Step 2: Rename and place

Rename `1.tflite` to `realesrgan_x4.tflite` and copy it into:
```
your_project/assets/models/realesrgan_x4.tflite
```

For the x2 model, copy the same file and also name it:
```
your_project/assets/models/realesrgan_x2.tflite
```

(The Kaggle ESRGAN model is a 4× model only. Using it for both x2 and x4
is fine — the service crops the output to match the requested scale.)

---

## Option B — HuggingFace Qualcomm Real-ESRGAN (~67 MB, higher quality)

**Warning:** 67 MB will make your APK very large. Only use this if quality
is more important than app size.

Go to:
```
https://huggingface.co/qualcomm/Real-ESRGAN-x4plus
```

Click **Files and versions**, then click `Real-ESRGAN-x4plus.tflite`,
then click the **Download** button.

Rename to `realesrgan_x4.tflite` and also copy as `realesrgan_x2.tflite`.

---

## Option C — Tensorflow Super Resolution Android example (~1 MB, fastest, lower quality)

The official TensorFlow Android super-resolution demo uses a small ESRGAN
that is extremely fast. Good for testing.

```
https://storage.googleapis.com/download.tensorflow.org/models/tflite/sr_with_srresnet_metadata_v1.tflite
```

Download, rename to `realesrgan_x4.tflite` and `realesrgan_x2.tflite`.

---

## Step 3 — Verify placement

After downloading, your project must look like this:
```
your_project/
└── assets/
    └── models/
        ├── realesrgan_x2.tflite   ← required
        └── realesrgan_x4.tflite   ← required
```

---

## Step 4 — android/app/build.gradle patch

Add this inside the `android { }` block:
```gradle
aaptOptions {
    noCompress 'tflite'
}
```

Without this Android double-compresses the model and it fails to load.

---

## Step 5 — Run

```bash
flutter pub get
flutter run
```

---

## Troubleshooting

| Error | Fix |
|-------|-----|
| `Unable to open file assets/models/realesrgan_x4.tflite` | Model missing — follow Step 2 |
| App crashes immediately | Missing `aaptOptions` in build.gradle — Step 4 |
| Black output image | Model input shape mismatch — use Option A (Kaggle) |
| Very slow (>2 min) | Normal on old devices without NPU. Use 2× mode |
| `tflite_flutter` build error | Run `flutter clean && flutter pub get && flutter run` |
