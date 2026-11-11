import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/features/stopwatch/stopwatch_logic.dart';
import 'package:utility_toolbox/features/stopwatch/stopwatch_providers.dart';
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';

/// Lap stopwatch + countdown timer. Times come from wall-clock timestamps
/// (see stopwatch_logic.dart); a [Ticker] only redraws them while running.
class StopwatchScreen extends ConsumerStatefulWidget {
  const StopwatchScreen({super.key});

  @override
  ConsumerState<StopwatchScreen> createState() => _StopwatchScreenState();
}

const _accent = Color(0xFF1E7FE0);
const _bestColor = Color(0xFF1FA85A);
const _worstColor = Color(0xFFE5484D);
const _tabular = [FontFeature.tabularFigures()];

class _StopwatchScreenState extends ConsumerState<StopwatchScreen> with TickerProviderStateMixin {
  late final TabController _tabs;
  late final Ticker _ticker;
  final _now = ValueNotifier<DateTime>(DateTime.now());
  Timer? _buzz;
  bool _alertOpen = false;

  @override
  void initState() {
    super.initState();
    final cd = ref.read(countdownProvider);
    final now = DateTime.now();
    // A countdown that ran out while the screen was closed: show it as
    // finished, without an alarm for something that ended long ago.
    if (!cd.finished && cd.endsAt != null && cd.status(now) == CountdownStatus.finished) {
      Future.microtask(() => ref.read(countdownProvider.notifier).state = cd.markFinished());
    }
    final timerActive = cd.status(now) != CountdownStatus.idle;
    final swActive = !ref.read(stopwatchProvider).isPristine;
    _tabs = TabController(length: 2, vsync: this, initialIndex: timerActive && !swActive ? 1 : 0);
    _ticker = createTicker(_onTick);
    WidgetsBinding.instance.addPostFrameCallback((_) => _syncTicker());
  }

  @override
  void dispose() {
    _buzz?.cancel();
    _ticker.dispose();
    _tabs.dispose();
    _now.dispose();
    super.dispose();
  }

  void _onTick(Duration _) {
    final now = DateTime.now();
    _now.value = now;
    final cd = ref.read(countdownProvider);
    if (!cd.finished && cd.endsAt != null && !now.isBefore(cd.endsAt!)) {
      ref.read(countdownProvider.notifier).state = cd.markFinished();
      _syncTicker();
      _onCountdownFinished(cd.total);
    }
  }

  /// Runs the ticker only while something is running (saves battery).
  void _syncTicker() {
    if (!mounted) return;
    final now = DateTime.now();
    _now.value = now;
    final need =
        ref.read(stopwatchProvider).isRunning || ref.read(countdownProvider).status(now) == CountdownStatus.running;
    if (need && !_ticker.isActive) _ticker.start();
    if (!need && _ticker.isActive) _ticker.stop();
  }

  // ── Stopwatch actions ───────────────────────────────────────────────────

  void _swUpdate(StopwatchModel Function(StopwatchModel m, DateTime now) f) {
    HapticFeedback.selectionClick();
    final n = ref.read(stopwatchProvider.notifier);
    n.state = f(n.state, DateTime.now());
    _syncTicker();
  }

  // ── Countdown actions ───────────────────────────────────────────────────

  void _cdUpdate(CountdownModel Function(CountdownModel m, DateTime now) f) {
    HapticFeedback.selectionClick();
    final n = ref.read(countdownProvider.notifier);
    n.state = f(n.state, DateTime.now());
    _syncTicker();
  }

  void _startCountdown(Duration d) => _cdUpdate((_, now) => CountdownModel.start(d, now));

  Future<void> _pickCustom() async {
    final l = AppLocalizations.of(context);
    final picked = await showModalBottomSheet<Duration>(
      context: context,
      showDragHandle: true,
      builder: (ctx) => _DurationPickerSheet(initial: ref.read(lastCustomTimerProvider), l: l),
    );
    if (picked == null || picked <= Duration.zero || !mounted) return;
    ref.read(lastCustomTimerProvider.notifier).state = picked;
    _startCountdown(picked);
  }

