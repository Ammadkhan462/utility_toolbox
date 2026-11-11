import 'dart:io';
import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

/// One finger stroke on the pad.
class SignatureStroke {
  SignatureStroke(this.color, this.width);

  final Color color;
  final double width;
  final List<Offset> points = [];
}

/// Holds the strokes and repaints the pad without rebuilding widgets, so
/// drawing stays smooth on slow phones.
class SignatureController extends ChangeNotifier {
  final List<SignatureStroke> _strokes = [];
  Color color = const Color(0xFF111111);
  double strokeWidth = 3.2;

  List<SignatureStroke> get strokes => _strokes;
  bool get isEmpty => _strokes.every((s) => s.points.isEmpty);

  void start(Offset point) {
    _strokes.add(SignatureStroke(color, strokeWidth)..points.add(point));
    notifyListeners();
  }

  void extend(Offset point) {
    if (_strokes.isEmpty) return;
    final pts = _strokes.last.points;
    // Skip sub-pixel jitter: fewer points, smoother curves.
    if (pts.isNotEmpty && (pts.last - point).distanceSquared < 1.5) return;
    pts.add(point);
    notifyListeners();
  }

  void undo() {
    if (_strokes.isEmpty) return;
    _strokes.removeLast();
    notifyListeners();
  }

  void clear() {
    _strokes.clear();
    notifyListeners();
  }

  /// Bounds of all ink, inflated by stroke width.
  Rect? get bounds {
    Rect? r;
    for (final s in _strokes) {
      for (final pt in s.points) {
        final box = Rect.fromCircle(center: pt, radius: s.width);
        r = r == null ? box : r.expandToInclude(box);
      }
    }
    return r;
  }

  /// Transparent PNG of the strokes, cropped to the ink, about [maxWidth]
  /// pixels wide. Returns null when nothing has been drawn.
  Future<SignatureImage?> toPng({double maxWidth = 1200}) async {
    final b = bounds;
    if (b == null || b.isEmpty) return null;
    final crop = b.inflate(6);
    final scale = math.min(4.0, maxWidth / crop.width);
    final w = (crop.width * scale).ceil().clamp(1, 4096);
    final h = (crop.height * scale).ceil().clamp(1, 4096);
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder)
      ..scale(scale)
      ..translate(-crop.left, -crop.top);
    paintStrokes(canvas, _strokes);
    final picture = recorder.endRecording();
    final image = await picture.toImage(w, h);
    picture.dispose();
    final data = await image.toByteData(format: ui.ImageByteFormat.png);
    image.dispose();
    if (data == null) return null;
    return SignatureImage(data.buffer.asUint8List(), w / h);
  }
}

/// A finished signature: PNG bytes plus width / height.
class SignatureImage {
  const SignatureImage(this.png, this.aspect);

  final Uint8List png;
  final double aspect;
}

/// Smooth strokes: quadratic curves through the midpoints of the samples.
void paintStrokes(Canvas canvas, List<SignatureStroke> strokes) {
  for (final s in strokes) {
    final paint = Paint()
      ..color = s.color
      ..strokeWidth = s.width
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true;
    final pts = s.points;
    if (pts.isEmpty) continue;
    if (pts.length == 1) {
      canvas.drawCircle(pts.first, s.width / 2, paint..style = PaintingStyle.fill);
      continue;
    }
    final path = Path()..moveTo(pts.first.dx, pts.first.dy);
    for (var i = 1; i < pts.length - 1; i++) {
      final mid = Offset((pts[i].dx + pts[i + 1].dx) / 2, (pts[i].dy + pts[i + 1].dy) / 2);
      path.quadraticBezierTo(pts[i].dx, pts[i].dy, mid.dx, mid.dy);
    }
    path.lineTo(pts.last.dx, pts.last.dy);
    canvas.drawPath(path, paint);
  }
}

/// The drawing surface. Paper-white in both themes so ink colours match
/// what ends up on the page.
class SignaturePad extends StatelessWidget {
  const SignaturePad({super.key, required this.controller, required this.hint});

  final SignatureController controller;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: ColoredBox(
        color: Colors.white,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Baseline to sign on.
            PositionedDirectional(
              start: 24,
              end: 24,
              bottom: 48,
              child: Container(height: 1.2, color: Colors.black26),
            ),
            ListenableBuilder(
              listenable: controller,
              builder: (_, _) => controller.isEmpty
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Text(
                          hint,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.black38, fontSize: 18),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onPanStart: (d) => controller.start(d.localPosition),
              onPanUpdate: (d) => controller.extend(d.localPosition),
              child: RepaintBoundary(
                child: CustomPaint(
                  painter: _SignaturePainter(controller),
                  size: Size.infinite,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SignaturePainter extends CustomPainter {
  _SignaturePainter(this.controller) : super(repaint: controller);

  final SignatureController controller;

  @override
  void paint(Canvas canvas, Size size) => paintStrokes(canvas, controller.strokes);

  @override
  bool shouldRepaint(_SignaturePainter old) => old.controller != controller;
}

/// Keeps one saved signature in the app's private documents folder.
class SignatureStore {
  const SignatureStore();

  Future<File> _file() async {
    final dir = Directory(p.join((await getApplicationDocumentsDirectory()).path, 'signatures'));
    await dir.create(recursive: true);
    return File(p.join(dir.path, 'signature.png'));
  }

  Future<SignatureImage?> load() async {
    try {
      final f = await _file();
      if (!await f.exists()) return null;
      final bytes = await f.readAsBytes();
      final codec = await ui.instantiateImageCodec(bytes);
      final frame = await codec.getNextFrame();
      final aspect = frame.image.width / frame.image.height;
      frame.image.dispose();
      codec.dispose();
      return SignatureImage(bytes, aspect);
    } catch (_) {
      return null;
    }
  }

  Future<void> save(SignatureImage sig) async {
    final f = await _file();
    await f.writeAsBytes(sig.png, flush: true);
  }

  Future<void> delete() async {
    try {
      final f = await _file();
      if (await f.exists()) await f.delete();
    } catch (_) {}
  }
}
