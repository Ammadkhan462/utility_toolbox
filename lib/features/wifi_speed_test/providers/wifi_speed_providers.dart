import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utility_toolbox/features/wifi_speed_test/services/wifi_speed_test_service.dart';

// ─────────────────────────────────────────────────────────────────────────
//  Speed-test state
// ─────────────────────────────────────────────────────────────────────────

enum SpeedTestStatus { idle, testing, done, error }

enum SpeedTestPhase { idle, locate, ping, download, upload }

/// Why a run failed; the screen maps it to a localized message.
enum SpeedTestError { offline, timeout, failed }

class SpeedTestState {
  final SpeedTestStatus status;
  final SpeedTestPhase phase;
  final double liveMbps;
  final double downloadMbps;
  final double uploadMbps;
  final double progress;
  final String? serverIp;
  final String? serverLocation;
  /// Median round-trip time in ms; null until measured or if unreachable.
  final double? pingMs;
  final SpeedTestError? error;

  const SpeedTestState({
    this.status = SpeedTestStatus.idle,
    this.phase = SpeedTestPhase.idle,
    this.liveMbps = 0,
    this.downloadMbps = 0,
    this.uploadMbps = 0,
    this.progress = 0,
    this.serverIp,
    this.serverLocation,
    this.pingMs,
    this.error,
  });

  SpeedTestState copyWith({
    SpeedTestStatus? status,
    SpeedTestPhase? phase,
    double? liveMbps,
    double? downloadMbps,
    double? uploadMbps,
    double? progress,
    String? serverIp,
    String? serverLocation,
    double? pingMs,
    SpeedTestError? error,
  }) => SpeedTestState(
    status: status ?? this.status,
    phase: phase ?? this.phase,
    liveMbps: liveMbps ?? this.liveMbps,
    downloadMbps: downloadMbps ?? this.downloadMbps,
    uploadMbps: uploadMbps ?? this.uploadMbps,
    progress: progress ?? this.progress,
    serverIp: serverIp ?? this.serverIp,
    serverLocation: serverLocation ?? this.serverLocation,
    pingMs: pingMs ?? this.pingMs,
    error: error ?? this.error,
  );

  bool get isIdle => status == SpeedTestStatus.idle;
  bool get isTesting => status == SpeedTestStatus.testing;
  bool get isDone => status == SpeedTestStatus.done;
  bool get isError => status == SpeedTestStatus.error;
}

// ─────────────────────────────────────────────────────────────────────────
//  Notifier
// ─────────────────────────────────────────────────────────────────────────

class SpeedTestNotifier extends StateNotifier<SpeedTestState> {
  SpeedTestNotifier() : super(const SpeedTestState());

  WifiSpeedTestService? _activeService;
  bool _cancelled = false;

  Future<void> runTest() async {
    // Ignore taps while a run is already in flight (double-tap on GO).
    if (state.isTesting && _activeService != null) return;
    _cancelled = false;
    _activeService?.cancel();
    final service = WifiSpeedTestService();
    _activeService = service;
    // A run is stale once cancelled or superseded by a newer run.
    bool stale() => _cancelled || !identical(_activeService, service);

    state = const SpeedTestState(
      status: SpeedTestStatus.testing,
      phase: SpeedTestPhase.locate,
      progress: 0.04,
    );

    try {
      // 1. Locate / Client Info
      final info = await service.fetchClientInfo();
      if (stale()) return;

      state = state.copyWith(
        serverIp: info.ip,
        serverLocation: info.serverLocation,
        phase: SpeedTestPhase.ping,
        progress: 0.06,
      );

      // 1b. Latency (a few TCP handshakes; null if the server is unreachable)
      final ping = await service.measureLatency();
      if (stale()) return;

      state = state.copyWith(
        pingMs: ping,
        phase: SpeedTestPhase.download,
        progress: 0.10,
        liveMbps: 0,
      );

      // 2. Download Test
      final finalDl = await service.runDownloadTest(
        onProgress: (live, prog) {
          if (stale()) return;
          final overall = 0.10 + (prog * 0.45);
          state = state.copyWith(
            liveMbps: live,
            downloadMbps: live,
            progress: overall,
          );
        },
      );
      if (stale()) return;

      // 3. Upload Transition
      state = state.copyWith(
        downloadMbps: finalDl,
        liveMbps: 0,
        phase: SpeedTestPhase.upload,
        progress: 0.55,
      );

      // 4. Upload Test
      final finalUl = await service.runUploadTest(
        onProgress: (live, prog) {
          if (stale()) return;
          final overall = 0.55 + (prog * 0.40);
          state = state.copyWith(
            liveMbps: live,
            uploadMbps: live,
            progress: overall,
          );
        },
      );
      if (stale()) return;

      // 5. Completion
      state = state.copyWith(
        status: SpeedTestStatus.done,
        downloadMbps: finalDl,
        uploadMbps: finalUl,
        liveMbps: 0,
        phase: SpeedTestPhase.idle,
        progress: 1.0,
      );
    } catch (e) {
      if (stale()) return;
      state = state.copyWith(
        status: SpeedTestStatus.error,
        error: _errorKind(e.toString()),
        phase: SpeedTestPhase.idle,
        liveMbps: 0,
      );
    }
  }

  void cancel() {
    _cancelled = true;
    _activeService?.cancel();
    _activeService = null;
    state = const SpeedTestState();
  }

  void reset() {
    _cancelled = false;
    _activeService?.cancel();
    _activeService = null;
    state = const SpeedTestState();
  }

  SpeedTestError _errorKind(String message) {
    final s = message.toLowerCase();
    if (s.contains('socket') ||
        s.contains('host lookup') ||
        s.contains('network') ||
        s.contains('connection')) {
      return SpeedTestError.offline;
    }
    if (s.contains('timeout')) return SpeedTestError.timeout;
    return SpeedTestError.failed;
  }

  @override
  void dispose() {
    _cancelled = true;
    _activeService?.cancel();
    _activeService = null;
    super.dispose();
  }
}

// autoDispose: leaving the screen cancels a running test instead of letting
// it keep downloading/uploading in the background.
final speedTestProvider =
    StateNotifierProvider.autoDispose<SpeedTestNotifier, SpeedTestState>(
      (_) => SpeedTestNotifier(),
    );
