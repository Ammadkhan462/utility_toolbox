import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ── Options ────────────────────────────────────────────────────────────────

final passwordLengthProvider = StateProvider<double>((ref) => 16);
final includeUpperProvider   = StateProvider<bool>((ref) => true);
final includeLowerProvider   = StateProvider<bool>((ref) => true);
final includeNumbersProvider = StateProvider<bool>((ref) => true);
final includeSymbolsProvider = StateProvider<bool>((ref) => true);

// ── Generated password ─────────────────────────────────────────────────────

final generatedPasswordProvider = StateProvider<String>((ref) {
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

final passwordStrengthProvider = Provider<PasswordStrength>((ref) {
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

PasswordStrength _strength(String pw) {
  if (pw.length < 8)  return PasswordStrength.weak;
  int score = 0;
  if (pw.contains(RegExp(r'[A-Z]')))        score++;
  if (pw.contains(RegExp(r'[a-z]')))        score++;
  if (pw.contains(RegExp(r'[0-9]')))        score++;
  if (pw.contains(RegExp(r'[^A-Za-z0-9]'))) score++;
  if (pw.length >= 16) score++;
  if (score <= 1) return PasswordStrength.weak;
  if (score == 2) return PasswordStrength.fair;
  if (score == 3) return PasswordStrength.good;
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
