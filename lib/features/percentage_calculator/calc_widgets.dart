import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:utility_toolbox/features/percentage_calculator/number_input.dart';

/// Small UI + formatting helpers shared by the calculator-style tools
/// (percentage, BMI, currency).
class NumberLocale {
  NumberLocale._();

  /// Intl locale for formatting numbers: the app's language, refined with the
  /// device's country when intl knows that combination (so `en` on an Indian
  /// phone groups as 1,00,000).
  static String of(BuildContext context) {
    final lang = Localizations.localeOf(context).languageCode;
    final country =
        WidgetsBinding.instance.platformDispatcher.locale.countryCode;
    if (country != null && country.isNotEmpty) {
      final tag = '${lang}_$country';
      if (NumberFormat.localeExists(tag)) return tag;
    }
    return NumberFormat.localeExists(lang) ? lang : 'en';
  }

  static String decimalSeparator(String locale) {
    try {
      return normalizeDigits(NumberFormat.decimalPattern(locale).symbols.DECIMAL_SEP);
    } catch (_) {
      return '.';
    }
  }

  static NumberFormat decimal(String locale, {int maxFraction = 2, int minFraction = 0}) {
    NumberFormat f;
    try {
      f = NumberFormat.decimalPattern(locale);
    } catch (_) {
      f = NumberFormat.decimalPattern('en');
    }
    return f
      ..maximumFractionDigits = maxFraction
      ..minimumFractionDigits = minFraction;
  }

  static NumberFormat percent(String locale, {int maxFraction = 2}) {
    NumberFormat f;
    try {
      f = NumberFormat.percentPattern(locale);
    } catch (_) {
      f = NumberFormat.percentPattern('en');
    }
    return f..maximumFractionDigits = maxFraction;
  }
}

/// Characters a number field accepts: digits in any of our scripts, both
/// separators, Arabic separators, spaces and (optionally) a minus sign.
List<TextInputFormatter> numberInputFormatters({bool allowNegative = false}) => [
      FilteringTextInputFormatter.allow(
        RegExp(
          allowNegative
              ? r'[0-9.,٠-٩۰-۹०-९০-৯٫٬\-−]'
              : r'[0-9.,٠-٩۰-۹०-९০-৯٫٬]',
        ),
      ),
      LengthLimitingTextInputFormatter(16),
    ];

/// Numeric text field with the app's filled style.
class NumberField extends StatelessWidget {
  const NumberField({
    super.key,
    required this.controller,
    required this.label,
    this.onChanged,
    this.hint,
    this.suffix,
    this.prefix,
    this.allowNegative = false,
    this.decimal = true,
    this.textInputAction = TextInputAction.next,
    this.large = false,
  });

  final TextEditingController controller;
  final String label;
  final ValueChanged<String>? onChanged;
  final String? hint;
  final String? suffix;
  final String? prefix;
  final bool allowNegative;
  final bool decimal;
  final TextInputAction textInputAction;
  final bool large;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextField(
      controller: controller,
      keyboardType: TextInputType.numberWithOptions(
        decimal: decimal,
        signed: allowNegative,
      ),
      textInputAction: textInputAction,
      inputFormatters: numberInputFormatters(allowNegative: allowNegative),
      style: large
          ? theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700)
          : theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        suffixText: suffix,
        prefixText: prefix == null ? null : '$prefix ',
      ),
      onChanged: onChanged,
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
    );
  }
}

/// Two inputs side by side; stacked when the font is scaled up a lot or the
/// screen is narrow, so labels never get cut off.
class FieldPair extends StatelessWidget {
  const FieldPair({super.key, required this.first, required this.second});

  final Widget first;
  final Widget second;

  @override
  Widget build(BuildContext context) {
    final scale = MediaQuery.textScalerOf(context).scale(14) / 14;
    return LayoutBuilder(
      builder: (context, c) {
        if (scale > 1.3 || c.maxWidth < 300) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [first, const SizedBox(height: 12), second],
          );
        }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: first),
            const SizedBox(width: 12),
            Expanded(child: second),
          ],
        );
      },
    );
  }
}

/// Plain card used for each calculator block.
class CalcCard extends StatelessWidget {
  const CalcCard({super.key, required this.child, this.title, this.icon, this.accent});

  final Widget child;
  final String? title;
  final IconData? icon;
  final Color? accent;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = accent ?? theme.colorScheme.primary;
    return Container(
      padding: const EdgeInsetsDirectional.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: theme.colorScheme.outline.withValues(alpha: 0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (title != null) ...[
            Row(
              children: [
                if (icon != null) ...[
                  Icon(icon, size: 20, color: color),
                  const SizedBox(width: 8),
                ],
                Expanded(
                  child: Text(
                    title!,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: color,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
          ],
          child,
        ],
      ),
    );
  }
}

/// Rounded, outlined surface for a list of [ListTile]s. A [Material] (not a
/// decorated Container) so the tiles' ink ripples stay visible.
class ListCard extends StatelessWidget {
  const ListCard({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: theme.colorScheme.surface,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: theme.colorScheme.outline.withValues(alpha: 0.5)),
      ),
      child: Column(children: children),
    );
  }
}

/// Accent-tinted result panel (same language as the Loan/EMI summary).
class ResultPanel extends StatelessWidget {
  const ResultPanel({super.key, required this.accent, required this.child});

  final Color accent;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsetsDirectional.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [accent.withValues(alpha: 0.16), accent.withValues(alpha: 0.05)],
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomEnd,
        ),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: accent.withValues(alpha: 0.3)),
      ),
      child: child,
    );
  }
}

/// "Label ........ value" line inside a [ResultPanel]. Wraps at large font
/// sizes instead of overflowing.
class ResultLine extends StatelessWidget {
  const ResultLine({
    super.key,
    required this.label,
    required this.value,
    this.emphasize = false,
    this.color,
  });

  final String label;
  final String value;
  final bool emphasize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final valueStyle = (emphasize ? theme.textTheme.headlineSmall : theme.textTheme.titleMedium)
        ?.copyWith(fontWeight: FontWeight.w800, color: color);
    return MergeSemantics(
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(vertical: 4),
        child: Wrap(
          alignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 12,
          children: [
            Text(
              label,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            Text(value, style: valueStyle),
          ],
        ),
      ),
    );
  }
}

/// Muted one-liner shown in a result panel before the inputs are complete.
class ResultPlaceholder extends StatelessWidget {
  const ResultPlaceholder(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      text,
      textAlign: TextAlign.center,
      style: theme.textTheme.bodyMedium?.copyWith(
        color: theme.colorScheme.onSurfaceVariant,
      ),
    );
  }
}
