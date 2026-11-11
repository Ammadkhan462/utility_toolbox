import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utility_toolbox/features/stopwatch/stopwatch_logic.dart';

// Deliberately not autoDispose: the models are just timestamps, so keeping
// them for the app session lets a running stopwatch or timer carry on (and
// show the right time) after the user pops the screen and comes back.

final stopwatchProvider = StateProvider<StopwatchModel>((_) => StopwatchModel.initial);

final countdownProvider = StateProvider<CountdownModel>((_) => CountdownModel.initial);

/// Last custom length picked, so the picker reopens where the user left it.
final lastCustomTimerProvider = StateProvider<Duration>((_) => const Duration(minutes: 5));
