import 'dart:async';
import 'dart:math' as math;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sensors_plus/sensors_plus.dart';

class CompassState {
  final double heading;     // degrees 0–360, 0 = North
  /// Same heading but unwrapped (can go past 360 / below 0) so the dial can
  /// animate the short way across North instead of spinning a full turn.
  final double rotation;
  final bool   isAvailable;
  /// 0 = N, 1 = NE, 2 = E … 7 = NW (the screen shows localized letters).
  final int    cardinalIndex;

  const CompassState({
    this.heading = 0,
    this.rotation = 0,
    this.isAvailable = true,
    this.cardinalIndex = 0,
  });

  CompassState copyWith({double? heading, double? rotation, bool? isAvailable}) {
    final h = heading ?? this.heading;
    return CompassState(
      heading:     h,
      rotation:    rotation ?? this.rotation,
      isAvailable: isAvailable ?? this.isAvailable,
      cardinalIndex: ((h + 22.5) / 45).floor() % 8,
    );
  }
}

class CompassNotifier extends StateNotifier<CompassState> {
  CompassNotifier() : super(const CompassState()) {
    _init();
  }

  /// Low-pass factor for the raw sensor vectors (lower = smoother).
  static const _alpha = 0.2;

  StreamSubscription? _magSub;
  StreamSubscription? _accelSub;
  Timer? _noDataTimer;

  List<double>? _gravity;
  List<double>? _geomagnetic;
  double? _unwrapped;

  void _init() {
    try {
      // Missing sensors surface as stream errors, not as a synchronous throw.
      _accelSub = accelerometerEventStream(
        samplingPeriod: SensorInterval.uiInterval,
      ).listen((event) {
        _gravity = _lowPass([event.x, event.y, event.z], _gravity);
      }, onError: (_) => _markUnavailable());

      _magSub = magnetometerEventStream(
        samplingPeriod: SensorInterval.uiInterval,
      ).listen((event) {
        _noDataTimer?.cancel();
        _geomagnetic = _lowPass([event.x, event.y, event.z], _geomagnetic);
        _compute();
      }, onError: (_) => _markUnavailable());

      // Some phones without a magnetometer never emit an error, just silence.
      _noDataTimer = Timer(const Duration(seconds: 3), _markUnavailable);
    } catch (_) {
      state = state.copyWith(isAvailable: false);
    }
  }

  static List<double> _lowPass(List<double> input, List<double>? prev) {
    if (prev == null) return input;
    return [
      for (var i = 0; i < 3; i++) prev[i] + _alpha * (input[i] - prev[i]),
    ];
  }

  void _markUnavailable() {
    if (mounted) state = state.copyWith(isAvailable: false);
  }

  void _compute() {
    final g = _gravity, m = _geomagnetic;
    if (g == null || m == null) return;
    // SensorManager.getRotationMatrix + getOrientation equivalent.
    final ax = g[0], ay = g[1], az = g[2];
    final ex = m[0], ey = m[1], ez = m[2];

    final normA = math.sqrt(ax * ax + ay * ay + az * az);
    if (normA < 0.1) return; // free fall

    // Cross product H = E × A (magnetic east)
    final hx = ey * az - ez * ay;
    final hy = ez * ax - ex * az;
    final hz = ex * ay - ey * ax;

    final normH = math.sqrt(hx * hx + hy * hy + hz * hz);
    if (normH < 0.1) return; // device close to free fall or field near A

    final invH = 1.0 / normH;
    final invA = 1.0 / normA;
    final nhx = hx * invH, nhy = hy * invH, nhz = hz * invH;
    final nax = ax * invA, naz = az * invA;

    // M = A × H (magnetic north in the device frame); only My is needed.
    final my = naz * nhx - nax * nhz;

    // getOrientation: azimuth = atan2(R[1], R[4]) = atan2(Hy, My).
    // (The old atan2(Hy, Hx) was only right while the phone lay flat.)
    final azimuth = (math.atan2(nhy, my) * 180 / math.pi + 360) % 360;

    // Unwrap so 359° → 1° is a +2° step, not -358°.
    final prev = _unwrapped;
    final double next;
    if (prev == null) {
      next = azimuth;
    } else {
      final delta = ((azimuth - prev) % 360 + 540) % 360 - 180;
      next = prev + delta;
    }
    _unwrapped = next;

    if (!mounted) return;
    // Skip rebuilds for sub-degree jitter.
    if (prev != null && (next - state.rotation).abs() < 0.5 && state.isAvailable) {
      return;
    }
    state = state.copyWith(heading: azimuth, rotation: next, isAvailable: true);
  }

  @override
  void dispose() {
    _noDataTimer?.cancel();
    _accelSub?.cancel();
    _magSub?.cancel();
    super.dispose();
  }
}

// autoDispose: the accelerometer + magnetometer subscriptions are cancelled
// (via CompassNotifier.dispose) as soon as the compass screen is closed,
// instead of draining battery for the rest of the app session.
final compassProvider =
    StateNotifierProvider.autoDispose<CompassNotifier, CompassState>(
        (_) => CompassNotifier());
