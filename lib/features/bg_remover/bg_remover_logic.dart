/// Pure image logic for the background remover: sizing, confidence mask →
/// soft alpha, and compositing onto a background. No Flutter imports, so
/// everything here runs inside `compute()` isolates and is unit tested.
library;

import 'dart:io';
import 'dart:math' as math;
import 'dart:typed_data';

import 'package:image/image.dart' as img;

/// Photos are capped to this long side before segmentation: plenty for a
/// cut-out, fast on low-end phones, and a 2048² RGBA buffer is only 16 MB.
const maxLongSide = 2048;

/// Size after capping the long side at [max] (never upscales).
({int width, int height}) fitLongSide(int width, int height, {int max = maxLongSide}) {
  final long = math.max(width, height);
  if (long <= max) return (width: width, height: height);
  final scale = max / long;
  return (width: math.max(1, (width * scale).round()), height: math.max(1, (height * scale).round()));
}

/// Power-of-two decode subsampling that still leaves the short side at least
/// [minShortSide] — lets Android decode a 50 MP photo without loading it all.
int sampleSizeFor(int width, int height, {int minShortSide = 1536}) {
  final short = math.min(width, height);
  var s = 1;
  while (short ~/ (s * 2) >= minShortSide) {
    s *= 2;
  }
  return s;
}

double _smoothstep(double e0, double e1, double x) {
  final t = ((x - e0) / (e1 - e0)).clamp(0.0, 1.0);
  return t * t * (3 - 2 * t);
}

/// Feather radius in pixels for an image of this size (light: 1–3 px).
int featherRadiusFor(int width, int height) => (math.max(width, height) / 1000).round().clamp(1, 3);

/// ML Kit confidence mask (0…1 per pixel, row-major) → 8-bit alpha.
///
/// The model's soft band is tightened with a smoothstep between [low] and
/// [high] (removes the faint halo), then feathered with a separable box blur
/// of [featherRadius] px so the edge blends instead of looking cut by scissors.
Uint8List maskToAlpha(
  List<double> mask,
  int width,
  int height, {
  double low = 0.25,
  double high = 0.75,
  int featherRadius = 1,
}) {
  final n = width * height;
  if (mask.length != n) {
    throw ArgumentError('mask has ${mask.length} values, expected $n');
  }
  final alpha = Uint8List(n);
  for (var i = 0; i < n; i++) {
    alpha[i] = (_smoothstep(low, high, mask[i]) * 255).round();
  }
  if (featherRadius <= 0) return alpha;
  return boxBlur(alpha, width, height, featherRadius);
}

/// Separable box blur of a single 8-bit channel (edges clamp).
Uint8List boxBlur(Uint8List src, int width, int height, int radius) {
  if (radius <= 0) return Uint8List.fromList(src);
  final tmp = Uint8List(src.length);
  final out = Uint8List(src.length);
  final size = radius * 2 + 1;
  // Horizontal.
  for (var y = 0; y < height; y++) {
    final row = y * width;
    var sum = 0;
    for (var k = -radius; k <= radius; k++) {
      sum += src[row + k.clamp(0, width - 1)];
    }
    for (var x = 0; x < width; x++) {
      tmp[row + x] = (sum / size).round();
      final add = (x + radius + 1).clamp(0, width - 1);
      final sub = (x - radius).clamp(0, width - 1);
      sum += src[row + add] - src[row + sub];
    }
  }
  // Vertical.
  for (var x = 0; x < width; x++) {
    var sum = 0;
    for (var k = -radius; k <= radius; k++) {
      sum += tmp[k.clamp(0, height - 1) * width + x];
    }
    for (var y = 0; y < height; y++) {
      out[y * width + x] = (sum / size).round();
      final add = (y + radius + 1).clamp(0, height - 1);
      final sub = (y - radius).clamp(0, height - 1);
      sum += tmp[add * width + x] - tmp[sub * width + x];
    }
  }
  return out;
}

/// Share of pixels that belong to the subject (alpha ≥ 50%).
double subjectCoverage(Uint8List alpha) {
  if (alpha.isEmpty) return 0;
  var count = 0;
  for (final a in alpha) {
    if (a >= 128) count++;
  }
  return count / alpha.length;
}

