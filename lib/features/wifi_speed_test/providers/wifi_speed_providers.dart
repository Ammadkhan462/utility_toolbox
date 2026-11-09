import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utility_toolbox/features/wifi_speed_test/services/wifi_speed_test_service.dart';

// ─────────────────────────────────────────────────────────────────────────
//  Speed-test state
// ─────────────────────────────────────────────────────────────────────────

enum SpeedTestStatus { idle, testing, done, error }

enum SpeedTestPhase { idle, locate, download, upload }

class SpeedTestState {
  final SpeedTestStatus status;
  final SpeedTestPhase phase;
  final double liveMbps;
  final double downloadMbps;
  final double uploadMbps;
  final double progress;
  final String? serverIp;
  final String? serverLocation;
  final String? error;

  const SpeedTestState({
    this.status = SpeedTestStatus.idle,
    this.phase = SpeedTestPhase.idle,
    this.liveMbps = 0,
    this.downloadMbps = 0,
    this.uploadMbps = 0,
    this.progress = 0,
    this.serverIp,
    this.serverLocation,
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
    String? error,
  }) => SpeedTestState(
    status: status ?? this.status,
    phase: phase ?? this.phase,
    liveMbps: liveMbps ?? this.liveMbps,
    downloadMbps: downloadMbps ?? this.downloadMbps,
    uploadMbps: uploadMbps ?? this.uploadMbps,
    progress: progress ?? this.progress,
    serverIp: serverIp ?? this.serverIp,
    serverLocation: serverLocation ?? this.serverLocation,
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
    _cancelled = false;
    _activeService?.cancel();
    final service = WifiSpeedTestService();
    _activeService = service;

    state = const SpeedTestState(
      status: SpeedTestStatus.testing,
      phase: SpeedTestPhase.locate,
      progress: 0.04,
    );

    try {
      // 1. Locate / Client Info
      final info = await service.fetchClientInfo();
      if (_cancelled) return;

      state = state.copyWith(
        serverIp: info.ip,
        serverLocation: info.serverLocation,
        phase: SpeedTestPhase.download,
        progress: 0.10,
        liveMbps: 0,
      );

      // 2. Download Test
      final finalDl = await service.runDownloadTest(
        onProgress: (live, prog) {
          if (_cancelled) return;
          final overall = 0.10 + (prog * 0.45);
          state = state.copyWith(
            liveMbps: live,
            downloadMbps: live,
            progress: overall,
          );
        },
      );
      if (_cancelled) return;

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
          if (_cancelled) return;
          final overall = 0.55 + (prog * 0.40);
          state = state.copyWith(
            liveMbps: live,
            uploadMbps: live,
            progress: overall,
          );
        },
      );
      if (_cancelled) return;

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
      if (_cancelled) return;
      state = state.copyWith(
        status: SpeedTestStatus.error,
        error: _friendlyError(e.toString()),
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

  String _friendlyError(String message) {
    final s = message.toLowerCase();
    if (s.contains('socket') ||
        s.contains('host lookup') ||
        s.contains('network') ||
        s.contains('connection')) {
      return 'No internet connection. Check your Wi-Fi or mobile data.';
    }
    if (s.contains('timeout')) {
      return 'The test timed out. Your connection may be unstable.';
    }
    return 'Test failed. Please try again.';
  }

  @override
  void dispose() {
    _cancelled = true;
    _activeService?.cancel();
    _activeService = null;
    super.dispose();
  }
}

final speedTestProvider =
    StateNotifierProvider<SpeedTestNotifier, SpeedTestState>(
      (_) => SpeedTestNotifier(),
    );
