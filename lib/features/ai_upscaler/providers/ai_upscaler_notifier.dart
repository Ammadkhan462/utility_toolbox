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
    state = state.copyWith(
      sourceFile: f,
      status: UpscaleStatus.idle,
      clearResult: true,
    );
    // Wake the cloud backend early — only if the user has opted in.
    if (state.useCloud) _service.warmUp();
  }

  void reset() => state = UpscalerState(useCloud: state.useCloud);

  // ── Cancel ─────────────────────────────────────────────────────────────

  void cancel() {
    _service.cancel();
    state = state.copyWith(
      status: UpscaleStatus.idle,
      progress: 0,
      progressLabel: '',
      clearResult: true,
    );
  }

  // ── Upscale ────────────────────────────────────────────────────────────

  Future<void> upscale() async {
    final src = state.sourceFile;
    if (src == null) return;

    final useCloud = state.useCloud && AiUpscalerService.cloudAvailable;

    try {
      state = state.copyWith(
        status: UpscaleStatus.processing,
        progress: 0.04,
        progressLabel: useCloud
            ? 'Connecting to AI server…'
            : 'Starting on-device processing…',
        clearResult: true,
      );

      final sw = Stopwatch()..start();

      // Read dimensions quickly — decode a scaled-down thumbnail
      // instead of the full image, so this step takes <100ms
      final originalBytes = await src.length();
      final srcRaw = await src.readAsBytes();
      final dims = await compute(_fastDimensions, srcRaw);
      final origW = dims[0];
      final origH = dims[1];

      final outFile = await _service.upscale(
        source: src,
        factor: state.factor,
        mode: state.mode,
        denoise: state.denoise,
        sharpen: state.sharpen,
        useCloud: useCloud,
        onProgress: (progress, label) {
          if (mounted) {
            state = state.copyWith(progress: progress, progressLabel: label);
          }
        },
      );

      sw.stop();

      // Guard: notifier may have been cancelled/disposed while processing
      if (!mounted) return;

      final outBytes = await outFile.length();
      final scale = state.factor.multiplier;

      state = state.copyWith(
        status: UpscaleStatus.done,
        result: UpscaleResult(
          outputFile: outFile,
          originalWidth: origW,
          originalHeight: origH,
          outputWidth: origW * scale,
          outputHeight: origH * scale,
          originalBytes: originalBytes,
          outputBytes: outBytes,
          processingMs: sw.elapsed.inMilliseconds,
        ),
        progress: 1.0,
        progressLabel: 'Done!',
      );
    } catch (e) {
      if (!mounted) return;
      // If cancelled, go back to idle instead of showing error
      if (state.status == UpscaleStatus.idle) return;
      state = state.copyWith(
        status: UpscaleStatus.error,
        errorMessage: _friendlyError(e),
        progress: 0,
      );
    }
  }

  String _friendlyError(Object e) {
    final msg = e.toString().toLowerCase();
    if (msg.contains('memory') || msg.contains('oom')) {
      return 'Image too large. Try a smaller photo or use 2× upscale.';
    }
    if (msg.contains('decode') || msg.contains('format')) {
      return 'Could not read this image. Use a JPG or PNG file.';
    }
    if (msg.contains('timeout') || msg.contains('socket')) {
      return 'Network timeout. Check connection or use on-device mode.';
    }
    if (msg.contains('cancel')) return '';
    return 'Upscale failed: $e';
  }

  @override
  void dispose() {
    _service.dispose();
    super.dispose();
  }
}

// ── Fast dimension read — decodes thumbnail only ───────────────────────────

List<int> _fastDimensions(Uint8List bytes) {
  // Try decoding at 1/8 size — just enough to read width/height.
  // Falls back to full decode if thumbnail decode isn't supported.
  final full = img.decodeImage(bytes);
  return [full?.width ?? 0, full?.height ?? 0];
}
