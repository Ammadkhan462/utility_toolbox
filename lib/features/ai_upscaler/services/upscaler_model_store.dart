import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

/// Thrown when the on-device model isn't installed and can't be downloaded
/// (offline, server error, or a corrupt download).
class UpscalerModelUnavailable implements Exception {
  const UpscalerModelUnavailable(this.reason);
  final String reason;
  @override
  String toString() => 'UpscalerModelUnavailable: $reason';
}

/// The ESRGAN model (~5 MB) is no longer bundled in the APK: it is
/// downloaded once, the first time someone uses the AI Upscaler, verified
/// against a SHA-256 and kept in app-private storage.
///
/// Source file: `models/realesrgan_x4.tflite` in the repo, published as a
/// file on the GitHub Pages site (Ammadkhan462.github.io/models/).
class UpscalerModelStore {
  UpscalerModelStore._();

  static const url =
      'https://ammadkhan462.github.io/models/realesrgan_x4.tflite';
  static const sha256Hex = '1a380d3744103e11ef343534aaff54815cae40769dcd00c023652a7e5bc47f4b';
  static const sizeBytes = 4993712;

  static Future<File> _file() async {
    final dir = await getApplicationSupportDirectory();
    return File('${dir.path}/models/realesrgan_x4.tflite');
  }

  /// Whether the model is already on the phone (no download needed).
  static Future<bool> isInstalled() async {
    final f = await _file();
    return await f.exists() && await f.length() == sizeBytes;
  }

  /// Returns the model bytes, downloading them first if needed.
  /// [onProgress] gets 0..1 while downloading.
  static Future<Uint8List> load({
    void Function(double progress)? onProgress,
    bool Function()? isCancelled,
  }) async {
    final file = await _file();
    if (await file.exists() && await file.length() == sizeBytes) {
      return file.readAsBytes();
    }
    await file.parent.create(recursive: true);
    final part = File('${file.path}.part');
    final client = http.Client();
    try {
      final response = await client
          .send(http.Request('GET', Uri.parse(url)))
          .timeout(const Duration(seconds: 20));
      if (response.statusCode != 200) {
        throw UpscalerModelUnavailable('HTTP ${response.statusCode}');
      }
      final total = response.contentLength ?? sizeBytes;
      final sink = part.openWrite();
      var received = 0;
      try {
        await for (final chunk in response.stream.timeout(const Duration(seconds: 20))) {
          if (isCancelled?.call() ?? false) {
            throw const UpscalerModelUnavailable('cancelled');
          }
          sink.add(chunk);
          received += chunk.length;
          onProgress?.call((received / total).clamp(0.0, 1.0));
        }
      } finally {
        await sink.close();
      }
      final bytes = await part.readAsBytes();
      final digest = await compute(_sha256, bytes);
      if (digest != sha256Hex) {
        throw const UpscalerModelUnavailable('checksum mismatch');
      }
      await part.rename(file.path);
      return bytes;
    } on UpscalerModelUnavailable {
      rethrow;
    } catch (e) {
      throw UpscalerModelUnavailable('$e');
    } finally {
      client.close();
      if (await part.exists()) {
        try {
          await part.delete();
        } catch (_) {}
      }
    }
  }
}

String _sha256(Uint8List bytes) => sha256.convert(bytes).toString();
