import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:utility_toolbox/core/services/storage_service.dart';
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:utility_toolbox/features/bubble_level/bubble_level_screen.dart';
import 'package:utility_toolbox/features/bubble_level/level_math.dart';

const g = 9.81;

Vec3 tiltedFlat({double xDeg = 0, double yDeg = 0}) {
  // Lying flat, then the right edge raised by xDeg and the top edge by yDeg.
  final x = math.tan(xDeg * math.pi / 180);
  final y = math.tan(yDeg * math.pi / 180);
  final n = math.sqrt(x * x + y * y + 1);
  return Vec3(g * x / n, g * y / n, g / n);
}

Vec3 upright(double rollDeg) {
  // Portrait upright, then rotated by rollDeg (+ = right edge raised).
  final r = rollDeg * math.pi / 180;
  return Vec3(g * math.sin(r), g * math.cos(r), 0);
}

void main() {
  group('LowPassFilter', () {
    test('first sample passes straight through', () {
      final f = LowPassFilter();
      final v = f.add(const Vec3(1, 2, 3), const Duration(milliseconds: 20));
      expect(v.x, 1);
      expect(v.z, 3);
    });

    test('converges towards a steady input and damps noise', () {
      final f = LowPassFilter(timeConstant: 0.1);
      f.add(const Vec3(0, 0, 0), Duration.zero);
      final step = f.add(const Vec3(10, 0, 0), const Duration(milliseconds: 20));
      expect(step.x, closeTo(10 * 0.02 / 0.12, 1e-9));
      Vec3 v = step;
      for (var i = 0; i < 100; i++) {
        v = f.add(const Vec3(10, 0, 0), const Duration(milliseconds: 20));
      }
      expect(v.x, closeTo(10, 0.01));
    });

    test('is rate independent', () {
      final fast = LowPassFilter(), slow = LowPassFilter();
      fast.add(const Vec3(0, 0, 0), Duration.zero);
      slow.add(const Vec3(0, 0, 0), Duration.zero);
      late Vec3 a, b;
      for (var i = 0; i < 50; i++) {
        a = fast.add(const Vec3(1, 0, 0), const Duration(milliseconds: 10));
      }
      for (var i = 0; i < 10; i++) {
        b = slow.add(const Vec3(1, 0, 0), const Duration(milliseconds: 50));
      }
      expect(a.x, closeTo(b.x, 0.05));
    });
  });

  group('mode', () {
    test('flat is surface, standing is upright, with hysteresis', () {
      expect(modeFor(tiltedFlat(), null), LevelMode.surface);
      expect(modeFor(upright(0), null), LevelMode.upright);
      // 45° sits inside the hysteresis band: keeps the previous mode.
      final mid = tiltedFlat(yDeg: 45);
      expect(screenTilt(mid), closeTo(45, 1e-6));
      expect(modeFor(mid, LevelMode.surface), LevelMode.surface);
      expect(modeFor(mid, LevelMode.upright), LevelMode.upright);
    });
  });

  group('angles', () {
    test('surface angles follow the raised edges', () {
      final a = surfaceAngles(tiltedFlat(xDeg: 2, yDeg: -3));
      expect(a.x, closeTo(2, 1e-6));
      expect(a.y, closeTo(-3, 1e-6));
    });

    test('upright angle in portrait and landscape', () {
      expect(barAxisFor(upright(3)), BarAxis.x);
      expect(uprightAngle(upright(3), BarAxis.x), closeTo(3, 1e-6));
      expect(uprightAngle(upright(-1.5), BarAxis.x), closeTo(-1.5, 1e-6));
      // Landscape: the long edge is horizontal, deviation from 90°.
      final land = upright(90 - 2);
      expect(barAxisFor(land), BarAxis.y);
      expect(uprightAngle(land, BarAxis.y).abs(), closeTo(2, 1e-6));
      // Upside down still reads small angles.
      expect(uprightAngle(upright(180 + 1), BarAxis.x).abs(), closeTo(1, 1e-6));
    });

    test('calibration offsets are subtracted', () {
      const cal = LevelCalibration(x: 1, y: -1, upright: 0.5);
      final s = readingFor(tiltedFlat(xDeg: 1, yDeg: -1), LevelMode.surface, cal);
      expect(s.angle, closeTo(0, 1e-6));
      final u = readingFor(upright(0.5), LevelMode.upright, cal);
      expect(u.angle, closeTo(0, 1e-6));
      expect(readingFor(upright(2), LevelMode.upright, LevelCalibration.zero).displayAngle, 2.0);
    });
  });

  test('LevelLatch fires once on entering level', () {
    final latch = LevelLatch();
    expect(latch.update(2), isFalse);
    expect(latch.update(0.4), isTrue);
    expect(latch.update(0.3), isFalse);
    expect(latch.update(0.7), isFalse); // still level (hysteresis)
    expect(latch.isLevel, isTrue);
    expect(latch.update(1.0), isFalse);
    expect(latch.isLevel, isFalse);
    expect(latch.update(0.5), isTrue);
  });

  test('bubbleOffset is signed, monotonic and clamped', () {
    expect(bubbleOffset(0), 0);
    expect(bubbleOffset(15), 1);
    expect(bubbleOffset(40), 1);
    expect(bubbleOffset(-15), -1);
    expect(bubbleOffset(1) < bubbleOffset(2), isTrue);
  });
  widgetTests();
}

Future<void> pumpTool(WidgetTester tester, Widget screen) async {
  SharedPreferences.setMockInitialValues({});
  final storage = StorageService(await SharedPreferences.getInstance());
  await tester.pumpWidget(
    ProviderScope(
      overrides: [storageServiceProvider.overrideWithValue(storage)],
      child: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: screen,
      ),
    ),
  );
  await tester.pump();
}

void widgetTests() {
  testWidgets('level screen copes with a missing sensor', (tester) async {
    await pumpTool(tester, const BubbleLevelScreen());
    await tester.pump(const Duration(seconds: 4));
    expect(find.textContaining('no motion sensor'), findsOneWidget);
  });
}
