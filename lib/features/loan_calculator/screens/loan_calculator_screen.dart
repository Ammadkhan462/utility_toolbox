import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/features/loan_calculator/providers/loan_providers.dart';
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';

const _accentColor = Color(0xFFF59E0B);

class LoanCalculatorScreen extends ConsumerWidget {
  const LoanCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result   = ref.watch(loanResultProvider);
    final inYears  = ref.watch(tenureInYearsProvider);
    final l        = AppLocalizations.of(context);
    final locale   = _locale(context);

    return ToolScaffold(
      title: l.toolLoanCalculatorTitle,
      accentColor: _accentColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ── Inputs ──────────────────────────────────────────────────
            _InputCard(
              // No currency symbol: the app is used in many countries, so
              // amounts are plain locale-formatted numbers.
              label:       l.loanAmount,
              hintText:    NumberFormat.decimalPattern(locale).format(1000000),
              initial:     ref.read(loanAmountProvider).toStringAsFixed(0),
              keyboardType: const TextInputType.numberWithOptions(decimal: false),
              onChanged:   (v) {
                // Whole amounts only, so both "," and "." are grouping
                // separators (1,000,000 / 1.000.000). Empty/invalid → 0 so
                // the result clears instead of showing stale figures.
                ref.read(loanAmountProvider.notifier).state =
                    double.tryParse(v.replaceAll(RegExp('[.,]'), '')) ?? 0;
              },
            ),
            const SizedBox(height: 12),
            _InputCard(
              label:       l.loanInterestRate,
              suffix:      '%',
              hintText:    NumberFormat.decimalPattern(locale).format(8.5),
              initial:     ref.read(interestRateProvider).toString(),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              onChanged:   (v) {
                // Accept a decimal comma ("8,5"); empty means 0%.
                ref.read(interestRateProvider.notifier).state =
                    double.tryParse(v.replaceAll(',', '.')) ?? 0;
              },
            ),
            const SizedBox(height: 12),
            _TenureInput(inYears: inYears, ref: ref),
            const SizedBox(height: 24),

            // ── Result summary ───────────────────────────────────────────
            if (result != null) ...[
              _ResultSummary(result: result),
              const SizedBox(height: 20),
              _PieBreakdown(result: result),
              const SizedBox(height: 20),
              _AmortizationTable(schedule: result.schedule),
            ] else
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Icon(
                        Icons.calculate_rounded,
                        size: 56,
                        color: _accentColor.withValues(alpha: 0.4),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        l.loanEmpty,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// ── Input card ─────────────────────────────────────────────────────────────

class _InputCard extends StatelessWidget {
  const _InputCard({
    required this.label,
    required this.hintText,
    required this.initial,
    required this.onChanged,
    this.suffix,
    this.keyboardType,
  });

  final String           label;
  final String           hintText;
  final String           initial;
  final void Function(String) onChanged;
  final String?          suffix;
  final TextInputType?   keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue:  initial,
      keyboardType:  keyboardType,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]')),
      ],
      decoration: InputDecoration(
        labelText:   label,
        hintText:    hintText,
        suffixText:  suffix,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
        filled: true,
      ),
      onChanged: onChanged,
    );
  }
}

// ── Tenure input with year/month toggle ───────────────────────────────────

class _TenureInput extends StatelessWidget {
  const _TenureInput({required this.inYears, required this.ref});

