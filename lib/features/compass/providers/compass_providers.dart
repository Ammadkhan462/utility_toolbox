import 'dart:async';
import 'dart:math' as math;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sensors_plus/sensors_plus.dart';

class CompassState {
  final double heading;     // degrees 0–360, 0 = North
  final bool   isAvailable;
  final String cardinal;    // N, NE, E, SE, S, SW, W, NW

  const CompassState({
    this.heading = 0,
    this.isAvailable = true,
    this.cardinal = 'N',
  });

  CompassState copyWith({double? heading, bool? isAvailable}) {
    final h = heading ?? this.heading;
    return CompassState(
      heading:     h,
      isAvailable: isAvailable ?? this.isAvailable,
      cardinal:    _cardinal(h),
    );
  }

  static String _cardinal(double deg) {
    const dirs = ['N','NE','E','SE','S','SW','W','NW'];
    final idx  = ((deg + 22.5) / 45).floor() % 8;
    return dirs[idx];
  }
}

class CompassNotifier extends StateNotifier<CompassState> {
  CompassNotifier() : super(const CompassState()) {
    _init();
  }

  StreamSubscription? _magSub;
  StreamSubscription? _accelSub;

  List<double> _gravity = [0, 0, 9.8];
  List<double> _geomagnetic = [0, 0, 0];

  void _init() {
    try {
      // Missing sensors surface as stream errors, not as a synchronous throw.
      _accelSub = accelerometerEventStream().listen((event) {
        _gravity = [event.x, event.y, event.z];
        _compute();
      }, onError: (_) => _markUnavailable());

      _magSub = magnetometerEventStream().listen((event) {
        _geomagnetic = [event.x, event.y, event.z];
        _compute();
      }, onError: (_) => _markUnavailable());
    } catch (_) {
      state = state.copyWith(isAvailable: false);
    }
  }

  void _markUnavailable() {
    if (mounted) state = state.copyWith(isAvailable: false);
  }

  void _compute() {
    // SensorManager.getRotationMatrix equivalent using gravity + magnetometer
    // Based on Android SensorManager rotation matrix algorithm
    final ax = _gravity[0], ay = _gravity[1], az = _gravity[2];
    final ex = _geomagnetic[0], ey = _geomagnetic[1], ez = _geomagnetic[2];

    final normA = math.sqrt(ax * ax + ay * ay + az * az);
    if (normA == 0) return;

    // Cross product H = E × A (magnetic east)
    final hx = ey * az - ez * ay;
    final hy = ez * ax - ex * az;
    final hz = ex * ay - ey * ax;

    final normH = math.sqrt(hx * hx + hy * hy + hz * hz);
    if (normH < 0.1) return;

    final invH = 1.0 / normH;

    // Rotation matrix row 1 (H normalised)
    final r00 = hx * invH;
    final r10 = hy * invH;

    // Azimuth from rotation matrix
    double azimuth = math.atan2(r10, r00) * (180 / math.pi);
    azimuth = (azimuth + 360) % 360;

    if (mounted) {
      state = state.copyWith(heading: azimuth);
    }
  }

  @override
  void dispose() {
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
