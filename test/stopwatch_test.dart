import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:utility_toolbox/core/services/storage_service.dart';
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:utility_toolbox/features/stopwatch/stopwatch_screen.dart';
import 'package:utility_toolbox/features/stopwatch/stopwatch_logic.dart';

void main() {
  final t0 = DateTime(2026, 1, 1, 12);
  DateTime at(int ms) => t0.add(Duration(milliseconds: ms));

  group('formatting', () {
    test('stopwatch shows centiseconds and truncates', () {
      expect(formatStopwatch(Duration.zero), '00:00.00');
      expect(formatStopwatch(const Duration(milliseconds: 61239)), '01:01.23');
      expect(formatStopwatch(const Duration(hours: 1, minutes: 2, seconds: 3, milliseconds: 456)), '1:02:03.45');
      expect(formatStopwatch(const Duration(milliseconds: -5)), '00:00.00');
    });

    test('countdown rounds up to whole seconds', () {
      expect(formatCountdown(const Duration(milliseconds: 1)), '00:01');
      expect(formatCountdown(const Duration(seconds: 59, milliseconds: 1)), '01:00');
      expect(formatCountdown(const Duration(minutes: 5)), '05:00');
      expect(formatCountdown(const Duration(hours: 2, seconds: 5)), '2:00:05');
      expect(formatCountdown(Duration.zero), '00:00');
    });
  });

  group('StopwatchModel', () {
    test('counts wall-clock time across pause and resume', () {
      var m = StopwatchModel.initial.start(at(0));
      expect(m.elapsed(at(1500)), const Duration(milliseconds: 1500));
      m = m.pause(at(2000));
      expect(m.isRunning, isFalse);
      expect(m.elapsed(at(9000)), const Duration(seconds: 2));
      m = m.start(at(10000));
      expect(m.elapsed(at(10500)), const Duration(milliseconds: 2500));
    });

    test('laps record split and lap time; best/worst need two different laps', () {
      var m = StopwatchModel.initial.start(at(0));
      m = m.lap(at(1000));
      expect(bestAndWorst(m.laps), isNull);
      m = m.lap(at(3000));
      m = m.lap(at(3500));
      final laps = m.laps;
      expect([for (final l in laps) l.lap.inMilliseconds], [1000, 2000, 500]);
      expect([for (final l in laps) l.split.inMilliseconds], [1000, 3000, 3500]);
      expect(bestAndWorst(laps), (best: 3, worst: 2));
      expect(m.currentLap(at(4000)), const Duration(milliseconds: 500));
    });

    test('lap is ignored while paused; pristine after reset', () {
      final m = StopwatchModel.initial.start(at(0)).pause(at(100));
      expect(m.lap(at(200)).splits, isEmpty);
      expect(StopwatchModel.initial.isPristine, isTrue);
      expect(m.isPristine, isFalse);
    });
  });

  group('CountdownModel', () {
    test('runs down by wall clock and finishes', () {
      final c = CountdownModel.start(const Duration(seconds: 10), at(0));
      expect(c.status(at(0)), CountdownStatus.running);
      expect(c.remaining(at(4000)), const Duration(seconds: 6));
      expect(c.progress(at(5000)), closeTo(0.5, 1e-9));
      expect(c.status(at(10000)), CountdownStatus.finished);
      expect(c.remaining(at(20000)), Duration.zero);
    });

    test('pause freezes the remaining time; resume continues', () {
      var c = CountdownModel.start(const Duration(seconds: 10), at(0)).pause(at(3000));
      expect(c.status(at(60000)), CountdownStatus.paused);
      expect(c.remaining(at(60000)), const Duration(seconds: 7));
      c = c.resume(at(60000));
      expect(c.remaining(at(62000)), const Duration(seconds: 5));
    });

    test('+1 min extends running, paused and finished timers', () {
      final running = CountdownModel.start(
        const Duration(seconds: 30),
        at(0),
      ).add(const Duration(minutes: 1), at(10000));
      expect(running.remaining(at(10000)), const Duration(seconds: 80));
      expect(running.total, const Duration(seconds: 90));

      final paused = CountdownModel.start(
        const Duration(seconds: 30),
        at(0),
      ).pause(at(10000)).add(const Duration(minutes: 1), at(10000));
      expect(paused.remaining(at(99999)), const Duration(seconds: 80));

      final done = CountdownModel.start(
        const Duration(seconds: 1),
        at(0),
      ).markFinished().add(const Duration(minutes: 1), at(5000));
      expect(done.status(at(5000)), CountdownStatus.running);
      expect(done.remaining(at(5000)), const Duration(minutes: 1));
    });

    test('zero length does not start; length is capped', () {
      expect(CountdownModel.start(Duration.zero, at(0)).status(at(0)), CountdownStatus.idle);
      expect(CountdownModel.start(const Duration(hours: 99), at(0)).total, CountdownModel.maxTotal);
    });
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
  testWidgets('stopwatch and timer screen builds and reacts', (tester) async {
    await pumpTool(tester, const StopwatchScreen());
    await tester.tap(find.text('Start'));
    await tester.pump(const Duration(milliseconds: 100));
    await tester.tap(find.text('Lap'));
    await tester.pump(const Duration(milliseconds: 100));
    expect(find.text('Lap 1'), findsOneWidget);
    await tester.tap(find.text('Pause'));
    await tester.pump();
    await tester.tap(find.text('Reset'));
    await tester.pump();
    await tester.tap(find.text('Timer'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('5 min'));
    await tester.pump(const Duration(milliseconds: 100));
    expect(find.text('+1 min'), findsOneWidget);
    await tester.tap(find.text('Cancel'));
    await tester.pump();
    expect(find.text('Quick start'), findsOneWidget);
  });
}