  Future<void> _onCountdownFinished(Duration total) async {
    if (_alertOpen || !mounted) return;
    _alertOpen = true;
    // Haptic "ring" until the dialog is closed (max ~30 s).
    var count = 0;
    HapticFeedback.vibrate();
    _buzz?.cancel();
    _buzz = Timer.periodic(const Duration(milliseconds: 600), (t) {
      count++;
      if (count >= 50) t.cancel();
      count.isEven ? HapticFeedback.vibrate() : HapticFeedback.heavyImpact();
    });
    final l = AppLocalizations.of(context);
    final addMinute = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        icon: const Icon(Icons.alarm_on_rounded, size: 40, color: _accent),
        title: Text(l.stopwatchTimerTimesUp),
        content: Text(l.stopwatchTimerFinishedBody(formatCountdown(total))),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, true), child: Text(l.stopwatchTimerAddMinute)),
          FilledButton(onPressed: () => Navigator.pop(ctx, false), child: Text(l.stopwatchTimerDone)),
        ],
      ),
    );
    _buzz?.cancel();
    _buzz = null;
    _alertOpen = false;
    if (!mounted) return;
    if (addMinute == true) _cdUpdate((m, now) => m.add(const Duration(minutes: 1), now));
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return ToolScaffold(
      title: l.toolStopwatchTitle,
      accentColor: _accent,
      body: Column(
        children: [
          TabBar(
            controller: _tabs,
            tabs: [
              Tab(icon: const Icon(Icons.timer_outlined), text: l.stopwatchTabStopwatch),
              Tab(icon: const Icon(Icons.hourglass_bottom_rounded), text: l.stopwatchTabTimer),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabs,
              children: [
                _StopwatchTab(now: _now, onUpdate: _swUpdate),
                _TimerTab(now: _now, onUpdate: _cdUpdate, onStart: _startCountdown, onCustom: _pickCustom),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Stopwatch tab ─────────────────────────────────────────────────────────

class _StopwatchTab extends ConsumerWidget {
  const _StopwatchTab({required this.now, required this.onUpdate});

  final ValueNotifier<DateTime> now;
  final void Function(StopwatchModel Function(StopwatchModel m, DateTime now)) onUpdate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final sw = ref.watch(stopwatchProvider);
    final laps = sw.laps.reversed.toList();
    final marks = bestAndWorst(sw.laps);

    return Column(
      children: [
        const SizedBox(height: 28),
        ValueListenableBuilder<DateTime>(
          valueListenable: now,
          builder: (context, t, _) {
            final display = formatStopwatch(sw.elapsed(t));
            return Semantics(
              label: display,
              child: Padding(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    display,
                    textDirection: TextDirection.ltr,
                    style: theme.textTheme.displayLarge?.copyWith(fontWeight: FontWeight.w700, fontFeatures: _tabular),
                  ),
                ),
              ),
            );
          },
        ),
        SizedBox(
          height: 28,
          child: sw.splits.isEmpty
              ? null
              : ValueListenableBuilder<DateTime>(
                  valueListenable: now,
                  builder: (context, t, _) => Text(
                    l.stopwatchCurrentLap(sw.splits.length + 1, formatStopwatch(sw.currentLap(t))),
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                      fontFeatures: _tabular,
                    ),
                  ),
                ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (sw.isRunning)
                _RoundButton(icon: Icons.flag_rounded, label: l.stopwatchLap, onTap: () => onUpdate((m, t) => m.lap(t)))
              else
                _RoundButton(
                  icon: Icons.restart_alt_rounded,
                  label: l.stopwatchReset,
                  onTap: sw.isPristine ? null : () => onUpdate((_, _) => StopwatchModel.initial),
                ),
              _RoundButton(
                icon: sw.isRunning ? Icons.pause_rounded : Icons.play_arrow_rounded,
                label: sw.isRunning ? l.stopwatchPause : (sw.isPristine ? l.stopwatchStart : l.stopwatchResume),
                primary: true,
                onTap: () => onUpdate((m, t) => m.isRunning ? m.pause(t) : m.start(t)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Divider(height: 1),
        Expanded(
          child: laps.isEmpty
              ? Center(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.all(24),
                    child: Text(
                      l.stopwatchNoLaps,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                    ),
                  ),
                )
              : ListView.separated(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 16),
                  itemCount: laps.length,
                  separatorBuilder: (_, _) => const Divider(height: 1),
                  itemBuilder: (context, i) {
                    final lap = laps[i];
                    final isBest = marks?.best == lap.number;
                    final isWorst = marks?.worst == lap.number;
                    final color = isBest ? _bestColor : (isWorst ? _worstColor : null);
                    return _LapRow(
                      title: l.stopwatchLapNumber(lap.number),
                      badge: isBest ? l.stopwatchBest : (isWorst ? l.stopwatchWorst : null),
                      lap: formatStopwatch(lap.lap),
                      split: formatStopwatch(lap.split),
                      color: color,
                    );
                  },
                ),
        ),
      ],
    );
  }
}

class _LapRow extends StatelessWidget {
  const _LapRow({required this.title, required this.lap, required this.split, this.badge, this.color});

  final String title, lap, split;
  final String? badge;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final c = color ?? theme.colorScheme.onSurface;
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Wrap(
              spacing: 8,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(color: c, fontWeight: FontWeight.w600),
                ),
                if (badge != null)
                  Container(
                    padding: const EdgeInsetsDirectional.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: c.withValues(alpha: 0.14),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      badge!,
                      style: TextStyle(color: c, fontWeight: FontWeight.w700, fontSize: 12),
                    ),
                  ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                lap,
                textDirection: TextDirection.ltr,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: c,
                  fontFeatures: _tabular,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                split,
                textDirection: TextDirection.ltr,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                  fontFeatures: _tabular,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Timer tab ─────────────────────────────────────────────────────────────

class _TimerTab extends ConsumerWidget {
  const _TimerTab({required this.now, required this.onUpdate, required this.onStart, required this.onCustom});

  final ValueNotifier<DateTime> now;
  final void Function(CountdownModel Function(CountdownModel m, DateTime now)) onUpdate;
  final void Function(Duration) onStart;
  final VoidCallback onCustom;

  static const _presets = [1, 3, 5, 10, 15, 30];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final cd = ref.watch(countdownProvider);
    final status = cd.status(DateTime.now());

    if (status == CountdownStatus.idle) {
      return ListView(
        padding: const EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
        children: [
          Text(l.stopwatchTimerQuickStart, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
          const SizedBox(height: 12),
          LayoutBuilder(
            builder: (context, c) {
              final cols = c.maxWidth > 420 ? 3 : 2;
              const gap = 12.0;
              final w = (c.maxWidth - gap * (cols - 1)) / cols;
              return Wrap(
                spacing: gap,
                runSpacing: gap,
                children: [
                  for (final m in _presets)
                    SizedBox(
                      width: w,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(minimumSize: const Size.fromHeight(64)),
                        onPressed: () => onStart(Duration(minutes: m)),
                        child: Text(l.stopwatchTimerMinutes(m), style: const TextStyle(fontSize: 18)),
                      ),
                    ),
                ],
              );
            },
          ),
          const SizedBox(height: 16),
          FilledButton.icon(
            style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(56)),
            onPressed: onCustom,
            icon: const Icon(Icons.edit_rounded),
            label: Text(l.stopwatchTimerCustom),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Icon(Icons.info_outline_rounded, size: 20, color: theme.colorScheme.onSurfaceVariant),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  l.stopwatchTimerKeepOpen,
                  style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                ),
              ),
            ],
          ),
        ],
      );
    }

    final finished = status == CountdownStatus.finished;
    final paused = status == CountdownStatus.paused;
    return LayoutBuilder(
      builder: (context, c) {
        final ring = math.min(c.maxWidth - 48, c.maxHeight * 0.55).clamp(160.0, 320.0);
        return SingleChildScrollView(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
          child: Column(
            children: [
              SizedBox.square(
                dimension: ring,
                child: ValueListenableBuilder<DateTime>(
                  valueListenable: now,
                  builder: (context, t, _) {
                    final remaining = formatCountdown(cd.remaining(t));
                    return Semantics(
                      label: finished ? l.stopwatchTimerTimesUp : l.stopwatchTimerRemaining(remaining),
                      excludeSemantics: true,
                      child: CustomPaint(
                        painter: _RingPainter(
                          progress: cd.progress(t),
                          color: finished ? _worstColor : _accent,
                          track: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(ring * 0.14),
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    remaining,
                                    textDirection: TextDirection.ltr,
                                    style: theme.textTheme.displayMedium?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontFeatures: _tabular,
                                      color: finished ? _worstColor : null,
                                    ),
                                  ),
                                  if (finished)
                                    Text(
                                      l.stopwatchTimerTimesUp,
                                      style: theme.textTheme.titleMedium?.copyWith(
                                        color: _worstColor,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )
                                  else if (paused)
                                    Text(
                                      l.stopwatchTimerPaused,
                                      style: theme.textTheme.titleMedium?.copyWith(
                                        color: theme.colorScheme.onSurfaceVariant,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _RoundButton(
                    icon: Icons.close_rounded,
                    label: finished ? l.stopwatchTimerDone : l.commonCancel,
                    onTap: () => onUpdate((_, _) => CountdownModel.initial),
                  ),
                  if (finished)
                    _RoundButton(
                      icon: Icons.replay_rounded,
                      label: l.stopwatchTimerRestart,
                      primary: true,
                      onTap: () => onUpdate((m, t) => CountdownModel.start(m.total, t)),
                    )
                  else
                    _RoundButton(
                      icon: paused ? Icons.play_arrow_rounded : Icons.pause_rounded,
                      label: paused ? l.stopwatchResume : l.stopwatchPause,
                      primary: true,
                      onTap: () => onUpdate((m, t) => paused ? m.resume(t) : m.pause(t)),
                    ),
                  _RoundButton(
                    icon: Icons.more_time_rounded,
                    label: l.stopwatchTimerAddMinute,
                    onTap: () => onUpdate((m, t) => m.add(const Duration(minutes: 1), t)),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _RingPainter extends CustomPainter {
  _RingPainter({required this.progress, required this.color, required this.track});

  final double progress;
  final Color color, track;

  @override
  void paint(Canvas canvas, Size size) {
    const stroke = 14.0;
    final rect = (Offset.zero & size).deflate(stroke / 2);
    canvas.drawArc(
      rect,
      0,
      math.pi * 2,
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = stroke
        ..color = track,
    );
    if (progress <= 0) return;
    canvas.drawArc(
      rect,
      -math.pi / 2,
      math.pi * 2 * progress,
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = stroke
        ..strokeCap = StrokeCap.round
        ..color = color,
    );
  }

  @override
  bool shouldRepaint(_RingPainter old) => old.progress != progress || old.color != color || old.track != track;
}

/// Big circular action button with a text label under it (≥ 72 dp target).
class _RoundButton extends StatelessWidget {
  const _RoundButton({required this.icon, required this.label, required this.onTap, this.primary = false});

  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final bool primary;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final enabled = onTap != null;
    final size = primary ? 84.0 : 72.0;
    final bg = primary ? _accent : scheme.surfaceContainerHighest;
    final fg = primary ? Colors.white : scheme.onSurface;
    return Semantics(
      button: true,
      enabled: enabled,
      label: label,
      excludeSemantics: true,
      child: Opacity(
        opacity: enabled ? 1 : 0.4,
        // The label is tappable too: a bigger target for unsure fingers.
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Material(
                color: bg,
                shape: const CircleBorder(),
                elevation: primary ? 4 : 0,
                shadowColor: _accent.withValues(alpha: 0.4),
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: onTap,
                  child: SizedBox.square(
                    dimension: size,
                    child: Icon(icon, size: size * 0.45, color: fg),
                  ),
                ),
              ),
              const SizedBox(height: 6),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 110),
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DurationPickerSheet extends StatefulWidget {
  const _DurationPickerSheet({required this.initial, required this.l});

  final Duration initial;
  final AppLocalizations l;

  @override
  State<_DurationPickerSheet> createState() => _DurationPickerSheetState();
}

class _DurationPickerSheetState extends State<_DurationPickerSheet> {
  late int _h = widget.initial.inHours.clamp(0, 23);
  late int _m = widget.initial.inMinutes % 60;
  late int _s = widget.initial.inSeconds % 60;

  late final _hc = FixedExtentScrollController(initialItem: _h);
  late final _mc = FixedExtentScrollController(initialItem: _m);
  late final _sc = FixedExtentScrollController(initialItem: _s);

  @override
  void dispose() {
    _hc.dispose();
    _mc.dispose();
    _sc.dispose();
    super.dispose();
  }

  Duration get _value => Duration(hours: _h, minutes: _m, seconds: _s);

  Widget _wheel(FixedExtentScrollController c, int count, String unit, ValueChanged<int> onChanged) {
    final theme = Theme.of(context);
    return Expanded(
      child: Column(
        children: [
          Text(unit, style: theme.textTheme.labelLarge?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
          SizedBox(
            height: 180,
            child: CupertinoPicker(
              scrollController: c,
              itemExtent: 48,
              looping: true,
              selectionOverlay: CupertinoPickerDefaultSelectionOverlay(background: _accent.withValues(alpha: 0.12)),
              onSelectedItemChanged: (i) {
                HapticFeedback.selectionClick();
                setState(() => onChanged(i));
              },
              children: [
                for (var i = 0; i < count; i++)
                  Center(
                    child: Text(
                      i.toString().padLeft(2, '0'),
                      style: theme.textTheme.headlineSmall?.copyWith(fontFeatures: _tabular),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = widget.l;
    final theme = Theme.of(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              l.stopwatchTimerPickTitle,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 12),
            // Hours, minutes, seconds always read left to right.
            Directionality(
              textDirection: TextDirection.ltr,
              child: Row(
                children: [
                  _wheel(_hc, 24, l.stopwatchTimerHours, (v) => _h = v),
                  _wheel(_mc, 60, l.stopwatchTimerMinutesUnit, (v) => _m = v),
                  _wheel(_sc, 60, l.stopwatchTimerSeconds, (v) => _s = v),
                ],
              ),
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              style: FilledButton.styleFrom(
                backgroundColor: _accent,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(56),
              ),
              onPressed: _value > Duration.zero ? () => Navigator.pop(context, _value) : null,
              icon: const Icon(Icons.play_arrow_rounded),
              label: Text(l.stopwatchStart),
            ),
          ],
        ),
      ),
    );
  }
}
