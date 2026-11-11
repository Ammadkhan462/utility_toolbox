import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/features/age_calculator/date_math.dart';
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';

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

  NumberFormat _numbers(BuildContext context) =>
      NumberFormat.decimalPattern(Localizations.localeOf(context).toLanguageTag());

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return DefaultTabController(
      length: 2,
      child: ToolScaffold(
        title: l.toolAgeCalculatorTitle,
        accentColor: _accent,
        body: Column(
          children: [
            TabBar(tabs: [Tab(text: l.ageTabAge), Tab(text: l.ageTabBetween)]),
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
    final l = AppLocalizations.of(context);
    final n = _numbers(context);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _DateField(
          label: l.ageDateOfBirth,
          date: _birth,
          onTap: () async {
            final d = await _pickDate(_birth);
            if (d != null && mounted) setState(() => _birth = d);
          },
        ),
        const SizedBox(height: 16),
        if (future)
          _Hint(l.ageFutureDate)
        else ...[
          _BigResult(
            value: n.format(span.years),
            unit: l.ageYearsUnit(span.years),
            detail: l.ageList2(l.ageMonths(span.months), l.ageDays(span.days)),
          ),
          const SizedBox(height: 12),
          _StatGrid(
            stats: [
              (l.ageNextBirthday, toBirthday == 0 ? l.ageBirthdayToday : l.ageInDays(toBirthday)),
              (l.ageTotalMonths, n.format(span.years * 12 + span.months)),
              (l.ageTotalWeeks, n.format(days ~/ 7)),
              (l.ageTotalDays, n.format(days)),
            ],
          ),
        ],
      ],
    );
  }

  Widget _diffTab(BuildContext context) {
    final span = dateSpan(_from, _to);
    final days = totalDays(_from, _to);
    final l = AppLocalizations.of(context);
    final n = _numbers(context);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _DateField(
          label: l.ageFrom,
          date: _from,
          onTap: () async {
            final d = await _pickDate(_from);
            if (d != null && mounted) setState(() => _from = d);
          },
        ),
        const SizedBox(height: 12),
        _DateField(
          label: l.ageTo,
          date: _to,
          onTap: () async {
            final d = await _pickDate(_to);
            if (d != null && mounted) setState(() => _to = d);
          },
        ),
        const SizedBox(height: 16),
        _BigResult(
          value: n.format(days),
          unit: l.ageDaysUnit(days),
          detail: l.ageList3(
            l.ageYears(span.years),
            l.ageMonths(span.months),
            l.ageDays(span.days),
          ),
        ),
        const SizedBox(height: 12),
        _StatGrid(
          stats: [
            (l.ageWeeksLabel, l.ageList2(l.ageWeeks(days ~/ 7), l.ageDays(days % 7))),
            (l.ageWeekdays, n.format(weekdaysBetween(_from, _to))),
            (l.ageHours, n.format(days * 24)),
            (l.ageIncludingEnd, n.format(days + 1)),
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
            Text(detail, textAlign: TextAlign.center, style: theme.textTheme.titleMedium),
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
      // Room for a two-line label (longer German/Russian strings).
      childAspectRatio: 2.0,
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
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 2),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      value,
                      maxLines: 1,
                      style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
                    ),
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
