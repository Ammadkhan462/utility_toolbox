/// Pure maths for the bubble level (no Flutter imports, unit tested).
///
/// Device axes follow Android's sensor frame: x to the right of the screen,
/// y towards the top of the screen, z out of the screen. The accelerometer
/// reports the reaction to gravity, so at rest the vector points *up*.
library;

import 'dart:math' as math;

class Vec3 {
  const Vec3(this.x, this.y, this.z);

  final double x, y, z;

  double get length => math.sqrt(x * x + y * y + z * z);

  @override
  String toString() => 'Vec3($x, $y, $z)';
}

const _rad2deg = 180 / math.pi;

/// Exponential low-pass filter with a time constant, so the smoothing is the
/// same whatever rate the sensor actually delivers (rates vary by phone).
class LowPassFilter {
  LowPassFilter({this.timeConstant = 0.12});

  /// Seconds; larger = smoother but slower to follow.
  final double timeConstant;

  Vec3? _value;

  Vec3? get value => _value;

  void reset() => _value = null;

  Vec3 add(Vec3 sample, Duration dt) {
    final prev = _value;
    if (prev == null) return _value = sample;
    final seconds = dt.inMicroseconds / 1e6;
    // Clamp: a long pause (app resumed) should snap, a zero dt must not stall.
    final a = (seconds <= 0 ? 0.0 : seconds / (timeConstant + seconds)).clamp(0.02, 1.0);
    return _value = Vec3(
      prev.x + a * (sample.x - prev.x),
      prev.y + a * (sample.y - prev.y),
      prev.z + a * (sample.z - prev.z),
    );
  }
}

enum LevelMode {
  /// Phone lying (roughly) flat: 2-D bubble.
  surface,

  /// Phone standing on an edge: 1-D bar along the edge closest to horizontal.
  upright,
}

/// Angle between the screen and the horizontal plane, 0° = flat, 90° = upright.
double screenTilt(Vec3 g) {
  final len = g.length;
  if (len < 1e-6) return 0;
  return math.acos((g.z.abs() / len).clamp(0.0, 1.0)) * _rad2deg;
}

/// Surface vs upright with hysteresis so the view doesn't flicker near 45°.
LevelMode modeFor(Vec3 g, LevelMode? previous) {
  final tilt = screenTilt(g);
  return switch (previous) {
    LevelMode.upright => tilt < 38 ? LevelMode.surface : LevelMode.upright,
    _ => tilt > 52 ? LevelMode.upright : LevelMode.surface,
  };
}

/// Tilt around the device y axis (+ = right edge raised) and around the x
/// axis (+ = top edge raised), in degrees. The bubble drifts to the raised
/// side, so these double as its screen offset (y flipped for screen coords).
({double x, double y}) surfaceAngles(Vec3 g) {
  final z = g.z.abs() < 1e-6 ? 1e-6 : g.z.abs();
  return (x: math.atan2(g.x, z) * _rad2deg, y: math.atan2(g.y, z) * _rad2deg);
}

/// Which device axis lies closest to horizontal while the phone stands up.
enum BarAxis {
  /// Short edge horizontal (portrait upright or upside down).
  x,

  /// Long edge horizontal (landscape).
  y,
}

BarAxis barAxisFor(Vec3 g) => g.y.abs() >= g.x.abs() ? BarAxis.x : BarAxis.y;

/// Signed tilt of the horizontal edge, in degrees within [-45, 45].
/// + means the bubble sits towards +axis (right for x, top for y).
double uprightAngle(Vec3 g, BarAxis axis) {
  final along = axis == BarAxis.x ? g.x : g.y;
  final across = axis == BarAxis.x ? g.y : g.x;
  return math.atan2(along, across.abs()) * _rad2deg;
}

/// Offsets saved by "Calibrate", subtracted from every reading.
class LevelCalibration {
  const LevelCalibration({this.x = 0, this.y = 0, this.upright = 0});

  final double x, y, upright;

  static const zero = LevelCalibration();

  bool get isZero => x == 0 && y == 0 && upright == 0;

  LevelCalibration copyWith({double? x, double? y, double? upright}) =>
      LevelCalibration(x: x ?? this.x, y: y ?? this.y, upright: upright ?? this.upright);
}

class LevelReading {
  const LevelReading({required this.mode, this.x = 0, this.y = 0, this.upright = 0, this.axis = BarAxis.x});

  final LevelMode mode;

  /// Calibrated surface angles (degrees).
  final double x, y;

  /// Calibrated upright angle (degrees).
  final double upright;
  final BarAxis axis;

  /// The single number shown to the user (always ≥ 0).
  double get angle => switch (mode) {
    LevelMode.surface => math.sqrt(x * x + y * y),
    LevelMode.upright => upright.abs(),
  };

  /// Rounded the way it is displayed, so "0.0°" and green always agree.
  double get displayAngle => (angle * 10).round() / 10;
}

LevelReading readingFor(Vec3 g, LevelMode mode, LevelCalibration cal) {
  if (mode == LevelMode.surface) {
    final a = surfaceAngles(g);
    return LevelReading(mode: mode, x: a.x - cal.x, y: a.y - cal.y);
  }
  final axis = barAxisFor(g);
  return LevelReading(mode: mode, upright: uprightAngle(g, axis) - cal.upright, axis: axis);
}

/// Level threshold, in degrees.
const levelTolerance = 0.5;

/// Tracks "is level" with hysteresis so the haptic tick fires once when the
/// bubble settles, not on every bit of sensor noise around the threshold.
class LevelLatch {
  LevelLatch({this.enter = levelTolerance, this.exit = 0.8});

  final double enter, exit;
  bool _level = false;

  bool get isLevel => _level;

  /// Returns true exactly when the state flips to level.
  bool update(double angle) {
    if (!_level && angle <= enter) {
      _level = true;
      return true;
    }
    if (_level && angle > exit) _level = false;
    return false;
  }
}

/// Maps an angle to a -1…1 offset with more resolution near zero (square-root
/// curve), so tiny corrections are visible yet 15° still reaches the edge.
double bubbleOffset(double degrees, {double maxDegrees = 15}) {
  final t = (degrees.abs() / maxDegrees).clamp(0.0, 1.0);
  return math.sqrt(t) * degrees.sign;
}
