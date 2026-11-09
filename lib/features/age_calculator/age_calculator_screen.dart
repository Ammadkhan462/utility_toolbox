import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/features/age_calculator/date_math.dart';

/// Age (from a birth date) and the difference between any two dates.
class AgeCalculatorScreen extends StatefulWidget {
  const AgeCalculatorScreen({super.key});

  @override
  State<AgeCalculatorScreen> createState() => _AgeCalculatorScreenState();
}

class _AgeCalculatorScreenState extends State<AgeCalculatorScreen> {
  static const _accent = Color(0xFFFF6FCF);

  DateTime _birth = DateTime(2000, 1, 1);
  DateTime _from = DateTime.now();
  DateTime _to = DateTime.now().add(const Duration(days: 30));

  Future<DateTime?> _pickDate(DateTime initial) => showDatePicker(
    context: context,
    initialDate: initial,
    firstDate: DateTime(1900),
    lastDate: DateTime(2200),
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: ToolScaffold(
        title: 'Age & Date',
        accentColor: _accent,
        body: Column(
          children: [
            const TabBar(tabs: [Tab(text: 'Age'), Tab(text: 'Between dates')]),
            Expanded(
              child: TabBarView(children: [_ageTab(context), _diffTab(context)]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _ageTab(BuildContext context) {
    final now = DateTime.now();
    final future = _birth.isAfter(now);
    final span = dateSpan(_birth, now);
    final days = totalDays(_birth, now);
    final toBirthday = daysUntilBirthday(_birth, now);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _DateField(
          label: 'Date of birth',
          date: _birth,
          onTap: () async {
            final d = await _pickDate(_birth);
            if (d != null) setState(() => _birth = d);
          },
        ),
        const SizedBox(height: 16),
        if (future)
          const _Hint('That date is in the future.')
        else ...[
          _BigResult(
            value: '${span.years}',
            unit: span.years == 1 ? 'year' : 'years',
            detail: '${span.months} month${span.months == 1 ? '' : 's'}, '
                '${span.days} day${span.days == 1 ? '' : 's'}',
          ),
          const SizedBox(height: 12),
          _StatGrid(
            stats: [
              ('Next birthday', toBirthday == 0 ? 'Today 🎉' : 'in $toBirthday days'),
              ('Total months', NumberFormat.decimalPattern().format(span.years * 12 + span.months)),
              ('Total weeks', NumberFormat.decimalPattern().format(days ~/ 7)),
              ('Total days', NumberFormat.decimalPattern().format(days)),
            ],
          ),
        ],
      ],
    );
  }

  Widget _diffTab(BuildContext context) {
    final span = dateSpan(_from, _to);
    final days = totalDays(_from, _to);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _DateField(
          label: 'From',
          date: _from,
          onTap: () async {
            final d = await _pickDate(_from);
            if (d != null) setState(() => _from = d);
          },
        ),
        const SizedBox(height: 12),
        _DateField(
          label: 'To',
          date: _to,
          onTap: () async {
            final d = await _pickDate(_to);
            if (d != null) setState(() => _to = d);
          },
        ),
        const SizedBox(height: 16),
        _BigResult(
          value: NumberFormat.decimalPattern().format(days),
          unit: days == 1 ? 'day' : 'days',
          detail: '${span.years} y, ${span.months} m, ${span.days} d',
        ),
        const SizedBox(height: 12),
        _StatGrid(
          stats: [
            ('Weeks', '${days ~/ 7} w ${days % 7} d'),
            ('Weekdays (Mon–Fri)', NumberFormat.decimalPattern().format(weekdaysBetween(_from, _to))),
            ('Hours', NumberFormat.decimalPattern().format(days * 24)),
            ('Including end date', NumberFormat.decimalPattern().format(days + 1)),
          ],
        ),
      ],
    );
  }
}

class _DateField extends StatelessWidget {
  const _DateField({required this.label, required this.date, required this.onTap});

  final String label;
  final DateTime date;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).toLanguageTag();
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          suffixIcon: const Icon(Icons.calendar_today_rounded),
        ),
        child: Text(DateFormat.yMMMMd(locale).format(date)),
      ),
    );
  }
}

class _BigResult extends StatelessWidget {
  const _BigResult({required this.value, required this.unit, required this.detail});

  final String value;
  final String unit;
  final String detail;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: value,
                    style: theme.textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFFFF6FCF),
                    ),
                  ),
                  TextSpan(text: '  $unit', style: theme.textTheme.titleLarge),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Text(detail, style: theme.textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}

class _StatGrid extends StatelessWidget {
  const _StatGrid({required this.stats});

  final List<(String, String)> stats;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 2.4,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      children: [
        for (final (label, value) in stats)
          Card(
            margin: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    value,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class _Hint extends StatelessWidget {
  const _Hint(this.text);
  final String text;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(8),
    child: Text(text, textAlign: TextAlign.center),
  );
}
