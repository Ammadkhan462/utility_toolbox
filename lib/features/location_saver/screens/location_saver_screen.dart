import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart' show NumberFormat;
import 'package:url_launcher/url_launcher.dart';
import 'package:utility_toolbox/core/theme/app_colors.dart';
import 'package:utility_toolbox/core/widgets/empty_state.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';
import '../models/saved_location.dart';
import '../providers/location_providers.dart';

/// "lat, lng" for display, in the app's digits. Clipboard and Maps keep the
/// plain ASCII form ([SavedLocation.coordsString]).
String _coords(AppLocalizations l, double lat, double lng) {
  final f = NumberFormat('0.000000', l.localeName);
  // LTR isolate: in Arabic/Urdu a leading minus would otherwise jump around.
  return '\u2066${f.format(lat)}, ${f.format(lng)}\u2069';
}

String _plainCoords(double lat, double lng) =>
    '${lat.toStringAsFixed(6)}, ${lng.toStringAsFixed(6)}';

class LocationSaverScreen extends ConsumerStatefulWidget {
  const LocationSaverScreen({super.key});

  @override
  ConsumerState<LocationSaverScreen> createState() =>
      _LocationSaverScreenState();
}

class _LocationSaverScreenState extends ConsumerState<LocationSaverScreen> {
  static final _accent = AppColors.toolAccent('location_saver');

  late final AppLifecycleListener _lifecycle;

  @override
  void initState() {
    super.initState();
    // Back from the system Settings (location turned on / permission
    // granted): pick the change up without making the user tap refresh.
    _lifecycle = AppLifecycleListener(
      onResume: () => ref.read(positionProvider.notifier).recheck(),
    );
  }