  final bool      inYears;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            initialValue: ref.read(loanTenureProvider).toStringAsFixed(0),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              labelText: inYears ? l.loanTenureYears : l.loanTenureMonths,
              hintText:  inYears ? '5' : '60',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
              filled: true,
            ),
            onChanged: (v) {
              ref.read(loanTenureProvider.notifier).state =
                  double.tryParse(v) ?? 0;
            },
          ),
        ),
        const SizedBox(width: 10),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.4),
            ),
          ),
          child: Row(
            children: [
              _TenureToggle(
                label:    l.loanToggleMonths,
                selected: !inYears,
                onTap: () =>
                    ref.read(tenureInYearsProvider.notifier).state = false,
              ),
              _TenureToggle(
                label:    l.loanToggleYears,
                selected: inYears,
                onTap: () =>
                    ref.read(tenureInYearsProvider.notifier).state = true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TenureToggle extends StatelessWidget {
  const _TenureToggle({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String   label;
  final bool     selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
          color: selected ? _accentColor : Colors.transparent,
          borderRadius: BorderRadius.circular(13),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected
                ? Colors.white
                : Theme.of(context).colorScheme.onSurfaceVariant,
            fontWeight: selected ? FontWeight.w700 : FontWeight.w400,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}

// ── Result summary ─────────────────────────────────────────────────────────

class _ResultSummary extends ConsumerWidget {
  const _ResultSummary({required this.result});

  final LoanResult result;

  /// Plain-text summary for copy / share.
  String _summary(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final locale = _locale(context);
    final rate = NumberFormat.decimalPattern(locale)
      ..maximumFractionDigits = 2;
    return [
      l.toolLoanCalculatorTitle,
      '${l.loanAmount}: ${_formatFull(locale, ref.read(loanAmountProvider))}',
      '${l.loanInterestRate}: ${rate.format(ref.read(interestRateProvider))}%',
      '${l.loanTenure}: ${l.loanMonths(result.schedule.length)}',
      '${l.loanMonthlyEmi}: ${_formatFull(locale, result.emi)}',
      '${l.loanTotalInterest}: ${_formatFull(locale, result.totalInterest)}',
      '${l.loanTotalPayment}: ${_formatFull(locale, result.totalPayment)}',
    ].join('\n');
  }

  Future<void> _copy(BuildContext context, WidgetRef ref) async {
    final l = AppLocalizations.of(context);
    await Clipboard.setData(ClipboardData(text: _summary(context, ref)));
    if (!context.mounted) return;
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(l.commonCopied),
          duration: const Duration(seconds: 2),
        ),
      );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l = AppLocalizations.of(context);
    final locale = _locale(context);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            _accentColor.withValues(alpha: 0.15),
            _accentColor.withValues(alpha: 0.05),
          ],
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomEnd,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _accentColor.withValues(alpha: 0.3)),
      ),
      child: Column(
        children: [
          Text(
            l.loanMonthlyEmi,
            style: theme.textTheme.labelLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 6),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              _formatFull(locale, result.emi),
              style: theme.textTheme.displaySmall?.copyWith(
                color: _accentColor,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              _SummaryItem(
                label: l.loanPrincipal,
                value: _formatCompact(
                  locale,
                  result.totalPayment - result.totalInterest,
                ),
                color: const Color(0xFF3B82F6),
              ),
              _SummaryItem(
                label: l.loanTotalInterest,
                value: _formatCompact(locale, result.totalInterest),
                color: const Color(0xFFEF4444),
              ),
              _SummaryItem(
                label: l.loanTotalPayment,
                value: _formatCompact(locale, result.totalPayment),
                color: const Color(0xFF22C55E),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => _copy(context, ref),
                  icon: const Icon(Icons.copy_rounded, size: 18),
                  label: Text(l.commonCopy),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => Share.share(_summary(context, ref)),
                  icon: const Icon(Icons.share_rounded, size: 18),
                  label: Text(l.commonShare),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SummaryItem extends StatelessWidget {
  const _SummaryItem({
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final String value;
  final Color  color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: color,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// ── Pie-style breakdown bar ───────────────────────────────────────────────

class _PieBreakdown extends StatelessWidget {
  const _PieBreakdown({required this.result});

  final LoanResult result;

  @override
  Widget build(BuildContext context) {
    final theme     = Theme.of(context);
    final principal = result.totalPayment - result.totalInterest;
    final total     = result.totalPayment;
    final pPct      = principal / total;
    final iPct      = result.totalInterest / total;
    final l         = AppLocalizations.of(context);
    final percent   = NumberFormat.percentPattern(_locale(context))
      ..minimumFractionDigits = 1
      ..maximumFractionDigits = 1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l.loanBreakdown, style: theme.textTheme.labelLarge),
        const SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SizedBox(
            height: 18,
            child: Row(
              children: [
                Flexible(
                  flex: (pPct * 1000).round(),
                  child: Container(color: const Color(0xFF3B82F6)),
                ),
                Flexible(
                  flex: (iPct * 1000).round(),
                  child: Container(color: const Color(0xFFEF4444)),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 16,
          runSpacing: 4,
          children: [
            _Legend(color: const Color(0xFF3B82F6), label: l.loanPrincipal),
            _Legend(color: const Color(0xFFEF4444), label: l.loanInterest),
            Text(
              l.loanInterestShare(percent.format(iPct)),
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _Legend extends StatelessWidget {
  const _Legend({required this.color, required this.label});

  final Color  color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
        ),
      ],
    );
  }
}

// ── Amortization table ─────────────────────────────────────────────────────

class _AmortizationTable extends StatefulWidget {
  const _AmortizationTable({required this.schedule});

  final List<AmortizationRow> schedule;

  @override
  State<_AmortizationTable> createState() => _AmortizationTableState();
}

class _AmortizationTableState extends State<_AmortizationTable> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l      = AppLocalizations.of(context);
    final locale = _locale(context);
    final rows  = _expanded
        ? widget.schedule
        : widget.schedule.take(6).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(l.loanSchedule, style: theme.textTheme.labelLarge),
            ),
            Text(
              l.loanMonths(widget.schedule.length),
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: theme.colorScheme.outline.withValues(alpha: 0.3),
            ),
          ),
          child: Column(
            children: [
              // Header
              _TableRow(
                month:     l.loanColMonth,
                principal: l.loanPrincipal,
                interest:  l.loanInterest,
                balance:   l.loanColBalance,
                isHeader:  true,
              ),
              const Divider(height: 1),
              ...rows.map((r) => Column(
                    children: [
                      _TableRow(
                        month:     NumberFormat.decimalPattern(locale).format(r.month),
                        principal: _formatCompact(locale, r.principal),
                        interest:  _formatCompact(locale, r.interest),
                        balance:   _formatCompact(locale, r.balance),
                      ),
                      if (r != rows.last) const Divider(height: 1),
                    ],
                  )),
              if (!_expanded && widget.schedule.length > 6) ...[
                const Divider(height: 1),
                TextButton(
                  onPressed: () => setState(() => _expanded = true),
                  child: Text(l.loanShowAll),
                ),
              ],
              if (_expanded && widget.schedule.length > 6) ...[
                const Divider(height: 1),
                TextButton(
                  onPressed: () => setState(() => _expanded = false),
                  child: Text(l.loanShowLess),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _TableRow extends StatelessWidget {
  const _TableRow({
    required this.month,
    required this.principal,
    required this.interest,
    required this.balance,
    this.isHeader = false,
  });

  final String month;
  final String principal;
  final String interest;
  final String balance;
  final bool   isHeader;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = isHeader
        ? theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w700,
          )
        : theme.textTheme.bodySmall?.copyWith(fontFamily: 'monospace');

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Row(
        children: [
          SizedBox(
            width: 44,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: AlignmentDirectional.centerStart,
              child: Text(month, style: style),
            ),
          ),
          Expanded(child: Text(principal, style: style, textAlign: TextAlign.end, maxLines: 1, overflow: TextOverflow.ellipsis)),
          Expanded(child: Text(interest,  style: style, textAlign: TextAlign.end, maxLines: 1, overflow: TextOverflow.ellipsis)),
          Expanded(child: Text(balance,   style: style, textAlign: TextAlign.end, maxLines: 1, overflow: TextOverflow.ellipsis)),
        ],
      ),
    );
  }
}

// ── Formatters ─────────────────────────────────────────────────────────────

String _locale(BuildContext context) =>
    Localizations.localeOf(context).toLanguageTag();

/// Whole amount with the locale's grouping, e.g. 87,220 / 87.220.
String _formatFull(String locale, double v) =>
    (NumberFormat.decimalPattern(locale)..maximumFractionDigits = 0).format(v);

/// Short amount in the locale's own style (1.2M, 12 लाख, 1,2 Mio. …).
String _formatCompact(String locale, double v) =>
    v < 1000 ? _formatFull(locale, v) : NumberFormat.compact(locale: locale).format(v);
