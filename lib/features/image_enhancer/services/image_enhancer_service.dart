import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:utility_toolbox/features/image_enhancer/providers/image_enhancer_providers.dart';

class ImageEnhancerService {
  /// Enhance [source] with [settings] — heavy work runs in an isolate.
  Future<File> enhance({
    required File source,
    required EnhancementSettings settings,
  }) async {
    final sourceBytes = await source.readAsBytes();
    final outBytes = await compute(
      _processImage,
      _EnhanceArgs(bytes: sourceBytes, settings: settings),
    );

    final dir = await getTemporaryDirectory();
    final name = p.basenameWithoutExtension(source.path);
    final out = File('${dir.path}/${name}_enhanced.jpg');
    await out.writeAsBytes(outBytes);
    return out;
  }
}

// ── Isolate payload ────────────────────────────────────────────────────────

class _EnhanceArgs {
  const _EnhanceArgs({required this.bytes, required this.settings});
  final Uint8List bytes;
  final EnhancementSettings settings;
}

/// Top-level function so [compute] can send it to a separate isolate.
Future<Uint8List> _processImage(_EnhanceArgs args) async {
  final settings = args.settings;
  img.Image? image = img.decodeImage(args.bytes);
  if (image == null) throw Exception('Could not decode image');

  // 1. Rotation ─────────────────────────────────────────────────────────────
  if (settings.rotation != 0) {
    image = img.copyRotate(image, angle: settings.rotation.toDouble());
  }

  // 2. Flip ──────────────────────────────────────────────────────────────────
  if (settings.flipH) image = img.flipHorizontal(image);
  if (settings.flipV) image = img.flipVertical(image);

  // 3. Grayscale (noir / full desaturate) ───────────────────────────────────
  final effectiveSaturation =
      settings.saturation + (settings.presetDeltas['saturation'] ?? 0.0);

  if (effectiveSaturation <= -0.95 ||
      settings.preset == EnhancementPreset.noir) {
    image = img.grayscale(image);
  }

  // 4. Brightness / Contrast via adjustColor ────────────────────────────────
  //    image package v4: adjustColor(image, brightness, contrast, saturation,
  //    hue, gamma, exposure, blacks, whites, mids, ...)
  //    All are doubles; brightness/contrast are factors (1.0 = no change).
  final effectiveBrightness =
      (settings.brightness + (settings.presetDeltas['brightness'] ?? 0.0) + 1.0)
          .clamp(0.0, 2.0);

  final effectiveContrast =
      (settings.contrast + (settings.presetDeltas['contrast'] ?? 0.0) + 1.0)
          .clamp(0.0, 2.0);

  // Saturation factor (only if not already grayscaled)
  final satFactor = effectiveSaturation <= -0.95
      ? 1.0
      : (effectiveSaturation + 1.0).clamp(0.0, 2.0);

  image = img.adjustColor(
    image,
    brightness: effectiveBrightness,
    contrast: effectiveContrast,
    saturation: satFactor,
  );

  // 5. Color tinting for warm / cool / vintage presets ──────────────────────
  //    image v4 adjustColor accepts `amount` + ColorRgb8 for a color tint,
  //    OR we do a manual per-pixel pass — safest across versions.
  if (settings.preset == EnhancementPreset.warm) {
    image = _tint(image, rShift: 12, gShift: 0, bShift: -12);
  } else if (settings.preset == EnhancementPreset.cool) {
    image = _tint(image, rShift: -12, gShift: 0, bShift: 12);
  } else if (settings.preset == EnhancementPreset.vintage) {
    // Warm + slightly lifted shadows
    image = _tint(image, rShift: 10, gShift: 4, bShift: -10);
    image = img.adjustColor(image, brightness: 1.04);
  }

  // 6. Sharpen ───────────────────────────────────────────────────────────────
  if (settings.sharpness > 0.05) {
    // Unsharp-mask via convolution kernel — works in all image v4 versions.
    final amount = settings.sharpness.clamp(0.0, 1.0);
    // Center weight grows with amount: 5 + ~3*amount → 5 to 8
    final center = (5 + amount * 3).round();
    image = img.convolution(
      image,
      filter: [0, -1, 0, -1, center, -1, 0, -1, 0],
      div: center - 4, // sum of kernel must divide out to 1
    );
  }

  // 7. Gaussian blur ─────────────────────────────────────────────────────────
  if (settings.blur > 0.05) {
    final radius = (settings.blur * 5).round().clamp(1, 10);
    image = img.gaussianBlur(image, radius: radius);
  }

  // 8. Encode ────────────────────────────────────────────────────────────────
  final encoded = img.encodeJpg(
    image,
    quality: settings.outputQuality.clamp(10, 100),
  );
  return Uint8List.fromList(encoded);
}

/// Fast per-pixel RGB shift for tinting — no dependency on API version.
img.Image _tint(
  img.Image src, {
  required int rShift,
  required int gShift,
  required int bShift,
}) {
  final out = img.Image(
    width: src.width,
    height: src.height,
    format: src.format,
  );
  for (final pixel in src) {
    final r = (pixel.r.toInt() + rShift).clamp(0, 255);
    final g = (pixel.g.toInt() + gShift).clamp(0, 255);
    final b = (pixel.b.toInt() + bShift).clamp(0, 255);
    out.setPixelRgba(pixel.x, pixel.y, r, g, b, pixel.a.toInt());
  }
  return out;
}
