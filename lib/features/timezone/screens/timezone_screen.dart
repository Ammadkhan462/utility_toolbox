import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utility_toolbox/core/theme/app_colors.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import '../providers/timezone_providers.dart';

class TimezoneScreen extends ConsumerWidget {
  const TimezoneScreen({super.key});

  static final _accent = AppColors.toolAccent('timezone');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(clockTickProvider); // refresh every second
    final pinned    = ref.watch(pinnedCityDataProvider);
    final filtered  = ref.watch(filteredCitiesProvider);
    final search    = ref.read(tzSearchProvider.notifier);
    final theme     = Theme.of(context);

    return ToolScaffold(
      title: 'World Clock',
      accentColor: _accent,
      body: Column(
        children: [
          // ── Search bar ────────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search city or country…',
                prefixIcon: Icon(Icons.search_rounded),
              ),
              onChanged: (v) => search.state = v,
            ),
          ),

          Expanded(
            child: CustomScrollView(
              slivers: [
                // ── Pinned clocks ─────────────────────────────────────────
                if (pinned.isNotEmpty && ref.watch(tzSearchProvider).isEmpty) ...[
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Pinned',
                            style: theme.textTheme.labelLarge?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.widgets_outlined,
                            size: 14,
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'On widget: ${_WidgetCapacityLabel.text(pinned.length)}',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (pinned.length > kWidgetDefaultRows)
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                        child: Text(
                          'Home-screen widget shows the first $kWidgetDefaultRows '
                          'by default — drag its bottom edge taller to reveal '
                          'up to $kWidgetMaxRows.',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (_, i) => _PinnedClock(city: pinned[i], accent: _accent),
                      childCount: pinned.length,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                      child: Text(
                        'All Cities',
                        style: theme.textTheme.labelLarge?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ),
                ],

                // ── All / filtered cities ────────────────────────────────
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (_, i) => _CityRow(city: filtered[i], accent: _accent),
                    childCount: filtered.length,
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 20)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Widget capacity label helper ────────────────────────────────────────────

/// Small helper that turns "how many cities are pinned" into a short label
/// describing how many of them the home-screen widget will actually show,
/// so this is visible in-app instead of being a surprise on the home screen.
class _WidgetCapacityLabel {
  static String text(int pinnedCount) {
    if (pinnedCount <= kWidgetDefaultRows) {
      return '$pinnedCount of $kWidgetDefaultRows';
    }
    final shown = pinnedCount.clamp(0, kWidgetMaxRows);
    return '$shown of up to $kWidgetMaxRows (resize to show more)';
  }
}

// ── Pinned clock card (large) ─────────────────────────────────────────────────

class _PinnedClock extends ConsumerWidget {
  final TzCity city;
  final Color  accent;
  const _PinnedClock({required this.city, required this.accent});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final time  = city.currentTime;
    final theme = Theme.of(context);
    final actions = ref.read(timezoneActionsProvider);

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: accent.withValues(alpha: 0.3)),
        boxShadow: [
          BoxShadow(
            color: accent.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Text(city.flag, style: const TextStyle(fontSize: 28)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  city.name,
                  style: theme.textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  '${city.country} · UTC${_offsetLabel(city.offsetHours)}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                _formatTime(time),
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: accent,
                  fontFeatures: const [FontFeature.tabularFigures()],
                ),
              ),
              Text(
                _formatDate(time),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const SizedBox(width: 4),
          IconButton(
            icon: const Icon(Icons.push_pin_rounded, size: 18),
            color: accent,
            tooltip: 'Unpin',
            onPressed: () => actions.togglePinned(city.name),
          ),
        ],
      ),
    );
  }
}

// ── City row (list) ───────────────────────────────────────────────────────────

class _CityRow extends ConsumerWidget {
  final TzCity city;
  final Color  accent;
  const _CityRow({required this.city, required this.accent});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final time    = city.currentTime;
    final theme   = Theme.of(context);
    final pinned  = ref.watch(pinnedCitiesProvider);
    final isPinned = pinned.contains(city.name);

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: Text(city.flag, style: const TextStyle(fontSize: 22)),
      title: Text(city.name, style: theme.textTheme.bodyLarge),
      subtitle: Text(
        '${city.country} · UTC${_offsetLabel(city.offsetHours)}',
        style: theme.textTheme.bodySmall
            ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                _formatTime(time),
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: accent,
                ),
              ),
              Text(
                _formatDate(time),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                  fontSize: 10,
                ),
              ),
            ],
          ),
          IconButton(
            icon: Icon(
              isPinned ? Icons.push_pin_rounded : Icons.push_pin_outlined,
              size: 18,
            ),
            color: isPinned ? accent : theme.colorScheme.onSurfaceVariant,
            onPressed: () =>
                ref.read(timezoneActionsProvider).togglePinned(city.name),
          ),
        ],
      ),
    );
  }
}

// ── Helpers ───────────────────────────────────────────────────────────────────

String _formatTime(DateTime dt) {
  final h = dt.hour.toString().padLeft(2, '0');
  final m = dt.minute.toString().padLeft(2, '0');
  final s = dt.second.toString().padLeft(2, '0');
  return '$h:$m:$s';
}

String _formatDate(DateTime dt) {
  const months = ['Jan','Feb','Mar','Apr','May','Jun',
                  'Jul','Aug','Sep','Oct','Nov','Dec'];
  const days   = ['Mon','Tue','Wed','Thu','Fri','Sat','Sun'];
  return '${days[dt.weekday - 1]}, ${dt.day} ${months[dt.month - 1]}';
}

String _offsetLabel(double h) {
  final sign = h >= 0 ? '+' : '-';
  final abs  = h.abs();
  final hh   = abs.truncate().toString().padLeft(2, '0');
  final mm   = ((abs - abs.truncate()) * 60).round().toString().padLeft(2, '0');
  return '$sign$hh:$mm';
}
