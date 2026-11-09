import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:utility_toolbox/core/theme/app_colors.dart';
import 'package:utility_toolbox/core/widgets/empty_state.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import '../models/saved_location.dart';
import '../providers/location_providers.dart';

class LocationSaverScreen extends ConsumerWidget {
  const LocationSaverScreen({super.key});

  static final _accent = AppColors.toolAccent('location_saver');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posState = ref.watch(positionProvider);
    final saved    = ref.watch(savedLocationsProvider);
    final theme    = Theme.of(context);

    return ToolScaffold(
      title: 'Location Saver',
      accentColor: _accent,
      body: CustomScrollView(
        slivers: [
          // ── Current position card ──────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: _CurrentLocationCard(
                posState: posState,
                accent: _accent,
                onSave: () => _showSaveDialog(context, ref, posState),
                onRefresh: () => ref.read(positionProvider.notifier).fetch(),
              ),
            ),
          ),

          // ── Saved locations header ─────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
              child: Row(
                children: [
                  Text(
                    'Saved Locations',
                    style: theme.textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Text(
                    '${saved.length} saved',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),

          if (saved.isEmpty)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: EmptyState(
                  icon: Icons.bookmark_border_rounded,
                  gradient: AppColors.toolGradient('location_saver'),
                  message:
                      'No saved locations yet.\nTap "Save" to bookmark your current spot.',
                ),
              ),
            )
          else
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, i) => _LocationTile(
                  loc: saved[i],
                  accent: _accent,
                  onDelete: () =>
                      ref.read(savedLocationsProvider.notifier).remove(saved[i].id),
                ),
                childCount: saved.length,
              ),
            ),

          const SliverToBoxAdapter(child: SizedBox(height: 20)),
        ],
      ),
    );
  }

  Future<void> _showSaveDialog(
      BuildContext context, WidgetRef ref, PositionState pos) async {
    if (pos.position == null) return;
    final nameCtrl = TextEditingController();
    final noteCtrl = TextEditingController();

    await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Save Location'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(
                labelText: 'Name *',
                hintText: 'e.g. Home, Office…',
              ),
              autofocus: true,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: noteCtrl,
              decoration: const InputDecoration(
                labelText: 'Note (optional)',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              if (nameCtrl.text.trim().isEmpty) return;
              ref.read(savedLocationsProvider.notifier).add(
                name:    nameCtrl.text.trim(),
                lat:     pos.position!.latitude,
                lng:     pos.position!.longitude,
                note:    noteCtrl.text.trim().isEmpty ? null : noteCtrl.text.trim(),
              );
              Navigator.pop(ctx);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}

// ── Current location card ─────────────────────────────────────────────────────

class _CurrentLocationCard extends StatelessWidget {
  final PositionState posState;
  final Color accent;
  final VoidCallback onSave;
  final VoidCallback onRefresh;

  const _CurrentLocationCard({
    required this.posState,
    required this.accent,
    required this.onSave,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pos   = posState.position;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppColors.toolGradient('location_saver'),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.my_location_rounded, color: Colors.white),
              const SizedBox(width: 8),
              Text(
                'Current Location',
                style: theme.textTheme.titleMedium
                    ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.refresh_rounded, color: Colors.white70),
                onPressed: onRefresh,
                tooltip: 'Refresh',
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (posState.isLoading)
            const Center(
              child: CircularProgressIndicator(color: Colors.white),
            )
          else if (posState.error != null)
            Text(posState.error!, style: const TextStyle(color: Colors.white70))
          else if (pos != null) ...[
            Text(
              '${pos.latitude.toStringAsFixed(6)}, ${pos.longitude.toStringAsFixed(6)}',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFeatures: const [FontFeature.tabularFigures()],
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Accuracy: ±${pos.accuracy.toStringAsFixed(0)} m',
              style: const TextStyle(color: Colors.white70, fontSize: 12),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(foregroundColor: Colors.white,
                        side: const BorderSide(color: Colors.white38)),
                    onPressed: () {
                      Clipboard.setData(ClipboardData(
                          text:
                              '${pos.latitude.toStringAsFixed(6)}, ${pos.longitude.toStringAsFixed(6)}'));
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(content: Text('Coords copied')));
                    },
                    icon: const Icon(Icons.copy_rounded, size: 16),
                    label: const Text('Copy'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: FilledButton.icon(
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: accent,
                    ),
                    onPressed: onSave,
                    icon: const Icon(Icons.bookmark_add_rounded, size: 16),
                    label: const Text('Save'),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

// ── Saved location tile ───────────────────────────────────────────────────────

class _LocationTile extends StatelessWidget {
  final SavedLocation loc;
  final Color         accent;
  final VoidCallback  onDelete;

  const _LocationTile({
    required this.loc,
    required this.accent,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 10),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: accent.withValues(alpha: 0.12),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.place_rounded, color: accent, size: 20),
        ),
        title: Text(loc.name,
            style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(loc.coordsString,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                  fontFeatures: const [FontFeature.tabularFigures()],
                )),
            if (loc.note != null)
              Text(loc.note!,
                  style: theme.textTheme.bodySmall
                      ?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.copy_rounded, size: 18),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: loc.coordsString));
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('Coords copied')));
              },
              tooltip: 'Copy coords',
            ),
            IconButton(
              icon: const Icon(Icons.map_rounded, size: 18),
              onPressed: () => launchUrl(Uri.parse(loc.mapsUrl)),
              tooltip: 'Open in Maps',
            ),
            IconButton(
              icon: const Icon(Icons.delete_outline_rounded, size: 18),
              color: AppColors.error,
              onPressed: onDelete,
              tooltip: 'Delete',
            ),
          ],
        ),
        isThreeLine: loc.note != null,
      ),
    );
  }
}
