import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:path_provider/path_provider.dart';

// ─────────────────────────────────────────────────────────────────────────────
//  Domain models
// ─────────────────────────────────────────────────────────────────────────────

class OcrBlock {
  const OcrBlock({required this.text, required this.lines, required this.rect});
  final String text;
  final List<OcrLine> lines;
  final Rect rect; // normalised 0–1 fractions of image size
}

class OcrLine {
  const OcrLine({required this.text, required this.rect});
  final String text;
  final Rect rect;
}

class OcrResult {
  const OcrResult({
    required this.fullText,
    required this.blocks,
    required this.imageWidth,
    required this.imageHeight,
  });
  final String fullText;
  final List<OcrBlock> blocks;
  final int imageWidth;
  final int imageHeight;
}

// ─────────────────────────────────────────────────────────────────────────────
//  _CompressedImage — result of downscale step
// ─────────────────────────────────────────────────────────────────────────────

class _CompressedImage {
  const _CompressedImage({
    required this.path,
    required this.width,
    required this.height,
    required this.isTemp,
  });
  final String path;
  final int width;
  final int height;
  final bool isTemp;
}

// ─────────────────────────────────────────────────────────────────────────────
//  OcrService
//
//  Why this is the fastest possible approach with google_mlkit_text_recognition:
//
//  1. Singleton TextRecognizer — native model loads ONCE, stays resident.
//     Recreating it on every scan costs 300–500 ms cold-start every time.
//
//  2. Compress to ≤1280 px BEFORE ML Kit sees the image.
//     ML Kit must decode + process every pixel. A 4032×3024 camera photo has
//     ~12 MP. At 1280×960 that's ~1.2 MP — 10× fewer pixels → ~10× faster.
//     flutter_image_compress does this on a native thread, zero Dart/UI jank.
//
//  3. Compress returns the real output dimensions so we don't need a second
//     "read size" pass — eliminates the entire compute(_readImageSize) call
//     that was adding extra isolate overhead for no reason.
//
//  4. warmUp() — pre-instantiates the recognizer when the OCR screen mounts,
//     so the cold-start happens while the user is still looking at the idle UI,
//     not after they've tapped Scan.
// ─────────────────────────────────────────────────────────────────────────────

/// Thrown when the on-device OCR model call doesn't return in time —
/// almost always because ML Kit is stuck trying to lazily download its
/// model over a slow/absent network connection instead of finding it
/// bundled locally.
class OcrTimeoutException implements Exception {
  const OcrTimeoutException();
  @override
  String toString() =>
      'OCR timed out — the on-device model may still be downloading. '
      'Connect to Wi-Fi once, or try again.';
}

class OcrService {
  static const int _maxLongEdge = 1280;

  // If ML Kit hasn't returned by this point, something is wrong (usually a
  // stalled first-time model download over a slow connection) — bail out
  // instead of leaving the UI stuck on the loading screen forever.
  static const Duration _scanTimeout = Duration(seconds: 15);

  // Singleton recognizer — kept alive between scans (one script at a time).
  TextRecognizer? _recognizer;
  TextRecognitionScript _script = TextRecognitionScript.latin;
  TextRecognizer get _rec => _recognizer ??= TextRecognizer(script: _script);

  TextRecognitionScript get script => _script;

  /// Switches the writing system the recognizer reads. Each script has its
  /// own Play-services model, so the old recognizer is closed and the next
  /// scan (or [warmUp]) loads the new one.
  void setScript(TextRecognitionScript script) {
    if (script == _script) return;
    _script = script;
    final old = _recognizer;
    _recognizer = null;
    old?.close();
  }

  // ── Lifecycle ─────────────────────────────────────────────────────────────

  /// Pre-warms the native ML model. Call from the OCR idle screen's
  /// initState / postFrameCallback so the model is hot before first scan.
  Future<void> warmUp() async {
    try {
      _recognizer ??= TextRecognizer(script: _script);
    } catch (_) {}
  }

  Future<void> dispose() async {
    await _recognizer?.close();
    _recognizer = null;
  }

  // ── Public API ────────────────────────────────────────────────────────────

  Future<String> recognizeText(String imagePath) async =>
      (await recognizeDetailed(imagePath)).fullText;

