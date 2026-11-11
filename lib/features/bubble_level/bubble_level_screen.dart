import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/features/bubble_level/level_math.dart';
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';

/// Spirit level: a 2-D bubble when the phone lies flat, a 1-D bar when it
/// stands on an edge. Accelerometer only, low-pass filtered, calibratable.
class BubbleLevelScreen extends StatefulWidget {
  const BubbleLevelScreen({super.key});

  @override
  State<BubbleLevelScreen> createState() => _BubbleLevelScreenState();
}

class _BubbleLevelScreenState extends State<BubbleLevelScreen> {
  static const _accent = Color(0xFF0088A8);
  static const _levelColor = Color(0xFF1FB85F);

  static const _kCalX = 'bubble_level_cal_x';
  static const _kCalY = 'bubble_level_cal_y';
  static const _kCalUpright = 'bubble_level_cal_upright';

  final _reading = ValueNotifier<LevelReading?>(null);
  final _filter = LowPassFilter();
  final _latch = LevelLatch();
  final _clock = Stopwatch();

  StreamSubscription<AccelerometerEvent>? _sub;
  Timer? _noDataTimer;
  LevelMode? _mode;
  LevelCalibration _cal = LevelCalibration.zero;
  bool _available = true;

  @override
  void initState() {
    super.initState();
    // The bar is drawn along the phone's edges, so the UI must not rotate
    // under it when the phone is turned sideways.
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    _loadCalibration();
    _listen();
  }

  @override
  void dispose() {
    _noDataTimer?.cancel();
    _sub?.cancel();
    _reading.dispose();
    SystemChrome.setPreferredOrientations(const []);
    super.dispose();
  }

