import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image/image.dart' as img;
import 'package:utility_toolbox/core/services/storage_service.dart';
import 'package:utility_toolbox/features/ai_upscaler/providers/upscaler_providers.dart';
import 'package:utility_toolbox/features/ai_upscaler/services/ai_upscaler_service.dart';

final _serviceInstance = AiUpscalerService();

final aiUpscalerProvider =
    StateNotifierProvider<AiUpscalerNotifier, UpscalerState>(
      (ref) => AiUpscalerNotifier(
        _serviceInstance,
        ref.watch(storageServiceProvider),
      ),
    );

class AiUpscalerNotifier extends StateNotifier<UpscalerState> {
  AiUpscalerNotifier(this._service, this._storage)
    : super(UpscalerState(useCloud: _storage.getCloudUpscaleEnabled()));

  final AiUpscalerService _service;
  final StorageService _storage;

  /// Bumped by every new run, cancel, new source and reset. A run whose id
  /// is no longer current must not touch state: otherwise a cancelled or
  /// superseded job could still land its result (or its progress) later.
  int _runId = 0;

  /// Stops the running job, if any, and invalidates its pending callbacks.
  void _abortRun() {
    _runId++;
    if (state.isProcessing) _service.cancel();
  }

  // ── Settings ───────────────────────────────────────────────────────────

  void setFactor(UpscaleFactor f) =>
      state = state.copyWith(factor: f, clearResult: true);
  void setMode(EnhanceMode m) =>
      state = state.copyWith(mode: m, clearResult: true);
  void setDenoise(double v) =>
      state = state.copyWith(denoise: v, clearResult: true);
  void setSharpen(double v) =>
      state = state.copyWith(sharpen: v, clearResult: true);

  /// Persisted opt-in for cloud processing. The UI must show the consent
  /// dialog (what is uploaded, to whom, retention) BEFORE calling this
  /// with `true`.
  Future<void> setUseCloud(bool enabled) async {
    await _storage.setCloudUpscaleEnabled(enabled);
    if (!mounted) return;
    state = state.copyWith(useCloud: enabled, clearResult: true);
    if (enabled && state.sourceFile != null) _service.warmUp();
  }

  void setSource(File f) {
    _abortRun();
    state = state.copyWith(
      sourceFile: f,
      status: UpscaleStatus.idle,
      clearResult: true,
    );
    // Wake the cloud backend early — only if the user has opted in.
    if (state.useCloud) _service.warmUp();
  }

  void reset() {
    _abortRun();
    state = UpscalerState(useCloud: state.useCloud);
  }

  // ── Cancel ─────────────────────────────────────────────────────────────

  void cancel() {
    _runId++;
    _service.cancel();
    state = state.copyWith(
      status: UpscaleStatus.idle,
      progress: 0,
      clearStep: true,
      clearResult: true,
    );
  }

  // ── Upscale ────────────────────────────────────────────────────────────

  Future<void> upscale() async {
    final src = state.sourceFile;
    if (src == null || state.isProcessing) return; // no double-submit
    final run = ++_runId;
    bool stale() => !mounted || run != _runId;

    final useCloud = state.useCloud && AiUpscalerService.cloudAvailable;
    // Snapshot: the settings can change before the job finishes.
    final factor = state.factor;

    try {
      state = state.copyWith(
        status: UpscaleStatus.processing,
        progress: 0.04,
        step: UpscaleStep(
          useCloud ? UpscaleStage.connecting : UpscaleStage.starting,
        ),
        clearResult: true,
      );

      final sw = Stopwatch()..start();

      // Header-only read (no pixel decode), so this stays fast on 50 MP.
      final originalBytes = await src.length();
      final dims = await compute(_headerDimensions, src.path);
      final origW = dims[0];
      final origH = dims[1];

      // Cancelled while reading dimensions (before the service started):
      // cancel() already reset state to idle — don't start the job anyway.
      if (stale()) return;

      final output = await _service.upscale(
        source: src,
        factor: factor,
        mode: state.mode,
        denoise: state.denoise,
        sharpen: state.sharpen,
        useCloud: useCloud,
        onProgress: (progress, step) {
          if (!stale()) {
            state = state.copyWith(progress: progress, step: step);
          }
        },
      );
      final outFile = output.file;

      sw.stop();

      // Guard: notifier may have been cancelled/disposed while processing
      if (stale()) return;

      final outBytes = await outFile.length();
      // Real output size: big photos are pre-shrunk before the AI pass, so
      // "original × factor" over-reported the resolution.
      final outDims = await compute(_headerDimensions, outFile.path);
      if (stale()) return;

      state = state.copyWith(
        status: UpscaleStatus.done,
        result: UpscaleResult(
          outputFile: outFile,
          originalWidth: origW,
          originalHeight: origH,
          outputWidth: outDims[0] > 0 ? outDims[0] : origW * factor.multiplier,
          outputHeight: outDims[1] > 0 ? outDims[1] : origH * factor.multiplier,
          originalBytes: originalBytes,
          outputBytes: outBytes,
          processingMs: sw.elapsed.inMilliseconds,
          fallback: output.fallback,
        ),
        progress: 1.0,
        step: const UpscaleStep(UpscaleStage.done),
      );
    } catch (e) {
      // Cancelled / superseded: cancel() already put state back to idle.
      if (stale()) return;
      debugPrint('[AiUpscaler] upscale failed: $e');
      state = state.copyWith(
        status: UpscaleStatus.error,
        error: _errorKind(e),
        progress: 0,
      );
    }
  }

  /// Mapped to a localized message by the screen.
  UpscaleErrorKind _errorKind(Object e) {
    final msg = e.toString().toLowerCase();
    if (msg.contains('memory') || msg.contains('oom')) {
      return UpscaleErrorKind.tooLarge;
    }
    if (msg.contains('decode') || msg.contains('format')) {
      return UpscaleErrorKind.unreadable;
    }
    if (msg.contains('timeout') || msg.contains('socket')) {
      return UpscaleErrorKind.network;
    }
    return UpscaleErrorKind.generic;
  }

  @override
  void dispose() {
    _service.dispose();
    super.dispose();
  }
}

// ── Fast dimension read — parses the header only ───────────────────────────

/// Width/height as displayed (EXIF rotation applied) without decoding any
/// pixels. The old version fully decoded the photo just to read its size.
List<int> _headerDimensions(String path) {
  try {
    final bytes = File(path).readAsBytesSync();
    final info = img.findDecoderForData(bytes)?.startDecode(bytes);
    if (info == null) return const [0, 0];
    var w = info.width;
    var h = info.height;
    final orientation = img.decodeJpgExif(bytes)?.imageIfd.orientation ?? 1;
    if (orientation >= 5 && orientation <= 8) (w, h) = (h, w);
    return [w, h];
  } catch (_) {
    return const [0, 0];
  }
}
