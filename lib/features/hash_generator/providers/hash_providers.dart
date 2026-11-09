import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'package:crypto/crypto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utility_toolbox/core/utils/result.dart';

enum HashAlgorithm { md5, sha1, sha256, sha512 }

final hashInputProvider     = StateProvider<String>((ref) => '');
final selectedAlgoProvider  = StateProvider<HashAlgorithm>((ref) => HashAlgorithm.sha256);
final hashFileProvider      = StateProvider<File?>((ref) => null);
final isFileHashModeProvider = StateProvider<bool>((ref) => false);

/// Derived — computes hash from text input.
final textHashProvider = Provider<String>((ref) {
  final input = ref.watch(hashInputProvider);
  final algo  = ref.watch(selectedAlgoProvider);
  if (input.isEmpty) return '';
  return _hashText(input, algo);
});

Hash _hashFor(HashAlgorithm algo) => switch (algo) {
  HashAlgorithm.md5    => md5,
  HashAlgorithm.sha1   => sha1,
  HashAlgorithm.sha256 => sha256,
  HashAlgorithm.sha512 => sha512,
};

String _hashText(String input, HashAlgorithm algo) =>
    _hashFor(algo).convert(utf8.encode(input)).toString();

// ── File hashing ─────────────────────────────────────────────────────────────

/// Hashes the file at [path] on a background isolate, streaming it in
/// chunks (File.openRead, 64 KB) through a chunked hash conversion — so a
/// multi-GB file neither blocks the UI isolate nor has to fit in memory.
Future<String> hashFileInBackground(String path, HashAlgorithm algo) =>
    Isolate.run(_hashFileTask(path, algo));

// Top-level so the isolate closure captures only the path and algorithm.
Future<String> Function() _hashFileTask(String path, HashAlgorithm algo) =>
    () async {
      final sink = _DigestSink();
      final input = _hashFor(algo).startChunkedConversion(sink);
      await for (final chunk in File(path).openRead()) {
        input.add(chunk);
      }
      input.close();
      return sink.digest.toString();
    };

class _DigestSink implements Sink<Digest> {
  late Digest digest;

  @override
  void add(Digest data) => digest = data;

  @override
  void close() {}
}

class FileHashNotifier extends StateNotifier<Result<String>> {
  FileHashNotifier() : super(const Idle());

  // Bumped on every new request/reset so a slow hash of a previously picked
  // file can't overwrite the state for the current one.
  int _generation = 0;

  void reset() {
    _generation++;
    state = const Idle();
  }

  Future<void> hash(File file, HashAlgorithm algo) async {
    final gen = ++_generation;
    state = const Loading();
    try {
      final hash = await hashFileInBackground(file.path, algo);
      if (!mounted || gen != _generation) return;
      state = Success(hash);
    } catch (e) {
      if (!mounted || gen != _generation) return;
      state = ErrorResult('Failed to hash file: $e');
    }
  }
}

/// File-hash result. autoDispose: dropped (and any late isolate result
/// ignored) once the Hash Generator screen is closed.
final fileHashResultProvider =
    StateNotifierProvider.autoDispose<FileHashNotifier, Result<String>>(
      (ref) => FileHashNotifier(),
    );
