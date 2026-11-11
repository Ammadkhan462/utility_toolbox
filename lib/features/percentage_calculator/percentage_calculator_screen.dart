import 'package:flutter/material.dart';
import 'package:utility_toolbox/core/tools/tool_registry.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/features/percentage_calculator/calc_widgets.dart';
import 'package:utility_toolbox/features/percentage_calculator/number_input.dart';
import 'package:utility_toolbox/features/percentage_calculator/percentage_math.dart';
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';

/// Percentage, discount, tip & split and tax/VAT calculators. Every result
/// updates live while typing.
class PercentageCalculatorScreen extends StatelessWidget {
  const PercentageCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final accent =
        ToolRegistry.byId('percentage_calculator')?.accent ?? const Color(0xFF7C6FFF);
    return DefaultTabController(
      length: 4,
      child: ToolScaffold(
        title: l.toolPercentageTitle,
        accentColor: accent,
        body: Column(
          children: [
            TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              tabs: [
                Tab(icon: const Icon(Icons.percent_rounded), text: l.percentageTabPercent),
                Tab(icon: const Icon(Icons.sell_rounded), text: l.percentageTabDiscount),
                Tab(icon: const Icon(Icons.restaurant_rounded), text: l.percentageTabTip),
                Tab(icon: const Icon(Icons.receipt_long_rounded), text: l.percentageTabTax),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _PercentTab(accent: accent),
                  _DiscountTab(accent: accent),
                  _TipTab(accent: accent),
                  _TaxTab(accent: accent),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Shared helpers ─────────────────────────────────────────────────────────

/// Base state for a tab: owns its controllers, parses with the user's
/// locale, keeps itself alive when swiping between tabs.
abstract class _TabState<T extends StatefulWidget> extends State<T>
    with AutomaticKeepAliveClientMixin {
  final List<TextEditingController> _controllers = [];

  TextEditingController controller([String text = '']) {
    final c = TextEditingController(text: text);
    _controllers.add(c);
    return c;
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  String get locale => NumberLocale.of(context);

  double? read(TextEditingController c) => parseLooseNumber(
        c.text,
        decimalSeparator: NumberLocale.decimalSeparator(locale),
      );

  String number(double v) => NumberLocale.decimal(locale).format(v);

  String percent(double v) => NumberLocale.percent(locale).format(v / 100);

  void refresh(String _) => setState(() {});

  Widget list(List<Widget> children) => ListView(
        padding: EdgeInsetsDirectional.fromSTEB(
          16,
          16,
          16,
          MediaQuery.viewInsetsOf(context).bottom + 24,
        ),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: children,
      );
}

class _PercentChips extends StatelessWidget {
  const _PercentChips({
    required this.values,
    required this.current,
    required this.format,
    required this.onSelected,
  });

  final List<double> values;
  final double? current;
  final String Function(double) format;
  final ValueChanged<double> onSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 8),
      child: Wrap(
        spacing: 8,
        runSpacing: 4,
        children: [
          for (final v in values)
            ChoiceChip(
              label: Text(format(v)),
              selected: current == v,
              onSelected: (_) => onSelected(v),
            ),
        ],
      ),
    );
  }
}

String _plain(double v) =>
    v == v.roundToDouble() ? v.toInt().toString() : v.toString();

// ── (a) Percentage ─────────────────────────────────────────────────────────

class _PercentTab extends StatefulWidget {
  const _PercentTab({required this.accent});

  final Color accent;

  @override
  State<_PercentTab> createState() => _PercentTabState();
}

class _PercentTabState extends _TabState<_PercentTab> {
  late final _ofPct = controller();
  late final _ofNum = controller();
  late final _part = controller();
  late final _total = controller();
  late final _from = controller();
  late final _to = controller();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final l = AppLocalizations.of(context);

    final ofResult = PercentageMath.percentOf(read(_ofPct), read(_ofNum));
    final whatResult = PercentageMath.whatPercent(read(_part), read(_total));
    final change = PercentageMath.percentChange(read(_from), read(_to));

    return list([
      CalcCard(
        title: l.percentageOfTitle,
        icon: Icons.percent_rounded,
        accent: widget.accent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FieldPair(
              first: NumberField(
                controller: _ofPct,
                label: l.percentageFieldPercent,
                hint: '15',
                suffix: '%',
                allowNegative: true,
                onChanged: refresh,
              ),
              second: NumberField(
                controller: _ofNum,
                label: l.percentageFieldNumber,
                hint: '200',
                allowNegative: true,
                onChanged: refresh,
              ),
            ),
            const SizedBox(height: 12),
            ResultPanel(
              accent: widget.accent,
              child: ofResult == null
                  ? ResultPlaceholder(l.percentageEnterValues)
                  : ResultLine(
                      label: l.percentageOfResult(
                        percent(read(_ofPct)!),
                        number(read(_ofNum)!),
                      ),
                      value: number(ofResult),
                      emphasize: true,
                      color: widget.accent,
                    ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 16),
      CalcCard(
        title: l.percentageWhatTitle,
        icon: Icons.pie_chart_rounded,
        accent: widget.accent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FieldPair(
              first: NumberField(
                controller: _part,
                label: l.percentageFieldPart,
                hint: '30',
                allowNegative: true,
                onChanged: refresh,
              ),
              second: NumberField(
                controller: _total,
                label: l.percentageFieldTotal,
                hint: '200',
                allowNegative: true,
                onChanged: refresh,
              ),
            ),
            const SizedBox(height: 12),
            ResultPanel(
              accent: widget.accent,
              child: whatResult == null
                  ? ResultPlaceholder(l.percentageEnterValues)
                  : ResultLine(
                      label: l.percentageWhatResult(
                        number(read(_part)!),
                        number(read(_total)!),
                      ),
                      value: percent(whatResult),
                      emphasize: true,
                      color: widget.accent,
                    ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 16),
      CalcCard(
        title: l.percentageChangeTitle,
        icon: Icons.trending_up_rounded,
        accent: widget.accent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FieldPair(
              first: NumberField(
                controller: _from,
                label: l.percentageFieldOld,
                hint: '80',
                allowNegative: true,
                onChanged: refresh,
              ),
              second: NumberField(
                controller: _to,
                label: l.percentageFieldNew,
                hint: '100',
                allowNegative: true,
                textInputAction: TextInputAction.done,
                onChanged: refresh,
              ),
            ),
            const SizedBox(height: 12),
            ResultPanel(
              accent: widget.accent,
              child: change == null
                  ? ResultPlaceholder(l.percentageEnterValues)
                  : _ChangeResult(
                      change: change,
                      difference: read(_to)! - read(_from)!,
                      percent: percent,
                      number: number,
                    ),
            ),
          ],
        ),
      ),
    ]);
  }
}

class _ChangeResult extends StatelessWidget {
  const _ChangeResult({
    required this.change,
    required this.difference,
    required this.percent,
    required this.number,
  });

  final double change;
  final double difference;
  final String Function(double) percent;
  final String Function(double) number;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final up = change > 0;
    final none = change.abs() < 1e-12;
    final color = none
        ? Theme.of(context).colorScheme.onSurfaceVariant
        : (up ? const Color(0xFF16A34A) : const Color(0xFFDC2626));
    final text = none
        ? l.percentageNoChange
        : (up ? l.percentageIncrease(percent(change.abs())) : l.percentageDecrease(percent(change.abs())));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Icon(
              none
                  ? Icons.trending_flat_rounded
                  : (up ? Icons.trending_up_rounded : Icons.trending_down_rounded),
              color: color,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                text,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: color,
                    ),
              ),
            ),
          ],
        ),
        if (!none)
          ResultLine(
            label: l.percentageDifference,
            value: '${difference > 0 ? '+' : ''}${number(difference)}',
          ),
      ],
    );
  }
}