  Future<void> _loadCalibration() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      if (!mounted) return;
      setState(() {
        _cal = LevelCalibration(
          x: prefs.getDouble(_kCalX) ?? 0,
          y: prefs.getDouble(_kCalY) ?? 0,
          upright: prefs.getDouble(_kCalUpright) ?? 0,
        );
      });
    } catch (e) {
      debugPrint('Level calibration load failed: $e');
    }
  }

  Future<void> _saveCalibration(LevelCalibration cal) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setDouble(_kCalX, cal.x);
      await prefs.setDouble(_kCalY, cal.y);
      await prefs.setDouble(_kCalUpright, cal.upright);
    } catch (e) {
      debugPrint('Level calibration save failed: $e');
    }
  }

  void _listen() {
    _clock.start();
    try {
      _sub = accelerometerEventStream(
        samplingPeriod: SensorInterval.gameInterval,
      ).listen(_onEvent, onError: (Object _) => _markUnavailable(), cancelOnError: true);
      // Some phones without the sensor stay silent instead of erroring.
      _noDataTimer = Timer(const Duration(seconds: 3), () {
        if (_filter.value == null) _markUnavailable();
      });
    } catch (_) {
      _markUnavailable();
    }
  }

  void _markUnavailable() {
    if (!mounted) return;
    setState(() => _available = false);
  }

  void _onEvent(AccelerometerEvent e) {
    final dt = _clock.elapsed;
    _clock.reset();
    final g = _filter.add(Vec3(e.x, e.y, e.z), dt);
    if (g.length < 1) return; // free fall / bogus sample
    final mode = modeFor(g, _mode);
    if (mode != _mode) {
      _latch.update(double.infinity); // re-arm the haptic for the new mode
      // Mode switch changes the hint text and buttons, so rebuild.
      setState(() => _mode = mode);
    }
    final reading = readingFor(g, mode, _cal);
    if (_latch.update(reading.displayAngle)) HapticFeedback.lightImpact();
    _reading.value = reading;
  }

  Future<void> _calibrate() async {
    final l = AppLocalizations.of(context);
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        icon: const Icon(Icons.tune_rounded),
        title: Text(l.bubbleLevelCalibrateTitle),
        content: Text(l.bubbleLevelCalibrateBody),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(l.commonCancel)),
          FilledButton(onPressed: () => Navigator.pop(ctx, true), child: Text(l.bubbleLevelCalibrate)),
        ],
      ),
    );
    if (ok != true || !mounted) return;
    final g = _filter.value;
    final mode = _mode;
    if (g == null || mode == null) return;
    final raw = readingFor(g, mode, LevelCalibration.zero);
    final cal = mode == LevelMode.surface ? _cal.copyWith(x: raw.x, y: raw.y) : _cal.copyWith(upright: raw.upright);
    setState(() => _cal = cal);
    HapticFeedback.mediumImpact();
    await _saveCalibration(cal);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l.bubbleLevelCalibrated)));
  }

  Future<void> _reset() async {
    final l = AppLocalizations.of(context);
    setState(() => _cal = LevelCalibration.zero);
    await _saveCalibration(LevelCalibration.zero);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l.bubbleLevelResetDone)));
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return ToolScaffold(
      title: l.toolBubbleLevelTitle,
      accentColor: _accent,
      body: !_available
          ? _Unavailable(text: l.bubbleLevelUnavailable)
          : Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 12, 20, 16),
              child: Column(
                children: [
                  Text(
                    _mode == LevelMode.upright ? l.bubbleLevelUprightHint : l.bubbleLevelSurfaceHint,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: Center(
                      child: RepaintBoundary(
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: CustomPaint(
                            painter: _LevelPainter(
                              reading: _reading,
                              accent: _accent,
                              levelColor: _levelColor,
                              track: theme.colorScheme.surface,
                              outline: theme.colorScheme.outlineVariant,
                              marks: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  ValueListenableBuilder<LevelReading?>(
                    valueListenable: _reading,
                    builder: (context, r, _) => _Readout(reading: r, levelColor: _levelColor, l: l),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: FilledButton.icon(
                          onPressed: _mode == null ? null : _calibrate,
                          icon: const Icon(Icons.tune_rounded),
                          label: Text(l.bubbleLevelCalibrate),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: _cal.isZero ? null : _reset,
                          icon: const Icon(Icons.restart_alt_rounded),
                          label: Text(l.bubbleLevelReset),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}

class _Readout extends StatelessWidget {
  const _Readout({required this.reading, required this.levelColor, required this.l});

  final LevelReading? reading;
  final Color levelColor;
  final AppLocalizations l;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final r = reading;
    final angle = r?.displayAngle ?? 0;
    final isLevel = r != null && angle <= levelTolerance;
    final text = '${angle.toStringAsFixed(1)}°';
    final color = isLevel ? levelColor : theme.colorScheme.onSurface;
    return Semantics(
      label: l.bubbleLevelAngleLabel(angle.toStringAsFixed(1)),
      value: isLevel ? l.bubbleLevelLevel : null,
      excludeSemantics: true,
      child: Column(
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              text,
              style: theme.textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.w800,
                color: color,
                fontFeatures: const [FontFeature.tabularFigures()],
              ),
            ),
          ),
          const SizedBox(height: 4),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 150),
            opacity: isLevel ? 1 : 0,
            child: Container(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 14, vertical: 4),
              decoration: BoxDecoration(
                color: levelColor.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.check_circle_rounded, color: levelColor, size: 20),
                  const SizedBox(width: 6),
                  Text(
                    l.bubbleLevelLevel,
                    style: TextStyle(color: levelColor, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
          if (r != null && r.mode == LevelMode.surface) ...[
            const SizedBox(height: 6),
            Text(
              l.bubbleLevelAxes(r.x.abs().toStringAsFixed(1), r.y.abs().toStringAsFixed(1)),
              style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}

class _Unavailable extends StatelessWidget {
  const _Unavailable({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsetsDirectional.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.sensors_off_rounded, size: 64, color: theme.colorScheme.onSurfaceVariant),
            const SizedBox(height: 16),
            Text(text, textAlign: TextAlign.center, style: theme.textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}

/// Paints the dial (surface) or tube (upright) plus the bubble. Repaints from
/// the notifier directly, so sensor updates never rebuild widgets.
class _LevelPainter extends CustomPainter {
  _LevelPainter({
    required this.reading,
    required this.accent,
    required this.levelColor,
    required this.track,
    required this.outline,
    required this.marks,
  }) : super(repaint: reading);

  final ValueNotifier<LevelReading?> reading;
  final Color accent, levelColor, track, outline, marks;

  @override
  void paint(Canvas canvas, Size size) {
    final r = reading.value;
    final isLevel = r != null && r.displayAngle <= levelTolerance;
    final bubbleColor = isLevel ? levelColor : accent;
    if (r == null || r.mode == LevelMode.surface) {
      _paintSurface(canvas, size, r, bubbleColor);
    } else {
      _paintUpright(canvas, size, r, bubbleColor);
    }
  }

  void _paintSurface(Canvas canvas, Size size, LevelReading? r, Color bubbleColor) {
    final c = size.center(Offset.zero);
    final radius = size.shortestSide / 2 - 4;
    final bubbleR = radius * 0.16;

    canvas.drawCircle(c, radius, Paint()..color = track);
    canvas.drawCircle(
      c,
      radius,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3
        ..color = outline,
    );
    final ring = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..color = marks.withValues(alpha: 0.35);
    canvas.drawCircle(c, radius * 0.5, ring);
    canvas.drawLine(c - Offset(radius, 0), c + Offset(radius, 0), ring);
    canvas.drawLine(c - Offset(0, radius), c + Offset(0, radius), ring);
    // Target ring: the bubble fits inside it when level.
    canvas.drawCircle(
      c,
      bubbleR + 6,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.5
        ..color = marks.withValues(alpha: 0.7),
    );

    var offset = Offset.zero;
    if (r != null) {
      final mag = math.sqrt(r.x * r.x + r.y * r.y);
      if (mag > 1e-6) {
        final t = bubbleOffset(mag) * (radius - bubbleR - 4);
        offset = Offset(r.x / mag * t, -r.y / mag * t);
      }
    }
    _paintBubble(canvas, c + offset, bubbleR, bubbleColor);
  }

  void _paintUpright(Canvas canvas, Size size, LevelReading r, Color bubbleColor) {
    final c = size.center(Offset.zero);
    final horizontal = r.axis == BarAxis.x;
    final long = size.shortestSide - 8;
    final thick = long * 0.2;
    final rect = Rect.fromCenter(center: c, width: horizontal ? long : thick, height: horizontal ? thick : long);
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(thick / 2));
    canvas.drawRRect(rrect, Paint()..color = track);
    canvas.drawRRect(
      rrect,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3
        ..color = outline,
    );
    final bubbleR = thick * 0.36;
    final markPaint = Paint()
      ..strokeWidth = 2.5
      ..color = marks.withValues(alpha: 0.7);
    for (final s in [-1.0, 1.0]) {
      final d = s * (bubbleR + 6);
      if (horizontal) {
        canvas.drawLine(c + Offset(d, -thick / 2 + 6), c + Offset(d, thick / 2 - 6), markPaint);
      } else {
        canvas.drawLine(c + Offset(-thick / 2 + 6, d), c + Offset(thick / 2 - 6, d), markPaint);
      }
    }
    final travel = long / 2 - bubbleR - 8;
    final t = bubbleOffset(r.upright) * travel;
    // + is towards device +x (right) or +y (up; screen y grows downwards).
    final pos = horizontal ? c + Offset(t, 0) : c + Offset(0, -t);
    _paintBubble(canvas, pos, bubbleR, bubbleColor);
  }

  void _paintBubble(Canvas canvas, Offset at, double radius, Color color) {
    canvas.drawCircle(at, radius, Paint()..color = color.withValues(alpha: 0.85));
    canvas.drawCircle(
      at - Offset(radius * 0.3, radius * 0.3),
      radius * 0.3,
      Paint()..color = Colors.white.withValues(alpha: 0.45),
    );
  }

  @override
  bool shouldRepaint(_LevelPainter old) =>
      old.accent != accent || old.track != track || old.outline != outline || old.marks != marks;
}
