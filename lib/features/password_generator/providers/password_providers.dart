import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ── Options ────────────────────────────────────────────────────────────────

final passwordLengthProvider = StateProvider<double>((ref) => 16);
final includeUpperProvider   = StateProvider<bool>((ref) => true);
final includeLowerProvider   = StateProvider<bool>((ref) => true);
final includeNumbersProvider = StateProvider<bool>((ref) => true);
final includeSymbolsProvider = StateProvider<bool>((ref) => true);

// ── Generated password ─────────────────────────────────────────────────────

// autoDispose: don't keep the last password in memory after the screen is
// closed, and show a fresh one (not an already-used one) on the next visit.
final generatedPasswordProvider = StateProvider.autoDispose<String>((ref) {
  return _generate(
    length:  ref.watch(passwordLengthProvider).round(),
    upper:   ref.watch(includeUpperProvider),
    lower:   ref.watch(includeLowerProvider),
    numbers: ref.watch(includeNumbersProvider),
    symbols: ref.watch(includeSymbolsProvider),
  );
});

// ── Strength ───────────────────────────────────────────────────────────────

enum PasswordStrength { weak, fair, good, strong }

final passwordStrengthProvider = Provider.autoDispose<PasswordStrength>((ref) {
  final pw = ref.watch(generatedPasswordProvider);
  return _strength(pw);
});

// ── Helpers ────────────────────────────────────────────────────────────────

const _upper   = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
const _lower   = 'abcdefghijklmnopqrstuvwxyz';
const _numbers = '0123456789';
const _symbols = '!@#\$%^&*()_+-=[]{}|;:,.<>?';

String _generate({
  required int    length,
  required bool   upper,
  required bool   lower,
  required bool   numbers,
  required bool   symbols,
}) {
  final pool = StringBuffer();
  final required = <String>[];
  final rng = Random.secure();

  if (upper)   { pool.write(_upper);   required.add(_upper[rng.nextInt(_upper.length)]); }
  if (lower)   { pool.write(_lower);   required.add(_lower[rng.nextInt(_lower.length)]); }
  if (numbers) { pool.write(_numbers); required.add(_numbers[rng.nextInt(_numbers.length)]); }
  if (symbols) { pool.write(_symbols); required.add(_symbols[rng.nextInt(_symbols.length)]); }

  if (pool.isEmpty) return '';

  final chars  = pool.toString();
  final result = List<String>.from(required);

  while (result.length < length) {
    result.add(chars[rng.nextInt(chars.length)]);
  }

  result.shuffle(rng);
  return result.take(length).join();
}

/// Strength from entropy (length × log2(pool size)), so a long password from
/// fewer character types is still rated by how hard it is to guess. The old
/// class-count score called a 64-character lowercase password "Fair".
PasswordStrength _strength(String pw) {
  if (pw.isEmpty) return PasswordStrength.weak;
  var pool = 0;
  if (pw.contains(RegExp(r'[A-Z]')))        pool += _upper.length;
  if (pw.contains(RegExp(r'[a-z]')))        pool += _lower.length;
  if (pw.contains(RegExp(r'[0-9]')))        pool += _numbers.length;
  if (pw.contains(RegExp(r'[^A-Za-z0-9]'))) pool += _symbols.length;
  if (pool < 2) return PasswordStrength.weak;
  final bits = pw.length * (log(pool) / ln2);
  if (bits < 40) return PasswordStrength.weak;
  if (bits < 60) return PasswordStrength.fair;
  if (bits < 80) return PasswordStrength.good;
  return PasswordStrength.strong;
}

// ── Actions ────────────────────────────────────────────────────────────────

void regeneratePassword(WidgetRef ref) {
  // Force re-generation by toggling a dummy change; simplest approach is
  // to re-run generate and write into the StateProvider.
  final pw = _generate(
    length:  ref.read(passwordLengthProvider).round(),
    upper:   ref.read(includeUpperProvider),
    lower:   ref.read(includeLowerProvider),
    numbers: ref.read(includeNumbersProvider),
    symbols: ref.read(includeSymbolsProvider),
  );
  ref.read(generatedPasswordProvider.notifier).state = pw;
}