// ── (b) Discount ───────────────────────────────────────────────────────────

class _DiscountTab extends StatefulWidget {
  const _DiscountTab({required this.accent});

  final Color accent;

  @override
  State<_DiscountTab> createState() => _DiscountTabState();
}

class _DiscountTabState extends _TabState<_DiscountTab> {
  late final _price = controller();
  late final _discount = controller();
  late final _extra = controller();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final l = AppLocalizations.of(context);
    final discount = read(_discount);
    final result = PercentageMath.discount(
      read(_price),
      discount,
      extraPercent: read(_extra),
    );

    return list([
      CalcCard(
        accent: widget.accent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            NumberField(
              controller: _price,
              label: l.percentagePrice,
              hint: '2500',
              large: true,
              onChanged: refresh,
            ),
            const SizedBox(height: 12),
            NumberField(
              controller: _discount,
              label: l.percentageDiscount,
              hint: '20',
              suffix: '%',
              onChanged: refresh,
            ),
            _PercentChips(
              values: const [10, 20, 25, 30, 40, 50, 70],
              current: discount,
              format: percent,
              onSelected: (v) => setState(() => _discount.text = _plain(v)),
            ),
            const SizedBox(height: 12),
            NumberField(
              controller: _extra,
              label: l.percentageExtraDiscount,
              hint: '10',
              suffix: '%',
              textInputAction: TextInputAction.done,
              onChanged: refresh,
            ),
          ],
        ),
      ),
      const SizedBox(height: 16),
      ResultPanel(
        accent: widget.accent,
        child: result == null
            ? ResultPlaceholder(l.percentageEnterValues)
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ResultLine(
                    label: l.percentageYouPay,
                    value: number(result.pay),
                    emphasize: true,
                    color: widget.accent,
                  ),
                  ResultLine(
                    label: l.percentageYouSave,
                    value: number(result.save),
                    color: const Color(0xFF16A34A),
                  ),
                  ResultLine(
                    label: l.percentageTotalDiscount,
                    value: percent(result.effectivePercent),
                  ),
                ],
              ),
      ),
    ]);
  }
}

// ── (c) Tip & split ────────────────────────────────────────────────────────

class _TipTab extends StatefulWidget {
  const _TipTab({required this.accent});

  final Color accent;

  @override
  State<_TipTab> createState() => _TipTabState();
}

