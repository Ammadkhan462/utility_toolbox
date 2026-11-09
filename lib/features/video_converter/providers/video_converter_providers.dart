import 'dart:async';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:ffmpeg_kit_flutter_new_audio/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_new_audio/ffmpeg_session.dart';
import 'package:ffmpeg_kit_flutter_new_audio/return_code.dart';
import 'package:ffmpeg_kit_flutter_new_audio/ffprobe_kit.dart';
import 'package:ffmpeg_kit_flutter_new_audio/statistics.dart';
import 'package:share_plus/share_plus.dart';

enum VideoConvertStatus { idle, picking, probing, converting, done, error }

/// How the video stream is (re-)encoded.
///
/// We ship the LGPL "audio" FFmpegKit build, which has no libx264 / libxvid /
/// libvpx. The only H.264 encoder available is the device's hardware encoder
/// via MediaCodec; when that is missing or rejects the stream we fall back to
/// FFmpeg's built-in (software, LGPL) MPEG-4 Part 2 encoder.
enum VideoEncoding {
  /// No video encoder flags (audio-only output, or GIF which uses the
  /// native gif encoder picked by the output extension).
  none,

  /// `h264_mediacodec` first; automatically retried with native `mpeg4`.
  hardwareH264,

  /// Native `mpeg4` only.
  mpeg4,
}

class VideoFormat {
  final String ext;
  final String label;
  final String description;
  final VideoEncoding videoEncoding;

  /// Extra args after the video codec args, before the output path
  /// (audio codec, filters, container flags). One list entry per argv token.
  final List<String> extraArgs;

  const VideoFormat({
    required this.ext,
    required this.label,
    required this.description,
    this.videoEncoding = VideoEncoding.none,
    required this.extraArgs,
  });
}

// Default format as a standalone const so it can be used as a default parameter value.
// (kVideoFormats[0] is NOT a compile-time constant in Dart — list index access isn't.)
const kDefaultVideoFormat = VideoFormat(
  ext: 'mp4',
  label: 'MP4',
  description: 'Most compatible',
  videoEncoding: VideoEncoding.hardwareH264,
  // -sn/-dn: subtitle/data streams often can't be remuxed into the target
  // container and would fail the whole conversion.
  extraArgs: ['-sn', '-dn', '-c:a', 'aac', '-movflags', '+faststart'],
);

