import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
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
import 'package:utility_toolbox/core/utils/file_utils.dart';

enum VideoConvertStatus { idle, picking, probing, converting, done, error }

/// Why a conversion failed; the screen shows a localized message for it
/// and [VideoConverterState.error] holds the technical detail.
enum VideoErrorKind {
  /// FFmpeg ran but failed: usually the format/codec isn't supported here.
  unsupported,

  /// Anything else (no space, unreadable file…).
  generic,
}

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
  final VideoEncoding videoEncoding;

  /// Extra args after the video codec args, before the output path
  /// (audio codec, filters, container flags). One list entry per argv token.
  final List<String> extraArgs;

  const VideoFormat({
    required this.ext,
    required this.label,
    this.videoEncoding = VideoEncoding.none,
    required this.extraArgs,
  });

  String get mimeType => switch (ext) {
    'mp4' => 'video/mp4',
    'mov' => 'video/quicktime',
    'mkv' => 'video/x-matroska',
    'avi' => 'video/x-msvideo',
    'gif' => 'image/gif',
    'mp3' => 'audio/mpeg',
    'm4a' => 'audio/mp4',
    'aac' => 'audio/aac',
    'wav' => 'audio/wav',
    _ => 'application/octet-stream',
  };
}

// Default format as a standalone const so it can be used as a default parameter value.
// (kVideoFormats[0] is NOT a compile-time constant in Dart — list index access isn't.)
const kDefaultVideoFormat = VideoFormat(
  ext: 'mp4',
  label: 'MP4',
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
    videoEncoding: VideoEncoding.hardwareH264,
    extraArgs: ['-sn', '-dn', '-c:a', 'aac', '-movflags', '+faststart'],
  ),
  VideoFormat(
    ext: 'mkv',
    label: 'MKV',
    videoEncoding: VideoEncoding.hardwareH264,
    extraArgs: ['-sn', '-dn', '-c:a', 'aac'],
  ),
  VideoFormat(
    ext: 'avi',
    label: 'AVI',
    videoEncoding: VideoEncoding.mpeg4,
    extraArgs: ['-sn', '-dn', '-c:a', 'libmp3lame'],
  ),
  VideoFormat(
    ext: 'gif',
    label: 'GIF',
    extraArgs: ['-vf', 'fps=10,scale=480:-1:flags=lanczos', '-loop', '0'],
  ),
  VideoFormat(
    ext: 'mp3',
    label: 'MP3',
    extraArgs: ['-vn', '-c:a', 'libmp3lame', '-q:a', '2'],
  ),
  VideoFormat(
    ext: 'm4a',
    label: 'M4A',
    extraArgs: ['-vn', '-c:a', 'aac', '-b:a', '192k', '-movflags', '+faststart'],
  ),
  VideoFormat(
    ext: 'aac',
    label: 'AAC',
    extraArgs: ['-vn', '-c:a', 'aac', '-b:a', '192k'],
  ),
  VideoFormat(
    ext: 'wav',
    label: 'WAV',
    extraArgs: ['-vn', '-c:a', 'pcm_s16le'],
  ),
];

class VideoConverterState {
  final VideoConvertStatus status;
  final String? inputPath;
  final String? outputPath;
  /// Technical detail (FFmpeg log tail / exception) for a failed run.
  final String? error;
  final VideoErrorKind errorKind;
  final double progress; // 0.0–1.0
  final VideoFormat outputFormat;

  /// From ffprobe: container name (e.g. "mov,mp4,m4a…") and duration in
  /// seconds. Formatted by the screen.
  final String? probeFormat;
  final double? probeDurationSec;

  const VideoConverterState({
    this.status = VideoConvertStatus.idle,
    this.inputPath,
    this.outputPath,
    this.error,
    this.errorKind = VideoErrorKind.generic,
    this.progress = 0,
    this.outputFormat = kDefaultVideoFormat, // ← const, not a list index
    this.probeFormat,
    this.probeDurationSec,
  });

  VideoConverterState copyWith({
    VideoConvertStatus? status,
    String? inputPath,
    String? outputPath,
    String? error,
    VideoErrorKind? errorKind,
    double? progress,
    VideoFormat? outputFormat,
    String? probeFormat,
    double? probeDurationSec,
  }) => VideoConverterState(
    status: status ?? this.status,
    inputPath: inputPath ?? this.inputPath,
    outputPath: outputPath ?? this.outputPath,
    error: error ?? this.error,
    errorKind: errorKind ?? this.errorKind,
    progress: progress ?? this.progress,
    outputFormat: outputFormat ?? this.outputFormat,
    probeFormat: probeFormat ?? this.probeFormat,
    probeDurationSec: probeDurationSec ?? this.probeDurationSec,
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
    if (state.status == VideoConvertStatus.converting) return;
    final previous = state.status;
    state = state.copyWith(status: VideoConvertStatus.picking);

    FilePickerResult? result;
    try {
      result = await FilePicker.platform.pickFiles(
        type: FileType.video,
        allowMultiple: false,
      );
    } on PlatformException catch (e) {
      // Storage permission denied / picker already open: without this the
      // screen stayed stuck in "picking" with every button disabled.
      debugPrint('Video pick failed: $e');
    }
    if (!mounted) return;

    // path is null when the provider couldn't hand over a local copy.
    final path = result?.files.firstOrNull?.path;
    if (path == null) {
      state = state.copyWith(status: previous);
      return;
    }

    await loadFile(path);
  }