class _TipTabState extends _TabState<_TipTab> {
  static const _presets = <double>[0, 5, 10, 15, 20];

  late final _bill = controller();
  late final _custom = controller();
  double? _preset = 10;
  int _people = 1;

  void _setPeople(int n) => setState(() => _people = n.clamp(1, 99));

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final l = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final tipPct = _preset ?? read(_custom);
    final result = PercentageMath.tip(read(_bill), tipPct, _people);

    return list([
      CalcCard(
        accent: widget.accent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            NumberField(
              controller: _bill,
              label: l.percentageBill,
              hint: '1800',
              large: true,
              onChanged: refresh,
            ),
            const SizedBox(height: 16),
            Text(l.percentageTip, style: theme.textTheme.labelLarge),
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 8),
              child: Wrap(
                spacing: 8,
                runSpacing: 4,
                children: [
                  for (final v in _presets)
                    ChoiceChip(
                      label: Text(percent(v)),
                      selected: _preset == v,
                      onSelected: (_) => setState(() => _preset = v),
                    ),
                  ChoiceChip(
                    avatar: const Icon(Icons.edit_rounded, size: 18),
                    label: Text(l.percentageCustom),
                    selected: _preset == null,
                    onSelected: (_) => setState(() => _preset = null),
                  ),
                ],
              ),
            ),
            if (_preset == null) ...[
              const SizedBox(height: 12),
              NumberField(
                controller: _custom,
                label: l.percentageTip,
                hint: '12',
                suffix: '%',
                onChanged: refresh,
              ),
            ],
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Text(l.percentagePeople, style: theme.textTheme.labelLarge),
                ),
                IconButton.filledTonal(
                  tooltip: l.percentageRemovePerson,
                  onPressed: _people > 1 ? () => _setPeople(_people - 1) : null,
                  icon: const Icon(Icons.remove_rounded),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: 48),
                  child: Text(
                    number(_people.toDouble()),
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
                  ),
                ),
                IconButton.filledTonal(
                  tooltip: l.percentageAddPerson,
                  onPressed: _people < 99 ? () => _setPeople(_people + 1) : null,
                  icon: const Icon(Icons.add_rounded),
                ),
              ],
            ),
          ],
        ),
      ),
      const SizedBox(height: 16),
      ResultPanel(
        accent: widget.accent,
        child: result == null
            ? ResultPlaceholder(l.percentageEnterValues)
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ResultLine(label: l.percentageTipAmount, value: number(result.tip)),
                  ResultLine(label: l.percentageTotal, value: number(result.total)),
                  if (_people > 1)
                    ResultLine(
                      label: l.percentagePerPerson,
                      value: number(result.perPerson),
                      emphasize: true,
                      color: widget.accent,
                    ),
                ],
              ),
      ),
    ]);
  }
}

// ── (d) Tax / GST / VAT ────────────────────────────────────────────────────

class _TaxTab extends StatefulWidget {
  const _TaxTab({required this.accent});

  final Color accent;

  @override
  State<_TaxTab> createState() => _TaxTabState();
}

class _TaxTabState extends _TabState<_TaxTab> {
  late final _amount = controller();
  late final _rate = controller('18');
  bool _add = true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final l = AppLocalizations.of(context);
    final rate = read(_rate);
    final result = _add
        ? PercentageMath.addTax(read(_amount), rate)
        : PercentageMath.removeTax(read(_amount), rate);

    return list([
      CalcCard(
        accent: widget.accent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SegmentedButton<bool>(
              segments: [
                ButtonSegment(
                  value: true,
                  icon: const Icon(Icons.add_rounded),
                  label: Text(l.percentageAddTax),
                ),
                ButtonSegment(
                  value: false,
                  icon: const Icon(Icons.remove_rounded),
                  label: Text(l.percentageRemoveTax),
                ),
              ],
              selected: {_add},
              onSelectionChanged: (s) => setState(() => _add = s.first),
            ),
            const SizedBox(height: 16),
            NumberField(
              controller: _amount,
              label: _add ? l.percentagePriceExclTax : l.percentagePriceInclTax,
              hint: '1000',
              large: true,
              onChanged: refresh,
            ),
            const SizedBox(height: 12),
            NumberField(
              controller: _rate,
              label: l.percentageTaxRate,
              suffix: '%',
              textInputAction: TextInputAction.done,
              onChanged: refresh,
            ),
            _PercentChips(
              values: const [5, 10, 12, 15, 17, 18, 20],
              current: rate,
              format: percent,
              onSelected: (v) => setState(() => _rate.text = _plain(v)),
            ),
          ],
        ),
      ),
      const SizedBox(height: 16),
      ResultPanel(
        accent: widget.accent,
        child: result == null
            ? ResultPlaceholder(l.percentageEnterValues)
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ResultLine(label: l.percentageBeforeTax, value: number(result.net)),
                  ResultLine(label: l.percentageTaxAmount, value: number(result.tax)),
                  ResultLine(
                    label: l.percentageAfterTax,
                    value: number(result.gross),
                    emphasize: true,
                    color: widget.accent,
                  ),
                ],
              ),
      ),
    ]);
  }
}