  Future<OcrResult> recognizeDetailed(String imagePath) async {
    // Step 1 — Downscale on a native background thread.
    // This is the single biggest performance lever: cutting a 12 MP image
    // down to 1.2 MP makes ML Kit ~10× faster.
    final compressed = await _compress(imagePath);

    try {
      // Step 2 — Feed the smaller image to ML Kit.
      // InputImage.fromFilePath is the correct, stable API — it lets the
      // native SDK handle its own decoding from a known-good JPEG file.
      final inputImage = InputImage.fromFilePath(compressed.path);
      final result = await _rec.processImage(inputImage).timeout(
        _scanTimeout,
        onTimeout: () {
          // Drop the possibly-wedged recognizer instance so the *next*
          // attempt builds a fresh one instead of hanging again on the
          // same stuck native call.
          _recognizer?.close();
          _recognizer = null;
          throw const OcrTimeoutException();
        },
      );

      // Step 3 — Map ML Kit output to our domain models.
      // We already know the exact pixel dimensions from the compress step,
      // so no second "read size" pass is needed.
      final imgW = compressed.width.toDouble();
      final imgH = compressed.height.toDouble();
      final buffer = StringBuffer();
      final blocks = <OcrBlock>[];

      for (final block in result.blocks) {
        buffer.writeln(block.text);
        blocks.add(
          OcrBlock(
            text: block.text,
            rect: _norm(block.boundingBox, imgW, imgH),
            lines: [
              for (final line in block.lines)
                OcrLine(
                  text: line.text,
                  rect: _norm(line.boundingBox, imgW, imgH),
                ),
            ],
          ),
        );
      }

      return OcrResult(
        fullText: buffer.toString().trim(),
        blocks: blocks,
        imageWidth: compressed.width,
        imageHeight: compressed.height,
      );
    } finally {
      if (compressed.isTemp) {
        try {
          File(compressed.path).deleteSync();
        } catch (_) {}
      }
    }
  }

  // ── Private ───────────────────────────────────────────────────────────────

  static Rect _norm(Rect r, double w, double h) =>
      Rect.fromLTWH(r.left / w, r.top / h, r.width / w, r.height / h);

