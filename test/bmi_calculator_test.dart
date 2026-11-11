import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:utility_toolbox/core/services/storage_service.dart';
import 'package:utility_toolbox/features/bmi_calculator/bmi_calculator_screen.dart';
import 'package:utility_toolbox/features/bmi_calculator/bmi_math.dart';
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';

void main() {
  group('BmiMath', () {
    test('BMI value', () {
      expect(BmiMath.bmi(weightKg: 70, heightCm: 175), closeTo(22.857, 0.001));
      expect(BmiMath.bmi(weightKg: 0, heightCm: 175), isNull);
      expect(BmiMath.bmi(weightKg: 70, heightCm: 0), isNull);
      expect(BmiMath.bmi(weightKg: null, heightCm: 170), isNull);
    });

    test('categories at the WHO boundaries', () {
      expect(BmiMath.category(18.49), BmiCategory.underweight);
      expect(BmiMath.category(18.5), BmiCategory.normal);
      expect(BmiMath.category(24.99), BmiCategory.normal);
      expect(BmiMath.category(25), BmiCategory.overweight);
      expect(BmiMath.category(29.99), BmiCategory.overweight);
      expect(BmiMath.category(30), BmiCategory.obese);
      expect(BmiMath.category(45), BmiCategory.obese);
    });

    test('healthy weight range and distance to it', () {
      final r = BmiMath.healthyWeightKg(175)!;
      expect(r.min, closeTo(56.66, 0.01));
      expect(r.max, closeTo(76.26, 0.01));
      expect(BmiMath.weightToHealthyKg(weightKg: 80, heightCm: 175), closeTo(3.74, 0.01));
      expect(BmiMath.weightToHealthyKg(weightKg: 50, heightCm: 175), closeTo(-6.66, 0.01));
      expect(BmiMath.weightToHealthyKg(weightKg: 65, heightCm: 175), 0);
    });

    test('unit conversions', () {
      expect(BmiMath.cmFromFeetInches(5, 9), closeTo(175.26, 0.001));
      final fi = BmiMath.feetInchesFromCm(175.26);
      expect(fi.feet, 5);
      expect(fi.inches, 9);
      // 182.8 cm = 71.97 in → rounds to 6 ft 0 in, never 5 ft 12 in.
      final six = BmiMath.feetInchesFromCm(182.8);
      expect((six.feet, six.inches), (6, 0));
      expect(BmiMath.kgFromLb(154), closeTo(69.85, 0.01));
      expect(BmiMath.lbFromKg(BmiMath.kgFromLb(200)), closeTo(200, 1e-9));
    });

    test('Devine ideal weight and gauge position', () {
      expect(BmiMath.devineIdealKg(heightCm: 177.8, male: true), closeTo(73, 0.01));
      expect(BmiMath.devineIdealKg(heightCm: 177.8, male: false), closeTo(68.5, 0.01));
      expect(BmiMath.devineIdealKg(heightCm: 140, male: true), isNull);
      expect(BmiMath.gaugeFraction(15), 0);
      expect(BmiMath.gaugeFraction(27.5), 0.5);
      expect(BmiMath.gaugeFraction(60), 1);
    });
  });

  group('BmiCalculatorScreen', () {
    for (final (locale, scale) in [(const Locale('en'), 1.0), (const Locale('ur'), 2.0)]) {
      testWidgets('renders, switches units, child note ($locale ×$scale)', (tester) async {
        await _pumpScreen(tester, const BmiCalculatorScreen(), locale: locale, textScale: scale);
        if (locale.languageCode == 'en') expect(find.text('23.9'), findsOneWidget);
        await tester.tap(
          find.byWidgetPredicate(
            (w) => w is Text && (w.data == 'Imperial (ft, lb)' || w.data == 'امپیریل (فٹ، پاؤنڈ)'),
          ),
        );
        await tester.pumpAndSettle();
        if (locale.languageCode == 'en') {
          expect(find.text('5'), findsWidgets); // 165 cm ≈ 5 ft 5 in
          expect(find.text('143.3'), findsOneWidget); // 65 kg in lb
        }
        await tester.scrollUntilVisible(find.byIcon(Icons.male_rounded), 200, scrollable: _vertical());
        await tester.enterText(find.byType(TextField).last, '12'); // age
        await tester.pumpAndSettle();
        if (locale.languageCode == 'en') {
          await tester.scrollUntilVisible(
            find.textContaining('under 18'),
            200,
            scrollable: _vertical(),
          );
          expect(find.textContaining('under 18'), findsOneWidget);
        }
      });
    }
  });
}

// ── Widget smoke test helper ───────────────────────────────────────────────

Future<void> _pumpScreen(
  WidgetTester tester,
  Widget screen, {
  Locale locale = const Locale('en'),
  double textScale = 1,
  Map<String, Object> prefs = const {},
}) async {
  SharedPreferences.setMockInitialValues(prefs);
  final storage = StorageService(await SharedPreferences.getInstance());
  tester.view.physicalSize = const Size(360 * 2, 740 * 2);
  tester.view.devicePixelRatio = 2;
  addTearDown(tester.view.reset);
  await tester.pumpWidget(
    ProviderScope(
      overrides: [storageServiceProvider.overrideWithValue(storage)],
      child: MaterialApp(
        locale: locale,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(textScale)),
          child: child!,
        ),
        home: screen,
      ),
    ),
  );
  await tester.pumpAndSettle();
}

Finder _vertical() => find
    .byWidgetPredicate(
      (w) => w is Scrollable && axisDirectionToAxis(w.axisDirection) == Axis.vertical,
    )
    .hitTestable()
    .first;
