import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

String _hashText(String input, HashAlgorithm algo) {
  final bytes = utf8.encode(input);
  return switch (algo) {
    HashAlgorithm.md5    => md5.convert(bytes).toString(),
    HashAlgorithm.sha1   => sha1.convert(bytes).toString(),
    HashAlgorithm.sha256 => sha256.convert(bytes).toString(),
    HashAlgorithm.sha512 => sha512.convert(bytes).toString(),
  };
}

String hashFile(List<int> bytes, HashAlgorithm algo) {
  return switch (algo) {
    HashAlgorithm.md5    => md5.convert(bytes).toString(),
    HashAlgorithm.sha1   => sha1.convert(bytes).toString(),
    HashAlgorithm.sha256 => sha256.convert(bytes).toString(),
    HashAlgorithm.sha512 => sha512.convert(bytes).toString(),
  };
}