  @override
  void dispose() {
    _lifecycle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final posState = ref.watch(positionProvider);
    final saved    = ref.watch(savedLocationsProvider);
    final theme    = Theme.of(context);
    final l        = AppLocalizations.of(context);

    return ToolScaffold(
      title: l.toolLocationSaverTitle,
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
                onSave: () => _showSaveDialog(context, posState),
                onRefresh: () => ref.read(positionProvider.notifier).fetch(),
                onOpenSettings: () =>
                    ref.read(positionProvider.notifier).openSettings(),
              ),
            ),
          ),

          // ── Saved locations header ─────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      l.locationSavedHeader,
                      style: theme.textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    l.locationSavedCount(saved.length),
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
                  message: l.locationEmpty(l.commonSave),
                ),
              ),
            )
          else
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, i) => _LocationTile(
                  loc: saved[i],
                  accent: _accent,
                  onDelete: () => _delete(saved[i], i),
                ),
                childCount: saved.length,
              ),
            ),

          const SliverToBoxAdapter(child: SizedBox(height: 20)),
        ],
      ),
    );
  }

  void _delete(SavedLocation loc, int index) {
    final l = AppLocalizations.of(context);
    final notifier = ref.read(savedLocationsProvider.notifier);
    notifier.remove(loc.id);
    final messenger = ScaffoldMessenger.of(context);
    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(
      SnackBar(
        content: Text(l.locationDeleted(loc.name)),
        action: SnackBarAction(
          label: l.commonUndo,
          // The notifier is app-wide, so Undo works even after leaving.
          onPressed: () => notifier.restore(loc, index),
        ),
      ),
    );
  }

  Future<void> _showSaveDialog(BuildContext context, PositionState pos) async {
    final position = pos.position;
    if (position == null) return;
    final l = AppLocalizations.of(context);
    final nameCtrl = TextEditingController();
    var saving = false;
    final noteCtrl = TextEditingController();

    await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l.locationSaveDialogTitle),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameCtrl,
              decoration: InputDecoration(
                labelText: l.locationNameLabel,
                hintText: l.locationNameHint,
              ),
              textCapitalization: TextCapitalization.sentences,
              autofocus: true,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: noteCtrl,
              decoration: InputDecoration(
                labelText: l.locationNoteLabel,
              ),
              textCapitalization: TextCapitalization.sentences,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l.commonCancel),
          ),
          FilledButton(
            onPressed: () {
              if (saving || nameCtrl.text.trim().isEmpty) return;
              saving = true; // a fast double tap would save it twice
              ref.read(savedLocationsProvider.notifier).add(
                name:    nameCtrl.text.trim(),
                lat:     position.latitude,
                lng:     position.longitude,
                note:    noteCtrl.text.trim().isEmpty ? null : noteCtrl.text.trim(),
              );
              Navigator.pop(ctx);
            },
            child: Text(l.commonSave),
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
  final VoidCallback onOpenSettings;

  const _CurrentLocationCard({
    required this.posState,
    required this.accent,
    required this.onSave,
    required this.onRefresh,
    required this.onOpenSettings,
  });

  static String _errorText(AppLocalizations l, PositionErrorKind kind) =>
      switch (kind) {
        PositionErrorKind.servicesDisabled => l.locationServicesOff,
        PositionErrorKind.permissionDenied => l.locationPermissionDenied,
        PositionErrorKind.deniedForever => l.locationPermissionDeniedForever,
        PositionErrorKind.timeout => l.locationErrorTimeout,
        PositionErrorKind.other => l.commonErrorGeneric,
      };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l     = AppLocalizations.of(context);
    final pos   = posState.position;
    final kind  = posState.errorKind;

    final whiteButton = FilledButton.styleFrom(
      backgroundColor: Colors.white,
      foregroundColor: accent,
    );

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
              Expanded(
                child: Text(
                  l.locationCurrent,
                  style: theme.textTheme.titleMedium
                      ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.refresh_rounded, color: Colors.white70),
                onPressed: onRefresh,
                tooltip: l.locationRefresh,
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (posState.isLoading)
            Center(
              child: CircularProgressIndicator(
                color: Colors.white,
                semanticsLabel: l.locationLocating,
              ),
            )
          else if (kind != null) ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  kind == PositionErrorKind.servicesDisabled
                      ? Icons.location_disabled_rounded
                      : kind == PositionErrorKind.timeout
                          ? Icons.gps_off_rounded
                          : Icons.location_off_rounded,
                  color: Colors.white70,
                  size: 28,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    _errorText(l, kind),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Permission permanently denied or GPS off: a refresh can't fix
            // it, so take the user straight to the right settings page.
            // (Coming back re-checks automatically.)
            if (kind == PositionErrorKind.servicesDisabled ||
                kind == PositionErrorKind.deniedForever)
              FilledButton.icon(
                style: whiteButton,
                onPressed: onOpenSettings,
                icon: const Icon(Icons.settings_rounded, size: 16),
                label: Text(l.commonOpenSettings),
              )
            else
              FilledButton.icon(
                style: whiteButton,
                onPressed: onRefresh,
                icon: Icon(
                  kind == PositionErrorKind.permissionDenied
                      ? Icons.lock_open_rounded
                      : Icons.refresh_rounded,
                  size: 16,
                ),
                label: Text(kind == PositionErrorKind.permissionDenied
                    ? l.locationAllow
                    : l.commonRetry),
              ),
          ]
          else if (pos != null) ...[
            Text(
              _coords(l, pos.latitude, pos.longitude),
              style: theme.textTheme.bodyLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFeatures: const [FontFeature.tabularFigures()],
              ),
            ),
            const SizedBox(height: 4),
            Text(
              l.locationAccuracy(
                NumberFormat('0', l.localeName).format(pos.accuracy),
              ),
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
                          text: _plainCoords(pos.latitude, pos.longitude)));
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(l.locationCoordsCopied)));
                    },
                    icon: const Icon(Icons.copy_rounded, size: 16),
                    label: Text(l.commonCopy, overflow: TextOverflow.ellipsis),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: FilledButton.icon(
                    style: whiteButton,
                    onPressed: onSave,
                    icon: const Icon(Icons.bookmark_add_rounded, size: 16),
                    label: Text(l.commonSave, overflow: TextOverflow.ellipsis),
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
    final l     = AppLocalizations.of(context);
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 10),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: theme.colorScheme.outlineVariant),
      ),
      child: ListTile(
        contentPadding: const EdgeInsetsDirectional.fromSTEB(16, 8, 8, 8),
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
            Text(_coords(l, loc.latitude, loc.longitude),
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
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(l.locationCoordsCopied)));
              },
              tooltip: l.locationCopyCoords,
            ),
            IconButton(
              icon: const Icon(Icons.map_rounded, size: 18),
              onPressed: () async {
                try {
                  await launchUrl(Uri.parse(loc.mapsUrl),
                      mode: LaunchMode.externalApplication);
                } catch (_) {}
              },
              tooltip: l.locationOpenInMaps,
            ),
            IconButton(
              icon: const Icon(Icons.delete_outline_rounded, size: 18),
              color: AppColors.error,
              onPressed: onDelete,
              tooltip: l.commonDelete,
            ),
          ],
        ),
        isThreeLine: loc.note != null,
      ),
    );
  }
}
