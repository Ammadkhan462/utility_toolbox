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

  String get description => switch (this) {
    UpscaleFactor.x2 => 'Fast — great for most photos',
    UpscaleFactor.x4 => 'Best quality — slower processing',
  };
}

// ── Enhancement mode ────────────────────────────────────────────────────────

enum EnhanceMode {
  auto, // AI picks the best pass
  photo, // Optimised for real-world photos
  illustration, // Optimised for art / digital images
  face, // Extra face detail recovery
}

extension EnhanceModeExt on EnhanceMode {
  String get label => switch (this) {
    EnhanceMode.auto => 'Auto',
    EnhanceMode.photo => 'Photo',
    EnhanceMode.illustration => 'Illustration',
    EnhanceMode.face => 'Face Detail',
  };

  String get description => switch (this) {
    EnhanceMode.auto => 'AI selects the best model automatically',
    EnhanceMode.photo => 'Real-world photos & landscapes',
    EnhanceMode.illustration => 'Artwork, illustrations & anime',
    EnhanceMode.face => 'Portraits with face detail recovery',
  };
}

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
  });

  final File outputFile;
  final int originalWidth;
  final int originalHeight;
  final int outputWidth;
  final int outputHeight;
  final int originalBytes;
  final int outputBytes;
  final int processingMs;

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
    this.errorMessage = '',
    this.progress = 0.0,
    this.progressLabel = '',
    this.factor = UpscaleFactor.x2,
    this.mode = EnhanceMode.auto,
    this.denoise = 0.3,
    this.sharpen = 0.5,
    this.useCloud = false,
  });

  final UpscaleStatus status;
  final File? sourceFile;
  final UpscaleResult? result;
  final String errorMessage;
  final double progress; // 0.0–1.0 for progress bar
  final String progressLabel;
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
    String? errorMessage,
    double? progress,
    String? progressLabel,
    UpscaleFactor? factor,
    EnhanceMode? mode,
    double? denoise,
    double? sharpen,
    bool? useCloud,
    bool clearSource = false,
    bool clearResult = false,
  }) => UpscalerState(
    status: status ?? this.status,
    sourceFile: clearSource ? null : sourceFile ?? this.sourceFile,
    result: clearResult ? null : result ?? this.result,
    errorMessage: errorMessage ?? this.errorMessage,
    progress: progress ?? this.progress,
    progressLabel: progressLabel ?? this.progressLabel,
    factor: factor ?? this.factor,
    mode: mode ?? this.mode,
    denoise: denoise ?? this.denoise,
    sharpen: sharpen ?? this.sharpen,
    useCloud: useCloud ?? this.useCloud,
  );
}

// ── Providers ──────────────────────────────────────────────────────────────

// Real provider lives in ai_upscaler_notifier.dart
