import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/features/loan_calculator/providers/loan_providers.dart';

const _accentColor = Color(0xFFF59E0B);

class LoanCalculatorScreen extends ConsumerWidget {
  const LoanCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result   = ref.watch(loanResultProvider);
    final inYears  = ref.watch(tenureInYearsProvider);

    return ToolScaffold(
      title: 'Loan / EMI Calculator',
      accentColor: _accentColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ── Inputs ──────────────────────────────────────────────────
            _InputCard(
              label:       'Loan Amount',
              prefix:      'Rs.',
              hintText:    '1,000,000',
              initial:     ref.read(loanAmountProvider).toStringAsFixed(0),
              keyboardType: const TextInputType.numberWithOptions(decimal: false),
              onChanged:   (v) {
                final parsed = double.tryParse(v.replaceAll(',', ''));
                if (parsed != null) {
                  ref.read(loanAmountProvider.notifier).state = parsed;
                }
              },
            ),
            const SizedBox(height: 12),
            _InputCard(
              label:       'Annual Interest Rate',
              suffix:      '%',
              hintText:    '8.5',
              initial:     ref.read(interestRateProvider).toString(),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              onChanged:   (v) {
                final parsed = double.tryParse(v);
                if (parsed != null) {
                  ref.read(interestRateProvider.notifier).state = parsed;
                }
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
                        'Enter valid loan details above\nto calculate EMI',
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
    this.prefix,
    this.suffix,
    this.keyboardType,
  });

  final String           label;
  final String           hintText;
  final String           initial;
  final void Function(String) onChanged;
  final String?          prefix;
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
        prefixText:  prefix != null ? '$prefix ' : null,
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
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            initialValue: ref.read(loanTenureProvider).toStringAsFixed(0),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              labelText: inYears ? 'Tenure (Years)' : 'Tenure (Months)',
              hintText:  inYears ? '5' : '60',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
              filled: true,
            ),
            onChanged: (v) {
              final parsed = double.tryParse(v);
              if (parsed != null) {
                ref.read(loanTenureProvider.notifier).state = parsed;
              }
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
                label:    'Mo',
                selected: !inYears,
                onTap: () =>
                    ref.read(tenureInYearsProvider.notifier).state = false,
              ),
              _TenureToggle(
                label:    'Yr',
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
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
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

class _ResultSummary extends StatelessWidget {
  const _ResultSummary({required this.result});

  final LoanResult result;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            _accentColor.withValues(alpha: 0.15),
            _accentColor.withValues(alpha: 0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _accentColor.withValues(alpha: 0.3)),
      ),
      child: Column(
        children: [
          Text(
            'Monthly EMI',
            style: theme.textTheme.labelLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            _formatAmount(result.emi),
            style: theme.textTheme.displaySmall?.copyWith(
              color: _accentColor,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              _SummaryItem(
                label: 'Principal',
                value: _formatAmount(
                  result.totalPayment - result.totalInterest,
                ),
                color: const Color(0xFF3B82F6),
              ),
              _SummaryItem(
                label: 'Total Interest',
                value: _formatAmount(result.totalInterest),
                color: const Color(0xFFEF4444),
              ),
              _SummaryItem(
                label: 'Total Payment',
                value: _formatAmount(result.totalPayment),
                color: const Color(0xFF22C55E),
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Breakdown', style: theme.textTheme.labelLarge),
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
        Row(
          children: [
            _Legend(color: const Color(0xFF3B82F6), label: 'Principal'),
            const SizedBox(width: 16),
            _Legend(color: const Color(0xFFEF4444), label: 'Interest'),
            const Spacer(),
            Text(
              '${(iPct * 100).toStringAsFixed(1)}% interest',
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
    final rows  = _expanded
        ? widget.schedule
        : widget.schedule.take(6).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Amortization Schedule', style: theme.textTheme.labelLarge),
            Text(
              '${widget.schedule.length} months',
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
                month:     'Mo.',
                principal: 'Principal',
                interest:  'Interest',
                balance:   'Balance',
                isHeader:  true,
              ),
              const Divider(height: 1),
              ...rows.map((r) => Column(
                    children: [
                      _TableRow(
                        month:     r.month.toString(),
                        principal: _formatCompact(r.principal),
                        interest:  _formatCompact(r.interest),
                        balance:   _formatCompact(r.balance),
                      ),
                      if (r != rows.last) const Divider(height: 1),
                    ],
                  )),
              if (!_expanded && widget.schedule.length > 6) ...[
                const Divider(height: 1),
                TextButton(
                  onPressed: () => setState(() => _expanded = true),
                  child: const Text('Show all months'),
                ),
              ],
              if (_expanded && widget.schedule.length > 6) ...[
                const Divider(height: 1),
                TextButton(
                  onPressed: () => setState(() => _expanded = false),
                  child: const Text('Show less'),
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
          SizedBox(width: 32, child: Text(month, style: style)),
          Expanded(child: Text(principal, style: style, textAlign: TextAlign.right)),
          Expanded(child: Text(interest,  style: style, textAlign: TextAlign.right)),
          Expanded(child: Text(balance,   style: style, textAlign: TextAlign.right)),
        ],
      ),
    );
  }
}

// ── Formatters ─────────────────────────────────────────────────────────────

String _formatAmount(double v) {
  if (v >= 10000000) return 'Rs.${(v / 10000000).toStringAsFixed(2)}Cr';
  if (v >= 100000)   return 'Rs.${(v / 100000).toStringAsFixed(2)}L';
  if (v >= 1000)     return 'Rs.${(v / 1000).toStringAsFixed(1)}K';
  return 'Rs.${v.toStringAsFixed(0)}';
}

String _formatCompact(double v) {
  if (v >= 100000) return '${(v / 100000).toStringAsFixed(1)}L';
  if (v >= 1000)   return '${(v / 1000).toStringAsFixed(1)}K';
  return v.toStringAsFixed(0);
}
