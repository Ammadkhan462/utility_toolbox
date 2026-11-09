import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/features/calculator/calc_engine.dart';

/// Everyday calculator: live result while typing, percent, parentheses,
/// tap a history line to reuse it, long-press the result to copy.
class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  static const _accent = Color(0xFFFFA726);
  static const _ops = {'+', '−', '×', '÷'};

  String _expr = '';
  String? _error;
  final List<(String, String)> _history = [];

  String get _preview {
    if (_expr.isEmpty) return '';
    final v = CalcEngine.tryEvaluate(_expr.replaceAll('−', '-'));
    return v == null ? '' : CalcEngine.format(v);
  }

  void _press(String key) {
    HapticFeedback.selectionClick();
    setState(() {
      _error = null;
      switch (key) {
        case 'C':
          _expr = '';
        case '⌫':
          if (_expr.isNotEmpty) _expr = _expr.substring(0, _expr.length - 1);
        case '=':
          _equals();
        case '()':
          final open = '('.allMatches(_expr).length;
          final close = ')'.allMatches(_expr).length;
          final last = _expr.isEmpty ? '' : _expr[_expr.length - 1];
          final canClose = open > close && RegExp(r'[0-9)%]').hasMatch(last);
          _expr += canClose ? ')' : (RegExp(r'[0-9)%]').hasMatch(last) ? '×(' : '(');
        default:
          if (_ops.contains(key)) {
            if (_expr.isEmpty && key != '−') return;
            final last = _expr.isEmpty ? '' : _expr[_expr.length - 1];
            // Replace a trailing operator instead of stacking them.
            if (_ops.contains(last)) {
              _expr = _expr.substring(0, _expr.length - 1);
            }
          }
          if (key == '.') {
            final lastNumber = RegExp(r'[0-9.]*$').stringMatch(_expr) ?? '';
            if (lastNumber.contains('.')) return;
            if (lastNumber.isEmpty) {
              _expr += '0';
            }
          }
          _expr += key;
      }
    });
  }

  void _equals() {
    if (_expr.isEmpty) return;
    try {
      final v = CalcEngine.evaluate(_expr.replaceAll('−', '-'));
      final result = CalcEngine.format(v);
      _history.insert(0, (_expr, result));
      if (_history.length > 30) _history.removeLast();
      _expr = result.replaceAll('-', '−');
    } on UnsupportedError {
      _error = 'Can’t divide by zero';
    } catch (_) {
      _error = 'Check the expression';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final preview = _preview;
    const keys = [
      ['C', '()', '%', '÷'],
      ['7', '8', '9', '×'],
      ['4', '5', '6', '−'],
      ['1', '2', '3', '+'],
      ['0', '.', '⌫', '='],
    ];

    return ToolScaffold(
      title: 'Calculator',
      accentColor: _accent,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              itemCount: _history.length,
              itemBuilder: (_, i) {
                final (expr, result) = _history[i];
                return InkWell(
                  onTap: () => setState(() => _expr = result.replaceAll('-', '−')),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      '$expr = $result',
                      textAlign: TextAlign.end,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerRight,
                  child: Text(
                    _expr.isEmpty ? '0' : _expr,
                    maxLines: 1,
                    style: theme.textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                GestureDetector(
                  onLongPress: () {
                    if (preview.isEmpty) return;
                    Clipboard.setData(ClipboardData(text: preview));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Result copied')),
                    );
                  },
                  child: Text(
                    _error ?? (preview.isEmpty || preview == _expr ? ' ' : '= $preview'),
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: _error != null ? theme.colorScheme.error : _accent,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Column(
              children: [
                for (final row in keys)
                  Row(
                    children: [
                      for (final k in row)
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: _Key(
                              label: k,
                              onTap: () => _press(k),
                              onLongPress: k == '⌫' ? () => _press('C') : null,
                              kind: k == '='
                                  ? _KeyKind.equals
                                  : (_ops.contains(k) || k == '%' || k == '()')
                                  ? _KeyKind.op
                                  : k == 'C'
                                  ? _KeyKind.clear
                                  : _KeyKind.digit,
                            ),
                          ),
                        ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum _KeyKind { digit, op, clear, equals }

class _Key extends StatelessWidget {
  const _Key({required this.label, required this.onTap, required this.kind, this.onLongPress});

  final String label;
  final VoidCallback onTap;
  final VoidCallback? onLongPress;
  final _KeyKind kind;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    const accent = Color(0xFFFFA726);
    final (bg, fg) = switch (kind) {
      _KeyKind.equals => (accent, Colors.white),
      _KeyKind.op => (accent.withValues(alpha: 0.16), accent),
      _KeyKind.clear => (scheme.errorContainer, scheme.onErrorContainer),
      _KeyKind.digit => (scheme.surfaceContainerHighest, scheme.onSurface),
    };
    return Semantics(
      button: true,
      label: switch (label) {
        '⌫' => 'Delete',
        '−' => 'Minus',
        '×' => 'Times',
        '÷' => 'Divide',
        'C' => 'Clear',
        '()' => 'Parentheses',
        _ => label,
      },
      excludeSemantics: true,
      child: Material(
        color: bg,
        borderRadius: BorderRadius.circular(18),
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: onTap,
          onLongPress: onLongPress,
          child: SizedBox(
            height: 58,
            child: Center(
              child: label == '⌫'
                  ? Icon(Icons.backspace_outlined, color: fg)
                  : Text(
                      label,
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: fg),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
