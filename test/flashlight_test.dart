import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:utility_toolbox/core/services/storage_service.dart';
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:utility_toolbox/features/flashlight/flashlight_screen.dart';
import 'package:utility_toolbox/features/flashlight/flashlight_logic.dart';

void main() {
  group('SOS pattern', () {
    final steps = sosPattern(unitMs: 100);

    test('is ··· ––– ··· with Morse spacing', () {
      final on = [
        for (final s in steps)
          if (s.on) s.ms,
      ];
      expect(on, [100, 100, 100, 300, 300, 300, 100, 100, 100]);
      final off = [
        for (final s in steps)
          if (!s.on) s.ms,
      ];
      // Gaps inside letters are 1 unit, between letters 3, after the word 7.
      expect(off, [100, 100, 300, 100, 100, 300, 100, 100, 700]);
    });

    test('alternates on/off and lasts 34 units', () {
      for (var i = 0; i < steps.length; i++) {
        expect(steps[i].on, i.isEven);
      }
      expect(steps.fold<int>(0, (t, s) => t + s.ms), 34 * 100);
    });
  });

  group('strobe', () {
    test('square wave at the requested rate', () {
      expect(strobePattern(5), const [LightStep(true, 100), LightStep(false, 100)]);
      expect(strobePattern(1), const [LightStep(true, 500), LightStep(false, 500)]);
    });

    test('clamps the LED to 1–10 Hz', () {
      expect(clampStrobeHz(50, screen: false), strobeMaxHz);
      expect(clampStrobeHz(0, screen: false), strobeMinHz);
    });

    test('caps the screen light at a photosensitivity-safe 3 Hz', () {
      expect(clampStrobeHz(10, screen: true), screenStrobeMaxHz);
      expect(strobePattern(10, screen: true).first.ms, 167);
    });
  });

  test('steady is a single endless on step', () {
    expect(patternFor(FlashMode.steady), const [LightStep(true, 0)]);
    expect(patternFor(FlashMode.sos).length, 18);
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
  testWidgets('no flash: power button opens the screen light', (tester) async {
    await pumpTool(tester, const FlashlightScreen());
    await tester.pump();
    expect(find.text('Light is off'), findsOneWidget);
    await tester.tap(find.text('Strobe'));
    await tester.pump();
    await tester.tap(find.bySemanticsLabel('Turn the light on'));
    await tester.pump();
    expect(find.text('Tap anywhere to turn off'), findsOneWidget);
    await tester.pump(const Duration(seconds: 1));
    await tester.tapAt(const Offset(200, 200));
    await tester.pump();
    expect(find.text('Light is off'), findsOneWidget);
  });
}
