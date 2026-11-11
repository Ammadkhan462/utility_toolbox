import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:utility_toolbox/core/services/storage_service.dart';
import 'package:utility_toolbox/features/percentage_calculator/number_input.dart';
import 'package:utility_toolbox/features/percentage_calculator/percentage_calculator_screen.dart';
import 'package:utility_toolbox/features/percentage_calculator/percentage_math.dart';
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';

void main() {
  group('parseLooseNumber', () {
    test('plain and decimal numbers with either separator', () {
      expect(parseLooseNumber('12'), 12);
      expect(parseLooseNumber('12.5'), 12.5);
      expect(parseLooseNumber('12,5'), 12.5);
      expect(parseLooseNumber(' 7 '), 7);
      expect(parseLooseNumber('.5'), 0.5);
      expect(parseLooseNumber('5.'), 5);
    });

    test('grouping separators', () {
      expect(parseLooseNumber('1,234.56'), 1234.56);
      expect(parseLooseNumber('1.234,56'), 1234.56);
      expect(parseLooseNumber('1,000,000'), 1000000);
      expect(parseLooseNumber('1.000.000'), 1000000);
      expect(parseLooseNumber('1 234,5'), 1234.5);
      expect(parseLooseNumber('1,00,000'), 100000); // Indian grouping
    });

    test('ambiguous single separator follows the locale', () {
      expect(parseLooseNumber('1,234'), 1234); // English: grouping
      expect(parseLooseNumber('1,234', decimalSeparator: ','), 1.234);
      expect(parseLooseNumber('1.234', decimalSeparator: ','), 1234);
      expect(parseLooseNumber('1.234'), 1.234);
      expect(parseLooseNumber('0,250'), 0.25); // leading zero: decimal
    });

    test('native digits and Arabic separators', () {
      expect(parseLooseNumber('١٢٫٥'), 12.5);
      expect(parseLooseNumber('۱۵۰'), 150);
      expect(parseLooseNumber('১০০'), 100);
      expect(parseLooseNumber('२५'), 25);
      expect(parseLooseNumber('١٬٢٣٤٫٥'), 1234.5);
    });

    test('signs and invalid input', () {
      expect(parseLooseNumber('-3.5'), -3.5);
      expect(parseLooseNumber('−2'), -2);
      expect(parseLooseNumber(''), isNull);
      expect(parseLooseNumber('-'), isNull);
      expect(parseLooseNumber('.'), isNull);
      expect(parseLooseNumber('abc'), isNull);
      expect(parseLooseNumber('1.2.3,4,5'), isNull);
      expect(parseLooseNumber('1e400'), isNull);
    });
  });

  group('PercentageMath', () {
    test('percent of, what percent, change', () {
      expect(PercentageMath.percentOf(15, 200), 30);
      expect(PercentageMath.whatPercent(30, 200), 15);
      expect(PercentageMath.whatPercent(5, 0), isNull);
      expect(PercentageMath.percentChange(80, 100), 25);
      expect(PercentageMath.percentChange(100, 80), -20);
      expect(PercentageMath.percentChange(0, 5), isNull);
      expect(PercentageMath.percentChange(-50, -25), 50);
      expect(PercentageMath.percentOf(null, 5), isNull);
    });

    test('discount with extra discount stacks multiplicatively', () {
      final r = PercentageMath.discount(1000, 50, extraPercent: 10)!;
      expect(r.pay, closeTo(450, 1e-9));
      expect(r.save, closeTo(550, 1e-9));
      expect(r.effectivePercent, closeTo(55, 1e-9));
      final simple = PercentageMath.discount(2500, 20)!;
      expect(simple.pay, 2000);
      expect(PercentageMath.discount(100, 150)!.pay, 0); // clamped
      expect(PercentageMath.discount(null, 10), isNull);
    });

    test('tip and split', () {
      final r = PercentageMath.tip(1800, 10, 3)!;
      expect(r.tip, 180);
      expect(r.total, 1980);
      expect(r.perPerson, 660);
      expect(PercentageMath.tip(100, 15, 0)!.perPerson, 115); // min 1 person
      expect(PercentageMath.tip(-1, 10, 1), isNull);
    });

    test('add and remove tax', () {
      final add = PercentageMath.addTax(1000, 18)!;
      expect(add.tax, 180);
      expect(add.gross, 1180);
      final remove = PercentageMath.removeTax(1180, 18)!;
      expect(remove.net, closeTo(1000, 1e-9));
      expect(remove.tax, closeTo(180, 1e-9));
      expect(PercentageMath.removeTax(100, -5), isNull);
    });
  });

  group('PercentageCalculatorScreen', () {
    for (final (locale, scale) in [(const Locale('en'), 1.0), (const Locale('ar'), 2.0)]) {
      testWidgets('renders and computes on every tab ($locale ×$scale)', (tester) async {
        await _pumpScreen(
          tester,
          const PercentageCalculatorScreen(),
          locale: locale,
          textScale: scale,
        );
        await tester.enterText(find.byType(TextField).at(0), '15');
        await tester.enterText(find.byType(TextField).at(1), '200');
        await tester.pumpAndSettle();
        if (locale.languageCode == 'en') expect(find.text('15% of 200'), findsOneWidget);
        for (var i = 1; i < 4; i++) {
          await tester.ensureVisible(find.byType(Tab).at(i));
          await tester.pumpAndSettle();
          await tester.tap(find.byType(Tab).at(i));
          await tester.pumpAndSettle();
          await tester.enterText(find.byType(TextField).first, '1000');
          await tester.pumpAndSettle();
        }
        if (locale.languageCode == 'en') {
          await tester.scrollUntilVisible(find.text('1,180'), 200, scrollable: _vertical());
          expect(find.text('1,180'), findsOneWidget);
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