const kVideoFormats = <VideoFormat>[
  kDefaultVideoFormat,
  VideoFormat(
    ext: 'mov',
    label: 'MOV',
    description: 'Apple / QuickTime',
    videoEncoding: VideoEncoding.hardwareH264,
    extraArgs: ['-sn', '-dn', '-c:a', 'aac', '-movflags', '+faststart'],
  ),
  VideoFormat(
    ext: 'mkv',
    label: 'MKV',
    description: 'Flexible container',
    videoEncoding: VideoEncoding.hardwareH264,
    extraArgs: ['-sn', '-dn', '-c:a', 'aac'],
  ),
  VideoFormat(
    ext: 'avi',
    label: 'AVI',
    description: 'Legacy format',
    videoEncoding: VideoEncoding.mpeg4,
    extraArgs: ['-sn', '-dn', '-c:a', 'libmp3lame'],
  ),
  VideoFormat(
    ext: 'gif',
    label: 'GIF',
    description: 'Animated (no audio)',
    extraArgs: ['-vf', 'fps=10,scale=480:-1:flags=lanczos', '-loop', '0'],
  ),
  VideoFormat(
    ext: 'mp3',
    label: 'MP3',
    description: 'Audio only',
    extraArgs: ['-vn', '-c:a', 'libmp3lame', '-q:a', '2'],
  ),
  VideoFormat(
    ext: 'm4a',
    label: 'M4A',
    description: 'Audio only (AAC)',
    extraArgs: ['-vn', '-c:a', 'aac', '-b:a', '192k', '-movflags', '+faststart'],
  ),
  VideoFormat(
    ext: 'aac',
    label: 'AAC',
    description: 'Audio only (raw)',
    extraArgs: ['-vn', '-c:a', 'aac', '-b:a', '192k'],
  ),
  VideoFormat(
    ext: 'wav',
    label: 'WAV',
    description: 'Uncompressed audio',
    extraArgs: ['-vn', '-c:a', 'pcm_s16le'],
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

  /// Probed input duration in ms; drives the progress bar. 0 = unknown.
  double _durationMs = 0;

  /// Probed container bitrate (bits/s); used to pick the MediaCodec bitrate.
  int? _sourceBitrate;

  /// Id of the running FFmpeg session, so cancel()/dispose() can stop it.
  int? _sessionId;
  bool _cancelRequested = false;

  void setFormat(VideoFormat fmt) => state = state.copyWith(outputFormat: fmt);

  Future<void> pickFile() async {
    state = state.copyWith(status: VideoConvertStatus.picking);

    final result = await FilePicker.platform.pickFiles(
      type: FileType.video,
      allowMultiple: false,
    );
    if (!mounted) return;

    if (result == null || result.files.isEmpty) {
      state = state.copyWith(status: VideoConvertStatus.idle);
      return;
    }

    final inputPath = result.files.first.path!;
    _durationMs = 0;
    _sourceBitrate = null;
    state = state.copyWith(
      status: VideoConvertStatus.probing,
      inputPath: inputPath,
    );

    // Probe for info
    try {
      final session = await FFprobeKit.getMediaInformation(inputPath);
      if (!mounted) return;
      final info = session.getMediaInformation();
      final format = info?.getFormat() ?? 'unknown';
      final dur = info?.getDuration() ?? '?';
      _durationMs = (double.tryParse(dur) ?? 0) * 1000;
      _sourceBitrate = int.tryParse(info?.getBitrate() ?? '');
      state = state.copyWith(
        status: VideoConvertStatus.idle,
        probeInfo: 'Format: $format · Duration: ${_formatDuration(dur)}',
      );
    } catch (_) {
      if (mounted) state = state.copyWith(status: VideoConvertStatus.idle);
    }
  }

  /// H.264 target bitrate for the hardware encoder: roughly the source
  /// bitrate (so we don't bloat or badly degrade), clamped to a sane range.
  String get _hwBitrate {
    const fallback = 4000000;
    final src = _sourceBitrate ?? fallback;
    return src.clamp(1500000, 10000000).toString();
  }

  List<String> _videoArgs(VideoEncoding enc, {required bool useHardware}) {
    switch (enc) {
      case VideoEncoding.none:
        return const [];
      case VideoEncoding.hardwareH264 when useHardware:
        return ['-c:v', 'h264_mediacodec', '-b:v', _hwBitrate];
      case VideoEncoding.hardwareH264:
      case VideoEncoding.mpeg4:
        return const ['-c:v', 'mpeg4', '-q:v', '3'];
    }
  }

  Future<void> convert() async {
    final inputPath = state.inputPath;
    if (inputPath == null) return;
    final fmt = state.outputFormat;
    _cancelRequested = false;
    state = state.copyWith(
      status: VideoConvertStatus.converting,
      progress: 0,
    );

    String? outPath;
    try {
      final outDir = await getTemporaryDirectory();
      final baseName = p.basenameWithoutExtension(inputPath);
      outPath = p.join(outDir.path, '$baseName.${fmt.ext}');

      var session = await _run(
        inputPath,
        outPath,
        fmt,
        useHardware: fmt.videoEncoding == VideoEncoding.hardwareH264,
      );
      var returnCode = await session.getReturnCode();

      // The MediaCodec encoder can be missing or refuse the input
      // (resolution / pixel format / vendor quirks). Retry once with the
      // always-available native mpeg4 encoder before reporting failure.
      if (!_cancelRequested &&
          !ReturnCode.isSuccess(returnCode) &&
          !ReturnCode.isCancel(returnCode) &&
          fmt.videoEncoding == VideoEncoding.hardwareH264) {
        if (!mounted) return;
        state = state.copyWith(progress: 0);
        session = await _run(inputPath, outPath, fmt, useHardware: false);
        returnCode = await session.getReturnCode();
      }

      if (!mounted) return;

      if (_cancelRequested || ReturnCode.isCancel(returnCode)) {
        await _deleteQuietly(outPath);
        if (!mounted) return;
        state = VideoConverterState(
          inputPath: state.inputPath,
          probeInfo: state.probeInfo,
          outputFormat: state.outputFormat,
        );
      } else if (ReturnCode.isSuccess(returnCode)) {
        state = state.copyWith(
          status: VideoConvertStatus.done,
          outputPath: outPath,
          progress: 1.0,
        );
      } else {
        final logs = await session.getAllLogsAsString() ?? '';
        if (!mounted) return;
        // The full FFmpeg log can be hundreds of KB; the tail holds the error.
        final tail = logs.length > 1500
            ? logs.substring(logs.length - 1500)
            : logs;
        state = state.copyWith(
          status: VideoConvertStatus.error,
          error:
              'Conversion failed. This format may not be supported on your device.\n\n$tail',
        );
      }
    } catch (e) {
      if (outPath != null) await _deleteQuietly(outPath);
      if (!mounted) return;
      state = state.copyWith(
        status: VideoConvertStatus.error,
        error: e.toString(),
      );
    } finally {
      _sessionId = null;
    }
  }

  /// Runs one FFmpeg pass asynchronously, reporting progress from the
  /// statistics callback, and completes when the session finishes.
  Future<FFmpegSession> _run(
    String inputPath,
    String outPath,
    VideoFormat fmt, {
    required bool useHardware,
  }) async {
    await _deleteQuietly(outPath);

    // Argument list (not an interpolated command string) so file names with
    // spaces or quotes are passed through verbatim.
    final args = <String>[
      '-y',
      '-hide_banner',
      '-i',
      inputPath,
      ..._videoArgs(fmt.videoEncoding, useHardware: useHardware),
      ...fmt.extraArgs,
      outPath,
    ];

    final done = Completer<FFmpegSession>();
    final session = await FFmpegKit.executeWithArgumentsAsync(
      args,
      (s) {
        if (!done.isCompleted) done.complete(s);
      },
      null,
      _onStatistics,
    );
    _sessionId = session.getSessionId();
    // cancel() may have been tapped before the session id was known.
    if (_cancelRequested && _sessionId != null) {
      await FFmpegKit.cancel(_sessionId);
    }
    return done.future;
  }

  void _onStatistics(Statistics stats) {
    if (!mounted || _durationMs <= 0) return;
    if (state.status != VideoConvertStatus.converting) return;
    final frac = (stats.getTime() / _durationMs).clamp(0.0, 0.99);
    // Avoid rebuilding the screen for sub-percent changes.
    if ((frac - state.progress).abs() >= 0.01) {
      state = state.copyWith(progress: frac);
    }
  }

  /// Stops the running conversion. The notifier returns to idle with the
  /// picked input kept, so the user can choose another format and retry.
  Future<void> cancel() async {
    if (state.status != VideoConvertStatus.converting) return;
    _cancelRequested = true;
    final id = _sessionId;
    if (id != null) await FFmpegKit.cancel(id);
  }

  Future<void> _deleteQuietly(String path) async {
    try {
      final f = File(path);
      if (await f.exists()) await f.delete();
    } catch (_) {}
  }

  Future<void> share() async {
    if (state.outputPath == null) return;
    await Share.shareXFiles([XFile(state.outputPath!)]);
  }

  void reset() => state = const VideoConverterState();

  @override
  void dispose() {
    // Leaving the screen must not leave FFmpeg burning CPU in the background.
    _cancelRequested = true;
    final id = _sessionId;
    if (id != null) unawaited(FFmpegKit.cancel(id));
    super.dispose();
  }

  String _formatDuration(String secStr) {
    final secs = double.tryParse(secStr) ?? 0;
    final m = (secs / 60).floor();
    final s = (secs % 60).floor();
    return '${m}m ${s}s';
  }
}

// autoDispose so closing the screen disposes the notifier, which cancels any
// running FFmpeg session.
final videoConverterProvider =
    StateNotifierProvider.autoDispose<
      VideoConverterNotifier,
      VideoConverterState
    >((_) => VideoConverterNotifier());

final selectedVideoFormatProvider = StateProvider<VideoFormat>(
  (_) => kDefaultVideoFormat,
);
