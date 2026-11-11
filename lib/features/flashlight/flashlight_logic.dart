/// Pure timing logic for the flashlight (no Flutter imports, unit tested).
library;

enum FlashMode { steady, sos, strobe }

/// One segment of a blink pattern: light [on] or off for [ms] milliseconds.
class LightStep {
  const LightStep(this.on, this.ms);

  final bool on;
  final int ms;

  @override
  bool operator ==(Object other) => other is LightStep && other.on == on && other.ms == ms;

  @override
  int get hashCode => Object.hash(on, ms);

  @override
  String toString() => '${on ? 'on' : 'off'}($ms)';
}

/// Default Morse unit. 200 ms keeps SOS readable from a distance.
const sosUnitMs = 200;

/// International Morse "SOS" (··· ––– ···) followed by a word gap, ready to
/// loop: dot = 1 unit, dash = 3, gap inside a letter = 1, between letters = 3,
/// after the word = 7.
List<LightStep> sosPattern({int unitMs = sosUnitMs}) {
  const letters = [
    [1, 1, 1], // S
    [3, 3, 3], // O
    [1, 1, 1], // S
  ];
  final steps = <LightStep>[];
  for (var l = 0; l < letters.length; l++) {
    final symbols = letters[l];
    for (var s = 0; s < symbols.length; s++) {
      steps.add(LightStep(true, symbols[s] * unitMs));
      final lastSymbol = s == symbols.length - 1;
      final lastLetter = l == letters.length - 1;
      final gapUnits = !lastSymbol ? 1 : (lastLetter ? 7 : 3);
      steps.add(LightStep(false, gapUnits * unitMs));
    }
  }
  return steps;
}

/// Strobe speed limits in flashes per second.
const strobeMinHz = 1.0;
const strobeMaxHz = 10.0;

/// Full-screen flashing faster than 3 Hz can trigger photosensitive seizures
/// (WCAG 2.3.1), so the screen light is capped lower than the LED.
const screenStrobeMaxHz = 3.0;

double clampStrobeHz(double hz, {required bool screen}) =>
    hz.clamp(strobeMinHz, screen ? screenStrobeMaxHz : strobeMaxHz).toDouble();

/// A square wave at [hz]: on for half the period, off for the other half.
List<LightStep> strobePattern(double hz, {bool screen = false}) {
  final f = clampStrobeHz(hz, screen: screen);
  final half = (500 / f).round();
  return [LightStep(true, half), LightStep(false, half)];
}

/// The looping pattern for [mode]; steady is a single, endless "on".
List<LightStep> patternFor(FlashMode mode, {double strobeHz = 4, bool screen = false}) => switch (mode) {
  FlashMode.steady => const [LightStep(true, 0)],
  FlashMode.sos => sosPattern(),
  FlashMode.strobe => strobePattern(strobeHz, screen: screen),
};
