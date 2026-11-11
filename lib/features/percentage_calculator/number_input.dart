/// Locale-tolerant number parsing shared by the calculator tools
/// (percentage, BMI, currency). Pure Dart so it can be unit tested.
library;

/// Maps the decimal digits of the scripts our users type with (Arabic-Indic,
/// Persian/Urdu, Devanagari, Bengali) to ASCII 0-9, and the Arabic decimal /
/// thousands separators to '.' / ','.
String normalizeDigits(String input) {
  final out = StringBuffer();
  for (final rune in input.runes) {
    final ascii = _digitValue(rune);
    if (ascii != null) {
      out.writeCharCode(0x30 + ascii);
    } else if (rune == 0x066B) {
      out.write('.'); // ARABIC DECIMAL SEPARATOR
    } else if (rune == 0x066C || rune == 0x060C) {
      out.write(','); // ARABIC THOUSANDS SEPARATOR / ARABIC COMMA
    } else if (rune == 0x2212) {
      out.write('-'); // MINUS SIGN
    } else {
      out.writeCharCode(rune);
    }
  }
  return out.toString();
}

int? _digitValue(int rune) {
  const zeros = [0x0660, 0x06F0, 0x0966, 0x09E6, 0xFF10];
  for (final z in zeros) {
    if (rune >= z && rune <= z + 9) return rune - z;
  }
  return null;
}

/// Parses what a person typed into a number field.
///
/// Accepts both "," and "." as the decimal separator, ignores spaces and
/// thousands separators, and never returns NaN/Infinity (returns null
/// instead). [decimalSeparator] is the separator of the user's locale and is
/// only used to resolve the ambiguous case of a single separator followed by
/// exactly three digits ("1,234" is 1234 in English but 1.234 in German).
double? parseLooseNumber(String input, {String decimalSeparator = '.'}) {
  var s = normalizeDigits(input)
      .replaceAll(RegExp(r"[\s  '’_]"), '');
  if (s.isEmpty) return null;

  var negative = false;
  if (s.startsWith('-')) {
    negative = true;
    s = s.substring(1);
  } else if (s.startsWith('+')) {
    s = s.substring(1);
  }
  if (s.isEmpty || !RegExp(r'^[0-9.,]+$').hasMatch(s)) return null;

  final lastDot = s.lastIndexOf('.');
  final lastComma = s.lastIndexOf(',');
  String normalized;
  if (lastDot >= 0 && lastComma >= 0) {
    // Both present: whichever comes last is the decimal separator.
    final decimal = lastDot > lastComma ? '.' : ',';
    final group = decimal == '.' ? ',' : '.';
    final noGroups = s.replaceAll(group, '');
    if (decimal.allMatches(noGroups).length > 1) return null;
    normalized = noGroups.replaceAll(',', '.');
  } else if (lastDot >= 0 || lastComma >= 0) {
    final sep = lastDot >= 0 ? '.' : ',';
    final count = sep.allMatches(s).length;
    if (count > 1) {
      // "1,000,000" / "1.000.000" — only grouping makes sense.
      normalized = s.replaceAll(sep, '');
    } else {
      final idx = s.indexOf(sep);
      final after = s.length - idx - 1;
      // "1,234" is grouping in a "." locale; "0,250" never is.
      final looksGrouped = after == 3 &&
          idx > 0 &&
          idx <= 3 &&
          !s.startsWith('0') &&
          sep != decimalSeparator;
      normalized = looksGrouped ? s.replaceAll(sep, '') : s.replaceAll(sep, '.');
    }
  } else {
    normalized = s;
  }

  if (normalized == '.') return null;
  if (normalized.startsWith('.')) normalized = '0$normalized';
  if (normalized.endsWith('.')) {
    normalized = normalized.substring(0, normalized.length - 1);
  }
  final value = double.tryParse(normalized);
  if (value == null || !value.isFinite) return null;
  return negative ? -value : value;
}

/// Returns [v] only when it is a real, finite number.
double? finiteOrNull(double? v) => (v == null || !v.isFinite) ? null : v;
