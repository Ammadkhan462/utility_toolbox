import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utility_toolbox/core/utils/result.dart';

// ── Enhancement options ────────────────────────────────────────────────────

enum EnhancementPreset {
  original,
  vivid,
  cool,
  warm,
  dramatic,
  fade,
  vintage,
  noir,
}

class EnhancementSettings {
  const EnhancementSettings({
    this.preset       = EnhancementPreset.original,
    this.brightness   = 0.0,   // -1.0 to 1.0
    this.contrast     = 0.0,   // -1.0 to 1.0
    this.saturation   = 0.0,   // -1.0 to 1.0
    this.sharpness    = 0.0,   //  0.0 to 1.0
    this.blur         = 0.0,   //  0.0 to 1.0
    this.rotation     = 0,     // 0, 90, 180, 270
    this.flipH        = false,
    this.flipV        = false,
    this.outputQuality = 90,   // 10–100
  });

  final EnhancementPreset preset;
  final double brightness;
  final double contrast;
  final double saturation;
  final double sharpness;
  final double blur;
  final int    rotation;
  final bool   flipH;
  final bool   flipV;
  final int    outputQuality;

  EnhancementSettings copyWith({
    EnhancementPreset? preset,
    double? brightness,
    double? contrast,
    double? saturation,
    double? sharpness,
    double? blur,
    int?    rotation,
    bool?   flipH,
    bool?   flipV,
    int?    outputQuality,
  }) =>
      EnhancementSettings(
        preset:        preset        ?? this.preset,
        brightness:    brightness    ?? this.brightness,
        contrast:      contrast      ?? this.contrast,
        saturation:    saturation    ?? this.saturation,
        sharpness:     sharpness     ?? this.sharpness,
        blur:          blur          ?? this.blur,
        rotation:      rotation      ?? this.rotation,
        flipH:         flipH         ?? this.flipH,
        flipV:         flipV         ?? this.flipV,
        outputQuality: outputQuality ?? this.outputQuality,
      );

  // Map preset → slider deltas applied on top of manual sliders
  static const Map<EnhancementPreset, Map<String, double>> _presetDeltas = {
    EnhancementPreset.original: {},
    EnhancementPreset.vivid:    {'brightness': 0.1, 'contrast': 0.3, 'saturation': 0.5},
    EnhancementPreset.cool:     {'brightness': 0.05, 'saturation': 0.2, 'contrast': 0.1},
    EnhancementPreset.warm:     {'brightness': 0.1, 'saturation': 0.3, 'contrast': 0.05},
    EnhancementPreset.dramatic: {'contrast': 0.5, 'saturation': -0.1, 'brightness': -0.05},
    EnhancementPreset.fade:     {'brightness': 0.15, 'contrast': -0.3, 'saturation': -0.4},
    EnhancementPreset.vintage:  {'saturation': -0.3, 'contrast': 0.1, 'brightness': 0.05},
    EnhancementPreset.noir:     {'saturation': -1.0, 'contrast': 0.4},
  };

  Map<String, double> get presetDeltas =>
      _presetDeltas[preset] ?? {};
}

class EnhancerResult {
  const EnhancerResult({
    required this.file,
    required this.originalBytes,
    required this.enhancedBytes,
  });

  final File file;
  final int  originalBytes;
  final int  enhancedBytes;

  double get deltaPercent =>
      originalBytes == 0
          ? 0
          : ((enhancedBytes - originalBytes) / originalBytes * 100);
}

// ── Providers ──────────────────────────────────────────────────────────────

final sourceImageProvider   = StateProvider<File?>((ref) => null);
final enhancerSettingsProvider =
    StateProvider<EnhancementSettings>((ref) => const EnhancementSettings());
final enhancerResultProvider =
    StateProvider<Result<EnhancerResult>>((ref) => const Idle());