/// Less than this share of the photo means "no subject found".
const minSubjectCoverage = 0.003;

bool hasSubject(Uint8List alpha) => subjectCoverage(alpha) >= minSubjectCoverage;

/// What goes behind the subject.
sealed class BgFill {
  const BgFill();

  bool get isTransparent => this is TransparentFill;

  String get extension => isTransparent ? 'png' : 'jpg';

  String get mimeType => isTransparent ? 'image/png' : 'image/jpeg';
}

class TransparentFill extends BgFill {
  const TransparentFill();

  @override
  bool operator ==(Object other) => other is TransparentFill;

  @override
  int get hashCode => 0;
}

class ColorFill extends BgFill {
  const ColorFill(this.argb);

  /// 0xAARRGGBB (alpha ignored).
  final int argb;

  int get r => (argb >> 16) & 0xFF;
  int get g => (argb >> 8) & 0xFF;
  int get b => argb & 0xFF;

  @override
  bool operator ==(Object other) => other is ColorFill && other.argb == argb;

  @override
  int get hashCode => argb.hashCode;
}

class BlurFill extends BgFill {
  const BlurFill();

  @override
  bool operator ==(Object other) => other is BlurFill;

  @override
  int get hashCode => 1;
}

/// Working size and radius of the blurred-background pass.
const _blurWorkLongSide = 256;
const _blurWorkRadius = 4;

/// Blur strength as a fraction of the image's long side, so the on-screen
/// preview (GPU blur) can match the saved file. package:image uses
/// sigma = radius × 2/3.
const blurSigmaFraction = _blurWorkRadius * 2 / 3 / _blurWorkLongSide;

/// Strong background blur: shrink, blur, scale back up (fast at any size).
img.Image blurredCopy(img.Image src) {
  final small = fitLongSide(src.width, src.height, max: _blurWorkLongSide);
  final down = img.copyResize(src, width: small.width, height: small.height, interpolation: img.Interpolation.average);
  final blurred = img.gaussianBlur(down, radius: _blurWorkRadius);
  return img.copyResize(blurred, width: src.width, height: src.height, interpolation: img.Interpolation.linear);
}

/// Composites [src] (any channel count) through [alpha] onto [fill].
/// Transparent → RGBA (straight alpha, for PNG); otherwise RGB.
img.Image composite(img.Image src, Uint8List alpha, BgFill fill) {
  final w = src.width, h = src.height;
  if (alpha.length != w * h) throw ArgumentError('alpha size mismatch');
  final rgb = src.getBytes(order: img.ChannelOrder.rgb);

  if (fill is TransparentFill) {
    final out = Uint8List(w * h * 4);
    for (var i = 0, j = 0, k = 0; i < alpha.length; i++, j += 3, k += 4) {
      out[k] = rgb[j];
      out[k + 1] = rgb[j + 1];
      out[k + 2] = rgb[j + 2];
      out[k + 3] = alpha[i];
    }
    return img.Image.fromBytes(width: w, height: h, bytes: out.buffer, numChannels: 4, order: img.ChannelOrder.rgba);
  }

  final Uint8List bg;
  if (fill is ColorFill) {
    bg = Uint8List(w * h * 3);
    for (var j = 0; j < bg.length; j += 3) {
      bg[j] = fill.r;
      bg[j + 1] = fill.g;
      bg[j + 2] = fill.b;
    }
  } else {
    bg = blurredCopy(src).getBytes(order: img.ChannelOrder.rgb);
  }
  final out = Uint8List(w * h * 3);
  for (var i = 0, j = 0; i < alpha.length; i++, j += 3) {
    final a = alpha[i];
    final ia = 255 - a;
    out[j] = (rgb[j] * a + bg[j] * ia + 127) ~/ 255;
    out[j + 1] = (rgb[j + 1] * a + bg[j + 1] * ia + 127) ~/ 255;
    out[j + 2] = (rgb[j + 2] * a + bg[j + 2] * ia + 127) ~/ 255;
  }
  return img.Image.fromBytes(width: w, height: h, bytes: out.buffer, numChannels: 3, order: img.ChannelOrder.rgb);
}

