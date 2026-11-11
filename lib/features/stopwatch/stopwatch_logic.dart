/// Pure stopwatch / countdown models (no Flutter imports, unit tested).
///
/// Everything is anchored to wall-clock timestamps passed in as `now`, never
/// to counted frames, so the numbers stay right when frames drop, the screen
/// is left and reopened, or the phone sleeps.
library;

String _two(int n) => n.toString().padLeft(2, '0');

/// `mm:ss.cc`, or `h:mm:ss.cc` from one hour. Truncates (a stopwatch never
/// shows time that hasn't passed yet).
String formatStopwatch(Duration d) {
  if (d.isNegative) d = Duration.zero;
  final cs = (d.inMilliseconds ~/ 10) % 100;
  final s = d.inSeconds % 60;
  final m = d.inMinutes % 60;
  final h = d.inHours;
  final base = '${_two(m)}:${_two(s)}.${_two(cs)}';
  return h > 0 ? '$h:$base' : base;
}

/// `mm:ss`, or `h:mm:ss` from one hour. Rounds *up* to the next second, so a
/// countdown shows 00:01 until it really hits zero.
String formatCountdown(Duration d) {
  if (d.isNegative) d = Duration.zero;
  final totalSeconds = (d.inMicroseconds + 999999) ~/ 1000000;
  final s = totalSeconds % 60;
  final m = (totalSeconds ~/ 60) % 60;
  final h = totalSeconds ~/ 3600;
  return h > 0 ? '$h:${_two(m)}:${_two(s)}' : '${_two(m)}:${_two(s)}';
}

class LapEntry {
  const LapEntry({required this.number, required this.lap, required this.split});

  /// 1-based.
  final int number;

  /// Time of this lap alone.
  final Duration lap;

  /// Total time when the lap was recorded.
  final Duration split;
}

class StopwatchModel {
  const StopwatchModel({this.startedAt, this.accumulated = Duration.zero, this.splits = const []});

  /// Set while running: the moment the current run segment began.
  final DateTime? startedAt;

  /// Time banked by earlier run segments (before the last pause).
  final Duration accumulated;

  /// Total elapsed time at each lap press, oldest first.
  final List<Duration> splits;

  static const initial = StopwatchModel();

  bool get isRunning => startedAt != null;

  bool get isPristine => !isRunning && accumulated == Duration.zero && splits.isEmpty;

  Duration elapsed(DateTime now) {
    final s = startedAt;
    if (s == null) return accumulated;
    final run = now.difference(s);
    return accumulated + (run.isNegative ? Duration.zero : run);
  }

  StopwatchModel start(DateTime now) =>
      isRunning ? this : StopwatchModel(startedAt: now, accumulated: accumulated, splits: splits);

  StopwatchModel pause(DateTime now) => isRunning ? StopwatchModel(accumulated: elapsed(now), splits: splits) : this;

  StopwatchModel lap(DateTime now) => isRunning
      ? StopwatchModel(startedAt: startedAt, accumulated: accumulated, splits: [...splits, elapsed(now)])
      : this;

  /// Time since the last lap (or since the start).
  Duration currentLap(DateTime now) => elapsed(now) - (splits.isEmpty ? Duration.zero : splits.last);

  List<LapEntry> get laps => [
    for (var i = 0; i < splits.length; i++)
      LapEntry(number: i + 1, lap: splits[i] - (i == 0 ? Duration.zero : splits[i - 1]), split: splits[i]),
  ];
}

/// Lap numbers of the fastest and slowest laps; null until there are two
/// laps that differ (one lap can't be "best" or "worst").
({int best, int worst})? bestAndWorst(List<LapEntry> laps) {
  if (laps.length < 2) return null;
  var best = laps.first, worst = laps.first;
  for (final l in laps) {
    if (l.lap < best.lap) best = l;
    if (l.lap > worst.lap) worst = l;
  }
  if (best.lap == worst.lap) return null;
  return (best: best.number, worst: worst.number);
}

enum CountdownStatus { idle, running, paused, finished }

class CountdownModel {
  const CountdownModel({this.total = Duration.zero, this.endsAt, this.pausedRemaining, this.finished = false});

  /// Length of the countdown (grows with +1 min), for the progress ring.
  final Duration total;

  /// Set while running.
  final DateTime? endsAt;

  /// Set while paused.
  final Duration? pausedRemaining;

  final bool finished;

  static const initial = CountdownModel();

  /// Longest countdown the picker allows.
  static const maxTotal = Duration(hours: 23, minutes: 59, seconds: 59);

  CountdownStatus status(DateTime now) {
    if (finished) return CountdownStatus.finished;
    final e = endsAt;
    if (e != null) return now.isBefore(e) ? CountdownStatus.running : CountdownStatus.finished;
    if (pausedRemaining != null) return CountdownStatus.paused;
    return CountdownStatus.idle;
  }

  Duration remaining(DateTime now) {
    if (finished) return Duration.zero;
    final e = endsAt;
    if (e != null) {
      final r = e.difference(now);
      return r.isNegative ? Duration.zero : r;
    }
    return pausedRemaining ?? total;
  }

  /// Fraction of time left, 1 → 0.
  double progress(DateTime now) {
    if (total <= Duration.zero) return 0;
    return (remaining(now).inMicroseconds / total.inMicroseconds).clamp(0.0, 1.0);
  }

  static CountdownModel start(Duration length, DateTime now) {
    if (length <= Duration.zero) return initial;
    final l = length > maxTotal ? maxTotal : length;
    return CountdownModel(total: l, endsAt: now.add(l));
  }

  CountdownModel pause(DateTime now) =>
      status(now) == CountdownStatus.running ? CountdownModel(total: total, pausedRemaining: remaining(now)) : this;

  CountdownModel resume(DateTime now) {
    final r = pausedRemaining;
    if (r == null || finished) return this;
    return CountdownModel(total: total, endsAt: now.add(r));
  }

  /// Adds time to a running, paused or just-finished countdown.
  CountdownModel add(Duration extra, DateTime now) {
    switch (status(now)) {
      case CountdownStatus.running:
        return CountdownModel(total: total + extra, endsAt: endsAt!.add(extra));
      case CountdownStatus.paused:
        return CountdownModel(total: total + extra, pausedRemaining: pausedRemaining! + extra);
      case CountdownStatus.finished:
        return CountdownModel(total: extra, endsAt: now.add(extra));
      case CountdownStatus.idle:
        return this;
    }
  }

  CountdownModel markFinished() => CountdownModel(total: total, finished: true);
}
