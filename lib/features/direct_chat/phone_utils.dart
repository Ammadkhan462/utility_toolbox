/// Phone-number clean-up for Direct Chat: turns what people type or paste
/// ("0300-1234567", "+92 300 1234567", "(415) 555-2671") into the digits-only
/// international form the chat link needs.
library;

import 'package:utility_toolbox/features/percentage_calculator/number_input.dart';

enum PhoneIssue { empty, tooShort, tooLong }

class PhoneResult {
  const PhoneResult(this.digits, [this.issue]);

  /// Full international number, digits only, no '+' (e.g. "923001234567").
  final String digits;
  final PhoneIssue? issue;

  bool get isValid => issue == null;
}

/// National trunk prefixes that are dropped when dialling from abroad.
/// Everything else drops leading zeros; Italy (and the Vatican/San Marino
/// on +39 / +378) keeps them because the 0 is part of the number.
const _trunkPrefixes = <String, List<String>>{
  '7': ['8'], // Russia, Kazakhstan: 8 912 …
  '375': ['80', '8'], // Belarus: 8 029 …
  '36': ['06'], // Hungary: 06 30 …
  '370': ['8'], // Lithuania: 8 612 …
};
const _keepLeadingZero = {'39', '378'};

const minNationalDigits = 6;
const maxE164Digits = 15;

/// Cleans [input] for the selected country [dialCode] (digits only).
PhoneResult normalizePhone(String input, String dialCode) {
  final s = normalizeDigits(input).trim();
  var digits = s.replaceAll(RegExp(r'\D'), '');
  if (digits.isEmpty) return const PhoneResult('', PhoneIssue.empty);

  String full;
  if (s.startsWith('+')) {
    full = digits;
  } else if (digits.startsWith('00')) {
    full = digits.substring(2);
  } else {
    final startsWithTrunkZero = digits.startsWith('0');
    // Already typed with the country code but without '+' (e.g. 923001234567).
    if (!startsWithTrunkZero &&
        digits.startsWith(dialCode) &&
        digits.length >= 11 &&
        digits.length - dialCode.length >= 7) {
      full = digits;
    } else {
      var national = digits;
      var stripped = false;
      for (final p in _trunkPrefixes[dialCode] ?? const <String>[]) {
        if (national.startsWith(p) && national.length - p.length >= minNationalDigits) {
          national = national.substring(p.length);
          stripped = true;
          break;
        }
      }
      if (!stripped && !_keepLeadingZero.contains(dialCode)) {
        national = national.replaceFirst(RegExp(r'^0+'), '');
      }
      full = '$dialCode$national';
    }
  }

  full = full.replaceFirst(RegExp(r'^0+'), '');
  if (full.length > maxE164Digits) return PhoneResult(full, PhoneIssue.tooLong);
  if (full.length < dialCode.length + minNationalDigits || full.length < 8) {
    return PhoneResult(full, PhoneIssue.tooShort);
  }
  return PhoneResult(full);
}

/// Finds the first phone-number-looking sequence in shared text, or a
/// chat link's number. Returns it as written (may start with '+').
String? extractPhoneNumber(String text) {
  final t = normalizeDigits(text);
  final link = RegExp(r'wa\.me/\+?(\d{6,15})').firstMatch(t);
  if (link != null) return '+${link.group(1)}';
  final tel = RegExp(r'tel:(\+?[\d\-. ()]{6,})').firstMatch(t);
  final match = tel?.group(1) != null
      ? tel!.group(1)!
      : RegExp(r'(?:\+|\b00)?\d[\d \-.() ]{4,}\d').firstMatch(t)?.group(0);
  if (match == null) return null;
  final digitCount = match.replaceAll(RegExp(r'\D'), '').length;
  if (digitCount < 7 || digitCount > 16) return null;
  return match.trim();
}

/// Chat link for [digits] with an optional pre-filled [message].
Uri chatLink(String digits, String message) {
  final text = message.trim();
  return Uri.parse(
    'https://wa.me/$digits${text.isEmpty ? '' : '?text=${Uri.encodeComponent(text)}'}',
  );
}

/// "+92 3001234567" for display.
String displayPhone(String digits, String dialCode) =>
    digits.startsWith(dialCode) && digits.length > dialCode.length
        ? '+$dialCode ${digits.substring(dialCode.length)}'
        : '+$digits';
