import 'package:flutter_test/flutter_test.dart';
import 'package:utility_toolbox/features/age_calculator/date_math.dart';
import 'package:utility_toolbox/features/calculator/calc_engine.dart';
import 'package:utility_toolbox/features/image_resizer/image_resize_logic.dart';
import 'package:utility_toolbox/features/pdf_toolkit/services/pdf_extra_service.dart';

void main() {
  group('CalcEngine', () {
    double ev(String s) => CalcEngine.evaluate(s);

    test('precedence and parentheses', () {
      expect(ev('2+3×4'), 14);
      expect(ev('(2+3)×4'), 20);
      expect(ev('10÷4'), 2.5);
      expect(ev('2*(3+(4-1))'), 12);
    });

    test('unary minus and percent', () {
      expect(ev('-5+2'), -3);
      expect(ev('3×-2'), -6);
      expect(ev('50%'), 0.5);
      expect(ev('200×15%'), 30);
      expect(ev('−4+1'), -3);
    });

    test('auto-closes parentheses', () {
      expect(ev('(1+2'), 3);
    });

    test('errors', () {
      expect(() => ev('1÷0'), throwsUnsupportedError);
      expect(() => ev('1..2'), throwsFormatException);
      expect(() => ev('2+'), throwsFormatException);
      expect(CalcEngine.tryEvaluate('abc'), isNull);
    });

    test('formatting', () {
      expect(CalcEngine.format(3), '3');
      expect(CalcEngine.format(0.1 + 0.2), '0.3');
      expect(CalcEngine.format(1 / 3), '0.3333333333');
      expect(CalcEngine.format(-2.5), '-2.5');
      expect(CalcEngine.format(1e20), contains('e'));
    });
  });

  group('parsePageRanges', () {
    test('singles, ranges and open ends', () {
      expect(parsePageRanges('1-3, 5, 8-', 10), [0, 1, 2, 4, 7, 8, 9]);
      expect(parsePageRanges('2', 2), [1]);
      expect(parsePageRanges('3,1,3', 5), [0, 2]);
    });

    test('rejects bad input', () {
      expect(() => parsePageRanges('', 5), throwsFormatException);
      expect(() => parsePageRanges('0', 5), throwsFormatException);
      expect(() => parsePageRanges('4-2', 5), throwsFormatException);
      expect(() => parsePageRanges('6', 5), throwsFormatException);
      expect(() => parsePageRanges('a', 5), throwsFormatException);
    });
  });

  group('planResize', () {
    test('percent', () {
      final plan = planResize(4000, 3000, const PercentResize(50));
      expect((plan.outWidth, plan.outHeight), (2000, 1500));
    });

    test('fit never upscales and keeps aspect', () {
      expect(planResize(800, 600, const FitResize(1280)).outWidth, 800);
      final plan = planResize(4000, 2000, const FitResize(1000));
      expect((plan.outWidth, plan.outHeight), (1000, 500));
    });

    test('exact with crop covers then crops to exact size', () {
      final plan = planResize(4000, 3000, const ExactResize(413, 531));
      expect((plan.outWidth, plan.outHeight), (413, 531));
      expect(plan.scaledWidth >= 413 && plan.scaledHeight >= 531, isTrue);
      expect(plan.scaledHeight, 531); // height is the limiting side here
    });

    test('exact without crop stretches', () {
      final plan = planResize(4000, 3000, const ExactResize(100, 100, crop: false));
      expect((plan.outWidth, plan.outHeight, plan.cropWidth), (100, 100, null));
    });
  });

  group('date math', () {
    test('ages with month/day borrowing', () {
      expect(dateSpan(DateTime(2000, 1, 31), DateTime(2000, 3, 1)), const DateSpan(0, 1, 1));
      expect(dateSpan(DateTime(1990, 6, 15), DateTime(2026, 6, 14)), const DateSpan(35, 11, 30));
      expect(dateSpan(DateTime(1990, 6, 15), DateTime(2026, 6, 15)), const DateSpan(36, 0, 0));
      expect(dateSpan(DateTime(2026, 6, 15), DateTime(1990, 6, 15)), const DateSpan(36, 0, 0));
    });

    test('total days across DST and leap years', () {
      expect(totalDays(DateTime(2024, 1, 1), DateTime(2025, 1, 1)), 366);
      expect(totalDays(DateTime(2026, 3, 1), DateTime(2026, 4, 1)), 31);
    });

    test('next birthday, including 29 Feb', () {
      expect(daysUntilBirthday(DateTime(2000, 11, 10), DateTime(2026, 11, 10)), 0);
      expect(daysUntilBirthday(DateTime(2000, 11, 11), DateTime(2026, 11, 10)), 1);
      expect(daysUntilBirthday(DateTime(2000, 2, 29), DateTime(2027, 2, 27)), 1);
    });

    test('weekdays inclusive', () {
      // Mon 2 Nov 2026 .. Sun 8 Nov 2026
      expect(weekdaysBetween(DateTime(2026, 11, 2), DateTime(2026, 11, 8)), 5);
      expect(weekdaysBetween(DateTime(2026, 11, 7), DateTime(2026, 11, 7)), 0);
      expect(weekdaysBetween(DateTime(2026, 11, 2), DateTime(2026, 11, 15)), 10);
    });
  });
}
