import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:utility_toolbox/core/tools/tool_registry.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/features/bmi_calculator/bmi_math.dart';
import 'package:utility_toolbox/features/percentage_calculator/calc_widgets.dart';
import 'package:utility_toolbox/features/percentage_calculator/number_input.dart';
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';

/// BMI with metric / imperial units, coloured gauge and healthy range.
class BmiCalculatorScreen extends StatefulWidget {
  const BmiCalculatorScreen({super.key});

  @override
  State<BmiCalculatorScreen> createState() => _BmiCalculatorScreenState();
}

const _kImperial = 'bmi_imperial_units';
const _kHeight = 'bmi_last_height_cm';
const _kWeight = 'bmi_last_weight_kg';

// Slider ranges.
const _minCm = 90.0, _maxCm = 230.0;
const _minKg = 20.0, _maxKg = 200.0;

const _colUnder = Color(0xFF3B82F6);
const _colNormal = Color(0xFF22C55E);
const _colOver = Color(0xFFF59E0B);
const _colObese = Color(0xFFEF4444);

Color _categoryColor(BmiCategory c) => switch (c) {
      BmiCategory.underweight => _colUnder,
      BmiCategory.normal => _colNormal,
      BmiCategory.overweight => _colOver,
      BmiCategory.obese => _colObese,
    };

class _BmiCalculatorScreenState extends State<BmiCalculatorScreen> {
  bool _imperial = false;
  double? _heightCm = 165;
  double? _weightKg = 65;
  String? _sex; // 'm' | 'f' | null

  final _cm = TextEditingController();
  final _kg = TextEditingController();
  final _ft = TextEditingController();
  final _in = TextEditingController();
  final _lb = TextEditingController();
  final _age = TextEditingController();

  SharedPreferences? _prefs;

