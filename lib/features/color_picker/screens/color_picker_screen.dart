import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/features/color_picker/providers/color_picker_providers.dart';
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';

const _accentColor = Color(0xFFEC4899);

class ColorPickerScreen extends ConsumerWidget {
  const ColorPickerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color   = ref.watch(selectedColorProvider);
    final formats = ref.watch(colorFormatsProvider);
    final theme   = Theme.of(context);
    final l       = AppLocalizations.of(context);

    return ToolScaffold(
      title: l.toolColorPickerTitle,
      accentColor: _accentColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Color preview swatch
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 120,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: color.withValues(alpha: 0.4),
                    blurRadius: 24,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  formats.hex,
                  style: TextStyle(
                    color: _contrastColor(color),
                    fontFamily: 'monospace',
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Picker wheel
            _Wheel(color: color),
            const SizedBox(height: 24),

            // Hex input
            _HexInput(color: color, ref: ref),
            const SizedBox(height: 24),

            // Format cards
            Text(l.colorPickerFormats, style: theme.textTheme.labelLarge),
            const SizedBox(height: 12),
            _FormatCard(label: 'HEX',  value: formats.hex),
            const SizedBox(height: 8),
            _FormatCard(label: 'RGB',  value: formats.rgb),
            const SizedBox(height: 8),
            _FormatCard(label: 'HSL',  value: formats.hsl),
            const SizedBox(height: 8),
            _FormatCard(label: 'CMYK', value: formats.cmyk),
            const SizedBox(height: 24),

            // Palette row — recent / suggested
            _SuggestedPalette(ref: ref),
          ],
        ),
      ),
    );
  }
}

// ── Picker wheel ───────────────────────────────────────────────────────────

/// Keeps the picker's HSV value between rebuilds. ColorPicker re-derives HSV
/// from the RGB colour on every rebuild, and RGB loses the hue at zero
/// saturation/brightness: dragging into the black or white edge made the hue
/// slider jump back to red.
class _Wheel extends ConsumerStatefulWidget {
  const _Wheel({required this.color});

  final Color color;

  @override
  ConsumerState<_Wheel> createState() => _WheelState();
}

class _WheelState extends ConsumerState<_Wheel> {
  HSVColor? _hsv;

  @override
  Widget build(BuildContext context) {
    final hsv = _hsv;
    // Changed from outside (palette, hex field): start from the new colour.
    if (hsv == null || hsv.toColor().toARGB32() != widget.color.toARGB32()) {
      _hsv = HSVColor.fromColor(widget.color);
    }
    return ColorPicker(
      pickerColor: widget.color,
      pickerHsvColor: _hsv,
      onColorChanged: (c) =>
          ref.read(selectedColorProvider.notifier).state = c,
      onHsvColorChanged: (h) => _hsv = h,
      labelTypes: const [],
      pickerAreaBorderRadius: BorderRadius.circular(16),
      displayThumbColor: true,
      enableAlpha: false,
    );
  }
}

// ── Hex input ──────────────────────────────────────────────────────────────

class _HexInput extends StatefulWidget {
  const _HexInput({required this.color, required this.ref});

  final Color   color;
  final WidgetRef ref;

  @override
  State<_HexInput> createState() => _HexInputState();
}

class _HexInputState extends State<_HexInput> {
  late TextEditingController _ctrl;
  bool _invalid = false;

  @override
  void initState() {
    super.initState();
    _ctrl = TextEditingController(text: _toHex(widget.color));
  }

  @override
  void didUpdateWidget(_HexInput old) {
    super.didUpdateWidget(old);
    final newHex = _toHex(widget.color);
    if (_ctrl.text.toUpperCase() != newHex) {
      _ctrl.text = newHex;
      _invalid = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return TextField(
      controller: _ctrl,
      // Hex codes read left-to-right in every language.
      textDirection: TextDirection.ltr,
      decoration: InputDecoration(
        prefixText: '#',
        labelText: l.colorPickerHexLabel,
        hintText: '6366F1',
        errorText: _invalid ? l.colorPickerHexInvalid : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
        filled: true,
        suffixIcon: IconButton(
          tooltip: l.colorPickerApply,
          icon: const Icon(Icons.check_rounded),
          onPressed: _apply,
        ),
      ),
      onChanged: (_) {
        if (_invalid) setState(() => _invalid = false);
      },
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9A-Fa-f]')),
        LengthLimitingTextInputFormatter(6),
      ],
      onSubmitted: (_) => _apply(),
      textCapitalization: TextCapitalization.characters,
    );
  }

  void _apply() {
    final hex = _ctrl.text.trim();
    if (hex.length == 6) {
      try {
        final color = Color(int.parse('FF$hex', radix: 16));
        widget.ref.read(selectedColorProvider.notifier).state = color;
        return;
      } catch (_) {}
    }
    setState(() => _invalid = true);
  }

  String _toHex(Color c) =>
      '${(c.r * 255).round().toRadixString(16).padLeft(2, '0')}'
      '${(c.g * 255).round().toRadixString(16).padLeft(2, '0')}'
      '${(c.b * 255).round().toRadixString(16).padLeft(2, '0')}'.toUpperCase();

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }
}

// ── Format card ────────────────────────────────────────────────────────────

class _FormatCard extends StatelessWidget {
  const _FormatCard({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: theme.colorScheme.outline.withValues(alpha: 0.4),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 48,
            child: Text(
              label,
              style: theme.textTheme.labelSmall?.copyWith(
                color: _accentColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.start,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontFamily: 'monospace',
              ),
            ),
          ),
          IconButton(
            tooltip: AppLocalizations.of(context).commonCopy,
            onPressed: () {
              Clipboard.setData(ClipboardData(text: value));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(AppLocalizations.of(context).colorPickerCopied(label)),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
            icon: const Icon(Icons.copy_rounded, size: 18),
            color: theme.colorScheme.onSurfaceVariant,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }
}

// ── Suggested palette ──────────────────────────────────────────────────────

class _SuggestedPalette extends StatelessWidget {
  const _SuggestedPalette({required this.ref});

  final WidgetRef ref;

  static const _palette = [
    Color(0xFF6366F1),
    Color(0xFFEC4899),
    Color(0xFF14B8A6),
    Color(0xFFF59E0B),
    Color(0xFFEF4444),
    Color(0xFF22C55E),
    Color(0xFF3B82F6),
    Color(0xFF8B5CF6),
    Color(0xFFF97316),
    Color(0xFF06B6D4),
    Color(0xFF000000),
    Color(0xFFFFFFFF),
  ];

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l.colorPickerPalette, style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: 12),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: _palette.map((c) {
            return Semantics(
              button: true,
              label: l.colorPickerSwatch(ColorFormats(c).hex),
              child: GestureDetector(
              onTap: () =>
                  ref.read(selectedColorProvider.notifier).state = c,
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: c,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context)
                        .colorScheme
                        .outline
                        .withValues(alpha: 0.3),
                  ),
                ),
              ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

// ── Helper ─────────────────────────────────────────────────────────────────

Color _contrastColor(Color bg) {
  final luminance = bg.computeLuminance();
  return luminance > 0.4 ? Colors.black87 : Colors.white;
}
