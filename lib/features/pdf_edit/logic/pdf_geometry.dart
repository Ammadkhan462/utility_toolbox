import 'dart:ui';

/// Size and display rotation of one PDF page, as stored in the file.
///
/// [width]/[height] are the unrotated crop-box size in points — the space
/// Syncfusion's graphics use on a loaded page (top-left origin, y down).
/// [quarterTurns] is the page's `/Rotate` value divided by 90 (clockwise).
class PageGeom {
  const PageGeom(this.width, this.height, [this.quarterTurns = 0]);

  final double width;
  final double height;
  final int quarterTurns;

  Size get size => Size(width, height);

  /// The page as a viewer shows it (rotation applied).
  Size get visualSize =>
      quarterTurns.isOdd ? Size(height, width) : Size(width, height);

  /// Width / height of the page as displayed; never 0 or NaN.
  double get visualAspect {
    final v = visualSize;
    if (v.width <= 0 || v.height <= 0) return 1 / 1.4142;
    return v.width / v.height;
  }

  @override
  bool operator ==(Object other) =>
      other is PageGeom &&
      other.width == width &&
      other.height == height &&
      other.quarterTurns == quarterTurns;

  @override
  int get hashCode => Object.hash(width, height, quarterTurns);
}

/// Normalises any integer number of quarter turns into 0..3.
int normalizeTurns(int turns) => ((turns % 4) + 4) % 4;

/// Maps a point on the page *as displayed* (rotation applied, top-left
/// origin, points) to the unrotated page space Syncfusion draws in.
Offset visualToPagePoint(Offset v, Size unrotated, int quarterTurns) {
  final w = unrotated.width;
  final h = unrotated.height;
  switch (normalizeTurns(quarterTurns)) {
    case 1:
      return Offset(v.dy, h - v.dx);
    case 2:
      return Offset(w - v.dx, h - v.dy);
    case 3:
      return Offset(w - v.dy, v.dx);
    default:
      return v;
  }
}

/// The graphics transform that lets us draw in *visual* coordinates on a
/// rotated page: `translateTransform(translate)` then
/// `rotateTransform(rotateDegrees)` (Syncfusion: positive = clockwise).
/// This is the same transform Syncfusion applies itself to new rotated pages.
({Offset translate, double rotateDegrees}) visualTransform(
  Size unrotated,
  int quarterTurns,
) {
  final w = unrotated.width;
  final h = unrotated.height;
  switch (normalizeTurns(quarterTurns)) {
    case 1:
      return (translate: Offset(0, h), rotateDegrees: -90);
    case 2:
      return (translate: Offset(w, h), rotateDegrees: -180);
    case 3:
      return (translate: Offset(w, 0), rotateDegrees: -270);
    default:
      return (translate: Offset.zero, rotateDegrees: 0);
  }
}

/// A rect in 0..1 page fractions → points on the displayed page.
Rect denormalizeRect(Rect normalized, Size visual) => Rect.fromLTWH(
  normalized.left * visual.width,
  normalized.top * visual.height,
  normalized.width * visual.width,
  normalized.height * visual.height,
);

/// Keeps a normalised rect inside the page (0..1 on both axes), shrinking
/// it proportionally first if it is larger than the page.
Rect clampUnitRect(Rect r) {
  var w = r.width;
  var h = r.height;
  if (w <= 0 || h <= 0) return Rect.fromLTWH(0, 0, w.clamp(0, 1), h.clamp(0, 1));
  final shrink = [1 / w, 1 / h, 1.0].reduce((a, b) => a < b ? a : b);
  w *= shrink;
  h *= shrink;
  final left = r.left.clamp(0.0, 1.0 - w);
  final top = r.top.clamp(0.0, 1.0 - h);
  return Rect.fromLTWH(left, top, w, h);
}

/// Builds a signature box for a page: [widthFraction] of the page width,
/// keeping the image's [imageAspect] (w/h) on a page of [pageAspect] (w/h),
/// centred on [center] (fractions). Result is clamped onto the page.
Rect signatureRect({
  required Offset center,
  required double widthFraction,
  required double imageAspect,
  required double pageAspect,
}) {
  final w = widthFraction;
  // Height as a fraction of page height: (w * pageW / imageAspect) / pageH.
  final h = w * pageAspect / (imageAspect <= 0 ? 1 : imageAspect);
  return clampUnitRect(
    Rect.fromCenter(center: center, width: w, height: h),
  );
}