/// RGBA with premultiplied alpha — the layout `ui.decodeImageFromPixels`
/// expects for rgba8888 — for the on-screen cut-out preview.
Uint8List premultipliedRgba(img.Image src, Uint8List alpha) {
  final rgb = src.getBytes(order: img.ChannelOrder.rgb);
  final out = Uint8List(alpha.length * 4);
  for (var i = 0, j = 0, k = 0; i < alpha.length; i++, j += 3, k += 4) {
    final a = alpha[i];
    out[k] = (rgb[j] * a + 127) ~/ 255;
    out[k + 1] = (rgb[j + 1] * a + 127) ~/ 255;
    out[k + 2] = (rgb[j + 2] * a + 127) ~/ 255;
    out[k + 3] = a;
  }
  return out;
}

Uint8List encodeFor(img.Image image, BgFill fill) =>
    fill.isTransparent ? img.encodePng(image, level: 6) : img.encodeJpg(image, quality: 92);

// ── compute() entry points ────────────────────────────────────────────────

class PrepareJob {
  const PrepareJob(this.bytes, this.outPath);

  /// Encoded photo (already EXIF-rotated and roughly downscaled natively
  /// when possible).
  final Uint8List bytes;
  final String outPath;
}

/// Decodes, applies EXIF orientation, caps the size and writes a plain JPEG
/// (no EXIF) to [PrepareJob.outPath], so ML Kit's mask and our pixels share
/// exactly the same size and orientation. Returns (width, height).
Future<({int width, int height})> prepareInIsolate(PrepareJob job) async {
  var image = img.decodeImage(job.bytes);
  if (image == null) throw const FormatException('unsupported image');
  image = img.bakeOrientation(image);
  final size = fitLongSide(image.width, image.height);
  if (size.width != image.width || size.height != image.height) {
    image = img.copyResize(image, width: size.width, height: size.height, interpolation: img.Interpolation.average);
  }
  if (image.numChannels != 3) image = image.convert(numChannels: 3);
  await File(job.outPath).writeAsBytes(img.encodeJpg(image, quality: 95), flush: true);
  return (width: image.width, height: image.height);
}

class CutoutJob {
  const CutoutJob(this.sourcePath, this.mask, this.width, this.height);

  final String sourcePath;
  final Float32List mask;
  final int width, height;
}

class CutoutResult {
  const CutoutResult({
    required this.alpha,
    required this.previewRgba,
    required this.width,
    required this.height,
    required this.found,
  });

  final Uint8List alpha;

  /// Premultiplied RGBA cut-out for the preview; empty when [found] is false.
  final Uint8List previewRgba;
  final int width, height;
  final bool found;
}

Future<CutoutResult> cutoutInIsolate(CutoutJob job) async {
  final alpha = maskToAlpha(job.mask, job.width, job.height, featherRadius: featherRadiusFor(job.width, job.height));
  if (!hasSubject(alpha)) {
    return CutoutResult(alpha: alpha, previewRgba: Uint8List(0), width: job.width, height: job.height, found: false);
  }
  final src = await _loadSource(job.sourcePath, job.width, job.height);
  return CutoutResult(
    alpha: alpha,
    previewRgba: premultipliedRgba(src, alpha),
    width: job.width,
    height: job.height,
    found: true,
  );
}

class ExportJob {
  const ExportJob(this.sourcePath, this.alpha, this.width, this.height, this.fill);

  final String sourcePath;
  final Uint8List alpha;
  final int width, height;
  final BgFill fill;
}

Future<Uint8List> exportInIsolate(ExportJob job) async {
  final src = await _loadSource(job.sourcePath, job.width, job.height);
  return encodeFor(composite(src, job.alpha, job.fill), job.fill);
}

Future<img.Image> _loadSource(String path, int width, int height) async {
  final image = img.decodeJpg(await File(path).readAsBytes());
  if (image == null || image.width != width || image.height != height) {
    throw StateError('prepared image changed');
  }
  return image;
}
