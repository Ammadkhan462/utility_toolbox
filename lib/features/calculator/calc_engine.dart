/// Small, dependency-free expression evaluator for the Calculator.
///
/// Grammar (precedence low → high):
///   expr    := term (('+' | '-') term)*
///   term    := factor (('×' | '*' | '÷' | '/') factor)*
///   factor  := unary '%'*            (postfix percent = ÷100)
///   unary   := '-' unary | primary
///   primary := number | '(' expr ')'
///
/// Unclosed parentheses are auto-closed, so live results work while typing.
class CalcEngine {
  CalcEngine._();

  /// Evaluates [input]; throws [FormatException] for invalid input and
  /// [UnsupportedError] for division by zero.
  static double evaluate(String input) {
    final parser = _Parser(_tokenize(input));
    final value = parser.parseExpr();
    if (!parser.atEnd) throw const FormatException('Unexpected input');
    if (value.isNaN || value.isInfinite) {
      throw UnsupportedError('Not a number');
    }
    return value;
  }

  /// Returns null instead of throwing — for the live preview line.
  static double? tryEvaluate(String input) {
    try {
      return evaluate(input);
    } catch (_) {
      return null;
    }
  }

  /// Formats with up to 10 significant decimals, no trailing zeros, and
  /// scientific notation only for very large/small values.
  static String format(double value) {
    if (value == 0) return '0';
    final abs = value.abs();
    if (abs >= 1e15 || abs < 1e-9) {
      return value.toStringAsExponential(6).replaceFirst(RegExp(r'\.?0+e'), 'e');
    }
    if (value == value.roundToDouble()) return value.toInt().toString();
    var s = value.toStringAsFixed(10);
    s = s.replaceFirst(RegExp(r'0+$'), '');
    return s.endsWith('.') ? s.substring(0, s.length - 1) : s;
  }

  static List<String> _tokenize(String input) {
    final tokens = <String>[];
    final s = input.replaceAll(' ', '').replaceAll(',', '');
    var i = 0;
    while (i < s.length) {
      final c = s[i];
      if (RegExp(r'[0-9.]').hasMatch(c)) {
        final start = i;
        while (i < s.length && RegExp(r'[0-9.]').hasMatch(s[i])) {
          i++;
        }
        final number = s.substring(start, i);
        if ('.'.allMatches(number).length > 1) {
          throw const FormatException('Bad number');
        }
        tokens.add(number);
        continue;
      }
      if ('+-×*÷/%()'.contains(c)) {
        tokens.add(c);
        i++;
        continue;
      }
      if (c == '−') {
        tokens.add('-');
        i++;
        continue;
      }
      throw FormatException('Unexpected “$c”');
    }
    return tokens;
  }
}

class _Parser {
  _Parser(this.tokens);

  final List<String> tokens;
  int pos = 0;

  bool get atEnd => pos >= tokens.length;
  String? get peek => atEnd ? null : tokens[pos];

  double parseExpr() {
    var value = parseTerm();
    while (peek == '+' || peek == '-') {
      final op = tokens[pos++];
      final rhs = parseTerm();
      value = op == '+' ? value + rhs : value - rhs;
    }
    return value;
  }

  double parseTerm() {
    var value = parseFactor();
    while (peek == '×' || peek == '*' || peek == '÷' || peek == '/') {
      final op = tokens[pos++];
      final rhs = parseFactor();
      if (op == '÷' || op == '/') {
        if (rhs == 0) throw UnsupportedError('Division by zero');
        value /= rhs;
      } else {
        value *= rhs;
      }
    }
    return value;
  }

  double parseFactor() {
    var value = parseUnary();
    while (peek == '%') {
      pos++;
      value /= 100;
    }
    return value;
  }

  double parseUnary() {
    if (peek == '-') {
      pos++;
      return -parseUnary();
    }
    if (peek == '+') {
      pos++;
      return parseUnary();
    }
    return parsePrimary();
  }

  double parsePrimary() {
    final t = peek;
    if (t == null) throw const FormatException('Incomplete');
    if (t == '(') {
      pos++;
      final value = parseExpr();
      if (peek == ')') pos++; // auto-close when missing
      return value;
    }
    final number = double.tryParse(t == '.' ? '0' : t);
    if (number == null) throw FormatException('Unexpected “$t”');
    pos++;
    return number;
  }
}
