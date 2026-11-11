import 'dart:io';

// ── Upscale factor ─────────────────────────────────────────────────────────

enum UpscaleFactor { x2, x4 }

extension UpscaleFactorExt on UpscaleFactor {
  int get multiplier => switch (this) {
    UpscaleFactor.x2 => 2,
    UpscaleFactor.x4 => 4,
  };

  String get label => switch (this) {
    UpscaleFactor.x2 => '2×',
    UpscaleFactor.x4 => '4×',
  };
}

// ── Enhancement mode ────────────────────────────────────────────────────────

enum EnhanceMode {
  auto, // AI picks the best pass
  photo, // Optimised for real-world photos
  illustration, // Optimised for art / digital images
  face, // Extra face detail recovery
}

// Labels for modes, factors, progress steps and errors are localized in the
// screen (ai_upscaler_screen.dart); the data here stays language-neutral.

// ── Progress steps ─────────────────────────────────────────────────────────

/// What the pipeline is doing right now. Sent instead of display text so
/// the screen can show it in the app language (isolates have no l10n).
enum UpscaleStage {
  starting,
  connecting,
  onDevice,
  cloudUnavailable,
  uploading,
  restoringFaces,
  preparing,
  loadingModel,
  downloadingModel,
  fallback,
  decoding,

  /// args: [fromResolution, toResolution] e.g. ['4032×3024', '1280×960']
  resizingInput,
  denoising,

  /// args: [factor]
  upscaling,

  /// args: [doneTiles, totalTiles]
  aiTiles,
  sharpening,
  colourGrading,
  saving,
  done,
}

class UpscaleStep {
  const UpscaleStep(this.stage, [this.args = const []]);
  final UpscaleStage stage;
  final List<Object> args;
}

/// Why the result didn't come from the preferred pipeline.
enum UpscaleFallback {
  /// Cloud was enabled but unreachable: processed on this device.
  cloudUnavailable,

  /// The on-device AI model isn't downloaded yet and couldn't be fetched
  /// (offline): standard (bicubic) upscaling was used.
  modelUnavailable,

  /// The AI model couldn't run on this device: standard upscaling used.
  modelFailed,
}

enum UpscaleErrorKind { tooLarge, unreadable, network, generic }

// ── Result ─────────────────────────────────────────────────────────────────

class UpscaleResult {
  const UpscaleResult({
    required this.outputFile,
    required this.originalWidth,
    required this.originalHeight,
    required this.outputWidth,
    required this.outputHeight,
    required this.originalBytes,
    required this.outputBytes,
    required this.processingMs,
    this.fallback,
  });

  final File outputFile;
  final int originalWidth;
  final int originalHeight;
  final int outputWidth;
  final int outputHeight;
  final int originalBytes;
  final int outputBytes;
  final int processingMs;
  final UpscaleFallback? fallback;

  String get originalRes => '$originalWidth×$originalHeight';
  String get outputRes => '$outputWidth×$outputHeight';
  double get sizeRatiox => outputBytes / originalBytes;
}

// ── State ──────────────────────────────────────────────────────────────────

enum UpscaleStatus { idle, loadingModel, processing, done, error }

class UpscalerState {
  const UpscalerState({
    this.status = UpscaleStatus.idle,
    this.sourceFile,
    this.result,
    this.error,
    this.progress = 0.0,
    this.step,
    this.factor = UpscaleFactor.x2,
    this.mode = EnhanceMode.auto,
    this.denoise = 0.3,
    this.sharpen = 0.5,
    this.useCloud = false,
  });

  final UpscaleStatus status;
  final File? sourceFile;
  final UpscaleResult? result;
  final UpscaleErrorKind? error;
  final double progress; // 0.0–1.0 for progress bar
  final UpscaleStep? step;
  final UpscaleFactor factor;
  final EnhanceMode mode;
  final double denoise; // 0.0–1.0
  final double sharpen; // 0.0–1.0

  /// User opt-in for cloud processing (uploads the photo to our server).
  /// Off by default; see [AiUpscalerNotifier.setUseCloud].
  final bool useCloud;

  bool get isProcessing =>
      status == UpscaleStatus.loadingModel ||
      status == UpscaleStatus.processing;

  UpscalerState copyWith({
    UpscaleStatus? status,
    File? sourceFile,
    UpscaleResult? result,
    UpscaleErrorKind? error,
    double? progress,
    UpscaleStep? step,
    UpscaleFactor? factor,
    EnhanceMode? mode,
    double? denoise,
    double? sharpen,
    bool? useCloud,
    bool clearSource = false,
    bool clearResult = false,
    bool clearStep = false,
  }) => UpscalerState(
    status: status ?? this.status,
    sourceFile: clearSource ? null : sourceFile ?? this.sourceFile,
    result: clearResult ? null : result ?? this.result,
    error: error ?? this.error,
    progress: progress ?? this.progress,
    step: clearStep ? null : step ?? this.step,
    factor: factor ?? this.factor,
    mode: mode ?? this.mode,
    denoise: denoise ?? this.denoise,
    sharpen: sharpen ?? this.sharpen,
    useCloud: useCloud ?? this.useCloud,
  );
}

// ── Providers ──────────────────────────────────────────────────────────────

// Real provider lives in ai_upscaler_notifier.dart
