import 'dart:math' as math;
import 'dart:typed_data';

import 'package:image/image.dart' as img;

enum OutputFormat { jpg, png, webp }

extension OutputFormatX on OutputFormat {
  String get ext => switch (this) {
    OutputFormat.jpg => 'jpg',
    OutputFormat.png => 'png',
    OutputFormat.webp => 'webp',
  };

  String get mime => switch (this) {
    OutputFormat.jpg => 'image/jpeg',
    OutputFormat.png => 'image/png',
    OutputFormat.webp => 'image/webp',
  };

  String get label => ext.toUpperCase();
}

/// How the output size is chosen.
sealed class ResizeSpec {
  const ResizeSpec();
}

/// Scale both sides by [percent] (1–100).
class PercentResize extends ResizeSpec {
  const PercentResize(this.percent);
  final int percent;
}

/// Shrink so the longer side is at most [maxSide]; never upscales.
class FitResize extends ResizeSpec {
  const FitResize(this.maxSide);
  final int maxSide;
}

/// Exactly [width]×[height]. With [crop] the image is scaled to cover and
/// center-cropped (no distortion); without, it is stretched.
class ExactResize extends ResizeSpec {
  const ExactResize(this.width, this.height, {this.crop = true});
  final int width;
  final int height;
  final bool crop;
}

class ResizePlan {
  const ResizePlan(this.scaledWidth, this.scaledHeight, {this.cropWidth, this.cropHeight});

  /// Size after scaling.
  final int scaledWidth;
  final int scaledHeight;

  /// Final center-crop size, if cropping.
  final int? cropWidth;
  final int? cropHeight;

  int get outWidth => cropWidth ?? scaledWidth;
  int get outHeight => cropHeight ?? scaledHeight;
}

/// Pure size maths, separated from pixel work so it can be unit-tested.
ResizePlan planResize(int srcW, int srcH, ResizeSpec spec) {
  int atLeast1(num v) => math.max(1, v.round());
  switch (spec) {
    case PercentResize(:final percent):
      final f = percent.clamp(1, 100) / 100;
      return ResizePlan(atLeast1(srcW * f), atLeast1(srcH * f));
    case FitResize(:final maxSide):
      final longer = math.max(srcW, srcH);
      if (longer <= maxSide) return ResizePlan(srcW, srcH);
      final f = maxSide / longer;
      return ResizePlan(atLeast1(srcW * f), atLeast1(srcH * f));
    case ExactResize(:final width, :final height, :final crop):
      if (!crop) return ResizePlan(width, height);
      final f = math.max(width / srcW, height / srcH);
      return ResizePlan(
        math.max(width, atLeast1(srcW * f)),
        math.max(height, atLeast1(srcH * f)),
        cropWidth: width,
        cropHeight: height,
      );
  }
}

class ResizeJob {
  const ResizeJob({
    required this.bytes,
    required this.spec,
    required this.format,
    required this.quality,
  });

  final Uint8List bytes;
  final ResizeSpec spec;
  final OutputFormat format;
  final int quality;
}

class ResizeOutput {
  const ResizeOutput(this.bytes, this.width, this.height, this.srcWidth, this.srcHeight);
  final Uint8List bytes;
  final int width;
  final int height;
  final int srcWidth;
  final int srcHeight;
}

/// Runs in a background isolate. WebP can't be encoded by package:image, so
/// for WebP this returns PNG bytes and the caller re-encodes natively.
ResizeOutput resizeInIsolate(ResizeJob job) {
  final decoded = img.decodeImage(job.bytes);
  if (decoded == null) throw const FormatException('Unsupported image');
  final source = img.bakeOrientation(decoded);
  final plan = planResize(source.width, source.height, job.spec);

  var out = (plan.scaledWidth == source.width && plan.scaledHeight == source.height)
      ? source
      : img.copyResize(
          source,
          width: plan.scaledWidth,
          height: plan.scaledHeight,
          interpolation: img.Interpolation.average,
        );
  if (plan.cropWidth != null && plan.cropHeight != null) {
    out = img.copyCrop(
      out,
      x: (out.width - plan.cropWidth!) ~/ 2,
      y: (out.height - plan.cropHeight!) ~/ 2,
      width: plan.cropWidth!,
      height: plan.cropHeight!,
    );
  }

  final encoded = switch (job.format) {
    OutputFormat.jpg => img.encodeJpg(out, quality: job.quality),
    OutputFormat.png || OutputFormat.webp => img.encodePng(out, level: 6),
  };
  return ResizeOutput(encoded, out.width, out.height, source.width, source.height);
}