  /// Loads and probes a video from the picker or the share sheet.
  Future<void> loadFile(String inputPath) async {
    if (state.status == VideoConvertStatus.converting) return;
    _durationMs = 0;
    _sourceBitrate = null;
    _discardOutput();
    // Fresh state: copyWith can't clear fields, so the previous video's
    // probe info / output path / error used to stick around.
    state = VideoConverterState(
      status: VideoConvertStatus.probing,
      inputPath: inputPath,
      outputFormat: state.outputFormat,
    );

    // Probe for info
    try {
      final session = await FFprobeKit.getMediaInformation(inputPath);
      if (!mounted) return;
      final info = session.getMediaInformation();
      final format = info?.getFormat();
      final durSec = double.tryParse(info?.getDuration() ?? '');
      _durationMs = (durSec ?? 0) * 1000;
      _sourceBitrate = int.tryParse(info?.getBitrate() ?? '');
      // A newer file was loaded while this one was probing.
      if (state.inputPath != inputPath) return;
      state = state.copyWith(
        status: VideoConvertStatus.idle,
        probeFormat: format,
        probeDurationSec: durSec,
      );
    } catch (_) {
      if (state.inputPath != inputPath) return;
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
    if (inputPath == null || state.status == VideoConvertStatus.converting) {
      return; // no double-submit
    }
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
      // Never "<name>.<ext>" in the cache: a picked/shared input that is
      // already there with the same extension IS that path, and _run()
      // deletes the output path first, i.e. it deleted the input.
      outPath = p.join(outDir.path, '${baseName}_converted.${fmt.ext}');
      if (p.equals(outPath, inputPath)) {
        outPath = p.join(
          outDir.path,
          '${baseName}_converted_${DateTime.now().millisecondsSinceEpoch}.${fmt.ext}',
        );
      }

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
        if (!mounted) {
          await _deleteQuietly(outPath);
          return;
        }
        state = state.copyWith(progress: 0);
        session = await _run(inputPath, outPath, fmt, useHardware: false);
        returnCode = await session.getReturnCode();
      }

      if (!mounted) {
        // Screen closed (dispose cancelled FFmpeg): drop the partial file.
        await _deleteQuietly(outPath);
        return;
      }

      if (_cancelRequested || ReturnCode.isCancel(returnCode)) {
        await _deleteQuietly(outPath);
        if (!mounted) return;
        state = VideoConverterState(
          inputPath: state.inputPath,
          probeFormat: state.probeFormat,
          probeDurationSec: state.probeDurationSec,
          outputFormat: state.outputFormat,
        );
      } else if (ReturnCode.isSuccess(returnCode)) {
        state = state.copyWith(
          status: VideoConvertStatus.done,
          outputPath: outPath,
          progress: 1.0,
        );
      } else {
        await _deleteQuietly(outPath);
        final logs = await session.getAllLogsAsString() ?? '';
        if (!mounted) return;
        // The full FFmpeg log can be hundreds of KB; the tail holds the error.
        final tail = logs.length > 1500
            ? logs.substring(logs.length - 1500)
            : logs;
        state = state.copyWith(
          status: VideoConvertStatus.error,
          errorKind: VideoErrorKind.unsupported,
          error: tail.trim(),
        );
      }
    } catch (e) {
      if (outPath != null) await _deleteQuietly(outPath);
      if (!mounted) return;
      state = state.copyWith(
        status: VideoConvertStatus.error,
        errorKind: VideoErrorKind.generic,
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
    final out = state.outputPath;
    if (out == null) return;
    await Share.shareXFiles([XFile(out)]);
  }

  /// Saves the output to Downloads and My Files (previously the result was
  /// only shareable and never showed up in My Files). Returns true when
  /// saved, null when it fell back to the share sheet, false on failure.
  Future<bool?> saveToDownloads() async {
    final out = state.outputPath;
    if (out == null) return false;
    try {
      final fmt = state.outputFormat;
      final outcome = await FileUtils.saveToDownloads(
        sourcePath: out,
        fileName: p.basenameWithoutExtension(out),
        ext: fmt.ext,
        mimeType: fmt.mimeType,
        toolId: 'video_converter',
      );
      // sharedFallback: the share sheet was opened instead.
      return outcome == SaveOutcome.downloaded ? true : null;
    } catch (e) {
      debugPrint('Saving converted file failed: $e');
      return false;
    }
  }

  /// Converted videos can be hundreds of MB: don't leave them in the cache
  /// once they are replaced, cleared or the screen is closed.
  void _discardOutput() {
    final out = state.outputPath;
    if (out != null) unawaited(_deleteQuietly(out));
  }

  void reset() {
    if (state.status == VideoConvertStatus.converting) return;
    _discardOutput();
    state = const VideoConverterState();
  }

  @override
  void dispose() {
    // Leaving the screen must not leave FFmpeg burning CPU in the background.
    _cancelRequested = true;
    final id = _sessionId;
    if (id != null) unawaited(FFmpegKit.cancel(id));
    _discardOutput();
    super.dispose();
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