  /// Compresses the image to ≤ [_maxLongEdge] px on the long edge.
  /// Returns the original path unchanged if it's already within budget.
  ///
  /// flutter_image_compress runs entirely on a native (non-Dart) thread,
  /// which is why it doesn't block the UI even on large files.
  Future<_CompressedImage> _compress(String sourcePath) async {
    // Read dimensions from the JPEG/PNG header bytes — fast, no full decode.
    final header = await compute(_headerSize, sourcePath);
    final srcW = header.$1;
    final srcH = header.$2;
    final known = header.$3;
    final long = srcW > srcH ? srcW : srcH;

    // Already small enough — pass through with no work at all. ML Kit and
    // Image.file both apply the EXIF rotation, so report the upright size.
    if (known && long <= _maxLongEdge) {
      final swap = header.$4;
      return _CompressedImage(
        path: sourcePath,
        width: swap ? srcH : srcW,
        height: swap ? srcW : srcH,
        isTemp: false,
      );
    }

    // Unknown format (e.g. HEIC): the old 9999×9999 guess shrank photos to
    // ~200 px and wrecked recognition. A square long-edge budget makes the
    // plugin scale the short edge to it instead.
    final scale = _maxLongEdge / long;
    final tgtW = known ? (srcW * scale).round() : _maxLongEdge;
    final tgtH = known ? (srcH * scale).round() : _maxLongEdge;

    final tmp = await getTemporaryDirectory();
    final outPath =
        '${tmp.path}/ocr_${DateTime.now().millisecondsSinceEpoch}.jpg';

    final xfile = await FlutterImageCompress.compressAndGetFile(
      sourcePath,
      outPath,
      minWidth: tgtW,
      minHeight: tgtH,
      quality: 88,
      format: CompressFormat.jpeg,
      keepExif: false,
    );

    if (xfile == null) {
      // Compression failed — fall back to original (slower ML Kit, but safe).
      final swap = header.$4;
      return _CompressedImage(
        path: sourcePath,
        width: swap ? srcH : srcW,
        height: swap ? srcW : srcH,
        isTemp: false,
      );
    }

    // The plugin rotates by EXIF and has its own rounding, so the requested
    // size isn't the real one — read it back (a 64 KB header read) so the
    // block rectangles are normalised against the image that was scanned.
    final out = _headerSize(xfile.path);
    return _CompressedImage(
      path: xfile.path,
      width: out.$3 ? out.$1 : tgtW,
      height: out.$3 ? out.$2 : tgtH,
      isTemp: true,
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
//  Top-level helper for compute() — must NOT be a closure or instance method.
//
//  Reads image dimensions by inspecting only the file header bytes.
//  For a typical 8 MB camera JPEG this reads < 10 KB and returns instantly.
//  Returns (width, height, known, exifSwapsAxes) — width/height are the
//  stored (pre-rotation) size; exifSwapsAxes is true when the JPEG's EXIF
//  orientation turns it by 90° for display.
// ─────────────────────────────────────────────────────────────────────────────

(int, int, bool, bool) _headerSize(String path) {
  // Read first 64 KB — more than enough for any JPEG/PNG/WebP header.
  final raf = File(path).openSync();
  final bytes = raf.readSync(65536);
  raf.closeSync();

  // ── JPEG (FFD8 magic) ─────────────────────────────────────────────────────
  if (bytes.length > 4 && bytes[0] == 0xFF && bytes[1] == 0xD8) {
    var swap = false;
    int i = 2;
    while (i + 8 < bytes.length) {
      if (bytes[i] != 0xFF) break;
      final marker = bytes[i + 1];
      final segLen = (bytes[i + 2] << 8) | bytes[i + 3];
      if (marker == 0xE1) swap = _exifSwapsAxes(bytes, i + 4, segLen - 2) || swap;
      // SOF0–SOF15 markers carry height then width
      if ((marker >= 0xC0 && marker <= 0xC3) ||
          (marker >= 0xC5 && marker <= 0xC7) ||
          (marker >= 0xC9 && marker <= 0xCB) ||
          (marker >= 0xCD && marker <= 0xCF)) {
        final h = (bytes[i + 5] << 8) | bytes[i + 6];
        final w = (bytes[i + 7] << 8) | bytes[i + 8];
        if (w > 0 && h > 0) return (w, h, true, swap);
      }
      i += 2 + segLen;
    }
  }

  // ── PNG (89 50 4E 47 magic) ───────────────────────────────────────────────
  if (bytes.length >= 24 &&
      bytes[0] == 0x89 &&
      bytes[1] == 0x50 &&
      bytes[2] == 0x4E &&
      bytes[3] == 0x47) {
    final w =
        (bytes[16] << 24) | (bytes[17] << 16) | (bytes[18] << 8) | bytes[19];
    final h =
        (bytes[20] << 24) | (bytes[21] << 16) | (bytes[22] << 8) | bytes[23];
    if (w > 0 && h > 0) return (w, h, true, false);
  }

  // ── WebP (RIFF????WEBP magic) ─────────────────────────────────────────────
  if (bytes.length >= 30 &&
      bytes[0] == 0x52 &&
      bytes[1] == 0x49 &&
      bytes[2] == 0x46 &&
      bytes[3] == 0x46 &&
      bytes[8] == 0x57 &&
      bytes[9] == 0x45 &&
      bytes[10] == 0x42 &&
      bytes[11] == 0x50) {
    if (bytes[12] == 0x56 &&
        bytes[13] == 0x50 &&
        bytes[14] == 0x38 &&
        bytes[15] == 0x20) {
      final w = ((bytes[26] | (bytes[27] << 8)) & 0x3FFF) + 1;
      final h = ((bytes[28] | (bytes[29] << 8)) & 0x3FFF) + 1;
      if (w > 0 && h > 0) return (w, h, true, false);
    }
  }

  // ── Unknown format — a large sentinel so compress always runs ─────────────
  return (9999, 9999, false, false);
}

/// True when the APP1 segment at [start] holds EXIF orientation 5–8
/// (rotated 90° or 270°).
bool _exifSwapsAxes(List<int> b, int start, int length) {
  // The APP1 segment (with its thumbnail) may run past the 64 KB we read;
  // IFD0 sits at its start, so a truncated segment is still fine.
  final end = start + length < b.length ? start + length : b.length;
  if (length < 14 || start + 14 > end) return false;
  // "Exif" header
  if (b[start] != 0x45 || b[start + 1] != 0x78 || b[start + 2] != 0x69 || b[start + 3] != 0x66) {
    return false;
  }
  final tiff = start + 6;
  final little = b[tiff] == 0x49; // "II" = little-endian, "MM" = big-endian
  int u16(int o) => little ? b[o] | (b[o + 1] << 8) : (b[o] << 8) | b[o + 1];
  int u32(int o) => little
      ? b[o] | (b[o + 1] << 8) | (b[o + 2] << 16) | (b[o + 3] << 24)
      : (b[o] << 24) | (b[o + 1] << 16) | (b[o + 2] << 8) | b[o + 3];
  final ifd = tiff + u32(tiff + 4);
  if (ifd + 2 > end) return false;
  final count = u16(ifd);
  for (var n = 0; n < count; n++) {
    final entry = ifd + 2 + n * 12;
    if (entry + 12 > end) return false;
    if (u16(entry) == 0x0112) {
      final orientation = u16(entry + 8);
      return orientation >= 5 && orientation <= 8;
    }
  }
  return false;
}