  @override
  void initState() {
    super.initState();
    _syncControllers();
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) return;
    _prefs = prefs;
    setState(() {
      _imperial = prefs.getBool(_kImperial) ?? _imperial;
      _heightCm = prefs.getDouble(_kHeight) ?? _heightCm;
      _weightKg = prefs.getDouble(_kWeight) ?? _weightKg;
      _syncControllers();
    });
  }

  void _save() {
    final p = _prefs;
    if (p == null) return;
    p.setBool(_kImperial, _imperial);
    final h = _heightCm, w = _weightKg;
    if (h != null) p.setDouble(_kHeight, h);
    if (w != null) p.setDouble(_kWeight, w);
  }

  @override
  void dispose() {
    _save();
    for (final c in [_cm, _kg, _ft, _in, _lb, _age]) {
      c.dispose();
    }
    super.dispose();
  }

  String _fmt(double v, [int digits = 1]) {
    final s = v.toStringAsFixed(digits);
    return s.contains('.') ? s.replaceFirst(RegExp(r'\.?0+$'), '') : s;
  }

  /// Rewrites the visible fields from the canonical metric values.
  void _syncControllers({bool height = true, bool weight = true}) {
    final h = _heightCm, w = _weightKg;
    if (height) {
      _cm.text = h == null ? '' : _fmt(h);
      if (h == null) {
        _ft.text = '';
        _in.text = '';
      } else {
        final fi = BmiMath.feetInchesFromCm(h);
        _ft.text = '${fi.feet}';
        _in.text = '${fi.inches}';
      }
    }
    if (weight) {
      _kg.text = w == null ? '' : _fmt(w);
      _lb.text = w == null ? '' : _fmt(BmiMath.lbFromKg(w));
    }
  }

  double? _parse(TextEditingController c) {
    if (!mounted) return parseLooseNumber(c.text);
    final locale = NumberLocale.of(context);
    return parseLooseNumber(c.text, decimalSeparator: NumberLocale.decimalSeparator(locale));
  }

  void _onMetricHeight(String _) {
    final v = _parse(_cm);
    setState(() => _heightCm = (v != null && v > 0) ? v : null);
  }

  void _onImperialHeight(String _) {
    final ft = _parse(_ft);
    final inch = _parse(_in) ?? 0;
    setState(() {
      _heightCm = (ft == null && inch == 0)
          ? null
          : BmiMath.cmFromFeetInches(ft ?? 0, inch);
      if ((_heightCm ?? 0) <= 0) _heightCm = null;
    });
  }

  void _onMetricWeight(String _) {
    final v = _parse(_kg);
    setState(() => _weightKg = (v != null && v > 0) ? v : null);
  }

  void _onImperialWeight(String _) {
    final v = _parse(_lb);
    setState(() => _weightKg = (v != null && v > 0) ? BmiMath.kgFromLb(v) : null);
  }

  void _setUnits(bool imperial) {
    setState(() {
      _imperial = imperial;
      _syncControllers();
    });
    _save();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final accent = ToolRegistry.byId('bmi_calculator')?.accent ?? _colObese;
    final locale = NumberLocale.of(context);
    final fmt1 = NumberLocale.decimal(locale, maxFraction: 1);

    final bmi = BmiMath.bmi(weightKg: _weightKg, heightCm: _heightCm);
    final age = _parse(_age);

    String weightText(double kg) => _imperial
        ? '${fmt1.format(BmiMath.lbFromKg(kg))} ${l.bmiUnitLb}'
        : '${fmt1.format(kg)} ${l.bmiUnitKg}';

    return ToolScaffold(
      title: l.toolBmiTitle,
      accentColor: accent,
      body: ListView(
        padding: EdgeInsetsDirectional.fromSTEB(
          16,
          12,
          16,
          MediaQuery.viewInsetsOf(context).bottom + 24,
        ),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          SegmentedButton<bool>(
            segments: [
              ButtonSegment(value: false, label: Text(l.bmiMetric)),
              ButtonSegment(value: true, label: Text(l.bmiImperial)),
            ],
            selected: {_imperial},
            onSelectionChanged: (s) => _setUnits(s.first),
          ),
          const SizedBox(height: 16),
          CalcCard(
            title: l.bmiHeight,
            icon: Icons.height_rounded,
            accent: accent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (_imperial)
                  FieldPair(
                    first: NumberField(
                      controller: _ft,
                      label: l.bmiFeet,
                      suffix: l.bmiUnitFt,
                      decimal: false,
                      onChanged: _onImperialHeight,
                    ),
                    second: NumberField(
                      controller: _in,
                      label: l.bmiInches,
                      suffix: l.bmiUnitIn,
                      onChanged: _onImperialHeight,
                    ),
                  )
                else
                  NumberField(
                    controller: _cm,
                    label: l.bmiHeight,
                    suffix: l.bmiUnitCm,
                    onChanged: _onMetricHeight,
                  ),
                Slider(
                  value: (_heightCm ?? 165).clamp(_minCm, _maxCm),
                  min: _minCm,
                  max: _maxCm,
                  semanticFormatterCallback: (v) => _imperial
                      ? '${BmiMath.feetInchesFromCm(v).feet} ${l.bmiUnitFt} ${BmiMath.feetInchesFromCm(v).inches} ${l.bmiUnitIn}'
                      : '${_fmt(v, 0)} ${l.bmiUnitCm}',
                  onChanged: (v) => setState(() {
                    _heightCm = _imperial
                        ? (v / BmiMath.cmPerInch).roundToDouble() * BmiMath.cmPerInch
                        : v.roundToDouble();
                    _syncControllers(weight: false);
                  }),
                  onChangeEnd: (_) => _save(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          CalcCard(
            title: l.bmiWeight,
            icon: Icons.monitor_weight_rounded,
            accent: accent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                NumberField(
                  controller: _imperial ? _lb : _kg,
                  label: l.bmiWeight,
                  suffix: _imperial ? l.bmiUnitLb : l.bmiUnitKg,
                  onChanged: _imperial ? _onImperialWeight : _onMetricWeight,
                ),
                Slider(
                  value: (_weightKg ?? 65).clamp(_minKg, _maxKg),
                  min: _minKg,
                  max: _maxKg,
                  semanticFormatterCallback: (v) => _imperial
                      ? '${_fmt(BmiMath.lbFromKg(v), 0)} ${l.bmiUnitLb}'
                      : '${_fmt(v)} ${l.bmiUnitKg}',
                  onChanged: (v) => setState(() {
                    _weightKg = _imperial
                        ? BmiMath.kgFromLb(BmiMath.lbFromKg(v).roundToDouble())
                        : (v * 2).round() / 2;
                    _syncControllers(height: false);
                  }),
                  onChangeEnd: (_) => _save(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          CalcCard(
            accent: accent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                NumberField(
                  controller: _age,
                  label: l.bmiAge,
                  decimal: false,
                  textInputAction: TextInputAction.done,
                  onChanged: (_) => setState(() {}),
                ),
                const SizedBox(height: 12),
                Text(l.bmiSex, style: theme.textTheme.labelLarge),
                const SizedBox(height: 8),
                SegmentedButton<String>(
                  emptySelectionAllowed: true,
                  showSelectedIcon: false,
                  segments: [
                    ButtonSegment(
                      value: 'm',
                      icon: const Icon(Icons.male_rounded),
                      label: Text(l.bmiMale),
                    ),
                    ButtonSegment(
                      value: 'f',
                      icon: const Icon(Icons.female_rounded),
                      label: Text(l.bmiFemale),
                    ),
                  ],
                  selected: _sex == null ? <String>{} : {_sex!},
                  onSelectionChanged: (s) =>
                      setState(() => _sex = s.isEmpty ? null : s.first),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          ResultPanel(
            accent: bmi == null ? accent : _categoryColor(BmiMath.category(bmi)),
            child: bmi == null
                ? ResultPlaceholder(l.bmiEnterValues)
                : _BmiResult(
                    bmi: bmi,
                    heightCm: _heightCm!,
                    weightKg: _weightKg!,
                    age: age,
                    sex: _sex,
                    weightText: weightText,
                  ),
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.info_outline_rounded,
                  size: 16, color: theme.colorScheme.onSurfaceVariant),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  l.bmiDisclaimer,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BmiResult extends StatelessWidget {
  const _BmiResult({
    required this.bmi,
    required this.heightCm,
    required this.weightKg,
    required this.age,
    required this.sex,
    required this.weightText,
  });

  final double bmi;
  final double heightCm;
  final double weightKg;
  final double? age;
  final String? sex;
  final String Function(double kg) weightText;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final locale = NumberLocale.of(context);
    final category = BmiMath.category(bmi);
    final color = _categoryColor(category);
    final label = switch (category) {
      BmiCategory.underweight => l.bmiUnderweight,
      BmiCategory.normal => l.bmiNormal,
      BmiCategory.overweight => l.bmiOverweight,
      BmiCategory.obese => l.bmiObese,
    };
    final bmiText = NumberLocale.decimal(locale, maxFraction: 1, minFraction: 1).format(bmi);
    final range = BmiMath.healthyWeightKg(heightCm)!;
    final delta = BmiMath.weightToHealthyKg(weightKg: weightKg, heightCm: heightCm);
    final isChild = age != null && age! > 0 && age! < 18;
    final ideal = (sex == null || isChild)
        ? null
        : BmiMath.devineIdealKg(heightCm: heightCm, male: sex == 'm');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Semantics(
          label: '${l.bmiYourBmi} $bmiText, $label',
          excludeSemantics: true,
          child: Column(
            children: [
              Text(
                l.bmiYourBmi,
                style: theme.textTheme.labelLarge?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                bmiText,
                style: theme.textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: color,
                ),
              ),
              Container(
                margin: const EdgeInsetsDirectional.only(top: 4),
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: color,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _BmiGauge(bmi: bmi, locale: locale),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          l.bmiHealthyRange(weightText(range.min), weightText(range.max)),
          style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        if (!isChild && delta.abs() >= 0.1) ...[
          const SizedBox(height: 6),
          Text(
            delta > 0 ? l.bmiToLose(weightText(delta)) : l.bmiToGain(weightText(-delta)),
            style: theme.textTheme.bodyMedium,
          ),
        ],
        if (ideal != null) ...[
          const SizedBox(height: 6),
          Text(l.bmiIdealWeight(weightText(ideal)), style: theme.textTheme.bodyMedium),
        ],
        if (isChild) ...[
          const SizedBox(height: 10),
          Text(
            l.bmiChildNote,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ],
    );
  }
}

/// Four coloured bands (15–40) with an animated marker at the BMI value.
class _BmiGauge extends StatelessWidget {
  const _BmiGauge({required this.bmi, required this.locale});

  final double bmi;
  final String locale;

  static const _min = 15.0, _max = 40.0;
  static const _ticks = [18.5, 25.0, 30.0];

  @override
  Widget build(BuildContext context) {
    final rtl = Directionality.of(context) == TextDirection.rtl;
    final theme = Theme.of(context);
    final fmt = NumberLocale.decimal(locale, maxFraction: 1);
    final target = BmiMath.gaugeFraction(bmi, min: _min, max: _max);

    return LayoutBuilder(
      builder: (context, c) {
        final w = c.maxWidth;
        double x(double f) => (rtl ? 1 - f : f) * w;
        return SizedBox(
          height: 52,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              PositionedDirectional(
                start: 0,
                end: 0,
                top: 10,
                height: 14,
                child: CustomPaint(painter: _BandsPainter(rtl: rtl, min: _min, max: _max)),
              ),
              TweenAnimationBuilder<double>(
                tween: Tween(end: target),
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeOutCubic,
                builder: (context, f, _) => Positioned(
                  left: x(f) - 9,
                  top: 6,
                  child: Container(
                    width: 18,
                    height: 22,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: theme.colorScheme.onSurface, width: 2.5),
                    ),
                  ),
                ),
              ),
              for (final t in _ticks)
                Positioned(
                  left: x((t - _min) / (_max - _min)) - 20,
                  top: 32,
                  width: 40,
                  child: Text(
                    fmt.format(t),
                    textAlign: TextAlign.center,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _BandsPainter extends CustomPainter {
  _BandsPainter({required this.rtl, required this.min, required this.max});

  final bool rtl;
  final double min;
  final double max;

  @override
  void paint(Canvas canvas, Size size) {
    final bands = [
      (min, BmiMath.underweightBelow, _colUnder),
      (BmiMath.underweightBelow, BmiMath.normalBelow, _colNormal),
      (BmiMath.normalBelow, BmiMath.overweightBelow, _colOver),
      (BmiMath.overweightBelow, max, _colObese),
    ];
    final r = size.height / 2;
    canvas.save();
    canvas.clipRRect(RRect.fromRectAndRadius(Offset.zero & size, Radius.circular(r)));
    final paint = Paint();
    for (final (a, b, color) in bands) {
      var x0 = (a - min) / (max - min) * size.width;
      var x1 = (b - min) / (max - min) * size.width;
      if (rtl) {
        final t = size.width - x1;
        x1 = size.width - x0;
        x0 = t;
      }
      paint.color = color;
      canvas.drawRect(Rect.fromLTRB(x0, 0, x1, size.height), paint);
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(_BandsPainter old) => old.rtl != rtl;
}
