import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_new/return_code.dart';
import 'package:ffmpeg_kit_flutter_new/ffprobe_kit.dart';
import 'package:share_plus/share_plus.dart';

enum VideoConvertStatus { idle, picking, probing, converting, done, error }

class VideoFormat {
  final String ext;
  final String label;
  final String description;
  final String ffmpegArgs; // extra args after input, before output

  const VideoFormat({
    required this.ext,
    required this.label,
    required this.description,
    required this.ffmpegArgs,
  });
}

// Default format as a standalone const so it can be used as a default parameter value.
// (kVideoFormats[0] is NOT a compile-time constant in Dart — list index access isn't.)
const kDefaultVideoFormat = VideoFormat(
  ext: 'mp4',
  label: 'MP4',
  description: 'Most compatible',
  ffmpegArgs: '-c:v libx264 -c:a aac -movflags +faststart',
);

const kVideoFormats = <VideoFormat>[
  kDefaultVideoFormat,
  VideoFormat(
    ext: 'mkv',
    label: 'MKV',
    description: 'Best quality',
    ffmpegArgs: '-c:v libx264 -c:a aac',
  ),
  VideoFormat(
    ext: 'avi',
    label: 'AVI',
    description: 'Legacy format',
    ffmpegArgs: '-c:v libxvid -c:a libmp3lame',
  ),
  VideoFormat(
    ext: 'webm',
    label: 'WebM',
    description: 'Web optimized',
    ffmpegArgs: '-c:v libvpx-vp9 -c:a libopus',
  ),
  VideoFormat(
    ext: 'gif',
    label: 'GIF',
    description: 'Animated (no audio)',
    ffmpegArgs: '-vf fps=10,scale=480:-1:flags=lanczos -loop 0',
  ),
  VideoFormat(
    ext: 'mp3',
    label: 'MP3',
    description: 'Audio only',
    ffmpegArgs: '-vn -c:a libmp3lame -q:a 2',
  ),
  VideoFormat(
    ext: 'aac',
    label: 'AAC',
    description: 'Audio only (HQ)',
    ffmpegArgs: '-vn -c:a aac -b:a 192k',
  ),
  VideoFormat(
    ext: 'wav',
    label: 'WAV',
    description: 'Uncompressed audio',
    ffmpegArgs: '-vn -c:a pcm_s16le',
  ),
];

class VideoConverterState {
  final VideoConvertStatus status;
  final String? inputPath;
  final String? outputPath;
  final String? error;
  final double progress; // 0.0–1.0
  final VideoFormat outputFormat;
  final String? probeInfo; // raw ffprobe summary

  const VideoConverterState({
    this.status = VideoConvertStatus.idle,
    this.inputPath,
    this.outputPath,
    this.error,
    this.progress = 0,
    this.outputFormat = kDefaultVideoFormat, // ← const, not a list index
    this.probeInfo,
  });

  VideoConverterState copyWith({
    VideoConvertStatus? status,
    String? inputPath,
    String? outputPath,
    String? error,
    double? progress,
    VideoFormat? outputFormat,
    String? probeInfo,
  }) => VideoConverterState(
    status: status ?? this.status,
    inputPath: inputPath ?? this.inputPath,
    outputPath: outputPath ?? this.outputPath,
    error: error ?? this.error,
    progress: progress ?? this.progress,
    outputFormat: outputFormat ?? this.outputFormat,
    probeInfo: probeInfo ?? this.probeInfo,
  );

  String? get inputFilename =>
      inputPath != null ? p.basename(inputPath!) : null;
  String? get outputFilename =>
      outputPath != null ? p.basename(outputPath!) : null;
}

class VideoConverterNotifier extends StateNotifier<VideoConverterState> {
  VideoConverterNotifier() : super(const VideoConverterState());

  void setFormat(VideoFormat fmt) => state = state.copyWith(outputFormat: fmt);

  Future<void> pickFile() async {
    state = state.copyWith(status: VideoConvertStatus.picking);

    final result = await FilePicker.platform.pickFiles(
      type: FileType.video,
      allowMultiple: false,
    );

    if (result == null || result.files.isEmpty) {
      state = state.copyWith(status: VideoConvertStatus.idle);
      return;
    }

    final inputPath = result.files.first.path!;
    state = state.copyWith(
      status: VideoConvertStatus.probing,
      inputPath: inputPath,
    );

    // Probe for info
    try {
      final session = await FFprobeKit.getMediaInformation(inputPath);
      final info = session.getMediaInformation();
      final format = info?.getFormat() ?? 'unknown';
      final dur = info?.getDuration() ?? '?';
      state = state.copyWith(
        status: VideoConvertStatus.idle,
        probeInfo: 'Format: $format · Duration: ${_formatDuration(dur)}',
      );
    } catch (_) {
      state = state.copyWith(status: VideoConvertStatus.idle);
    }
  }

  Future<void> convert() async {
    if (state.inputPath == null) return;
    state = state.copyWith(
      status: VideoConvertStatus.converting,
      progress: 0.05,
    );

    try {
      final outDir = await getTemporaryDirectory();
      final baseName = p.basenameWithoutExtension(state.inputPath!);
      final outPath = p.join(
        outDir.path,
        '$baseName.${state.outputFormat.ext}',
      );

      // Remove output if exists
      final outFile = File(outPath);
      if (await outFile.exists()) await outFile.delete();

      state = state.copyWith(progress: 0.1);

      final cmd =
          '-i "${state.inputPath}" ${state.outputFormat.ffmpegArgs} "$outPath"';

      final session = await FFmpegKit.execute(cmd);
      final returnCode = await session.getReturnCode();

      if (ReturnCode.isSuccess(returnCode)) {
        state = state.copyWith(
          status: VideoConvertStatus.done,
          outputPath: outPath,
          progress: 1.0,
        );
      } else {
        final logs = await session.getAllLogsAsString();
        state = state.copyWith(
          status: VideoConvertStatus.error,
          error:
              'Conversion failed. This format may not be supported on your device.\n\n$logs',
        );
      }
    } catch (e) {
      state = state.copyWith(
        status: VideoConvertStatus.error,
        error: e.toString(),
      );
    }
  }

  Future<void> share() async {
    if (state.outputPath == null) return;
    await Share.shareXFiles([XFile(state.outputPath!)]);
  }

  void reset() => state = const VideoConverterState();

  String _formatDuration(String secStr) {
    final secs = double.tryParse(secStr) ?? 0;
    final m = (secs / 60).floor();
    final s = (secs % 60).floor();
    return '${m}m ${s}s';
  }
}

final videoConverterProvider =
    StateNotifierProvider<VideoConverterNotifier, VideoConverterState>(
      (_) => VideoConverterNotifier(),
    );

final selectedVideoFormatProvider = StateProvider<VideoFormat>(
  (_) => kDefaultVideoFormat,
);
