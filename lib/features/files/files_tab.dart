import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:utility_toolbox/core/files/output_record.dart';
import 'package:utility_toolbox/core/files/outputs_providers.dart';
import 'package:utility_toolbox/core/platform/system_bridge.dart';
import 'package:utility_toolbox/core/tools/tool_registry.dart';
import 'package:utility_toolbox/core/utils/file_utils.dart';
import 'package:utility_toolbox/core/widgets/tool_icon.dart';
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';

/// Everything the app has produced, newest first, so users come back to
/// the app to find "that PDF" instead of digging through Downloads.
class FilesTab extends ConsumerWidget {
  const FilesTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final records = ref.watch(outputsProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 16, 8, 8),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  l.navFiles,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              if (records.isNotEmpty)
                TextButton.icon(
                  onPressed: () => _confirmClear(context, ref),
                  icon: const Icon(Icons.clear_all_rounded),
                  label: Text(l.filesClearList),
                ),
            ],
          ),
        ),
        Expanded(
          child: records.isEmpty
              ? _Empty(l: l)
              : ListView.separated(
                  padding: const EdgeInsets.only(bottom: 16),
                  itemCount: records.length,
                  separatorBuilder: (_, __) =>
                      const Divider(height: 1, indent: 76),
                  itemBuilder: (_, i) => _FileRow(record: records[i]),
                ),
        ),
      ],
    );
  }

  Future<void> _confirmClear(BuildContext context, WidgetRef ref) async {
    final l = AppLocalizations.of(context);
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        content: Text(l.filesClearConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(l.commonCancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(l.commonClear),
          ),
        ],
      ),
    );
    if (ok == true) await ref.read(outputsProvider.notifier).clear();
  }
}

/// Last time a row launched an open/share chooser; a quick double tap would
/// otherwise fire two intents and stack two chooser sheets.
DateTime _lastLaunch = DateTime.fromMillisecondsSinceEpoch(0);

bool _debounced() {
  final now = DateTime.now();
  if (now.difference(_lastLaunch) < const Duration(milliseconds: 800)) {
    return true;
  }
  _lastLaunch = now;
  return false;
}

class _FileRow extends ConsumerWidget {
  const _FileRow({required this.record});

  final OutputRecord record;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final tool = ToolRegistry.byId(record.toolId);
    final locale = Localizations.localeOf(context).toLanguageTag();
    final when = DateFormat.yMMMd(locale).add_jm().format(record.createdAt);
    final size = record.sizeBytes == null
        ? null
        : FileUtils.formatFileSize(record.sizeBytes!);
    final subtitle = [
      if (tool != null) tool.title(l),
      when,
      if (size != null) size,
    ].join(' · ');

    final (icon, colors) = record.isPdf
        ? (Icons.picture_as_pdf_rounded, const [Color(0xFFFF8642), Color(0xFFFF5C7A)])
        : record.isImage
        ? (Icons.image_rounded, const [Color(0xFF2ECC8A), Color(0xFF2EEAAA)])
        : (Icons.insert_drive_file_rounded, const [Color(0xFF3D9BFF), Color(0xFF00CFFF)]);

    return ListTile(
      contentPadding: const EdgeInsetsDirectional.fromSTEB(20, 4, 4, 4),
      leading: ToolIcon(icon: icon, colors: colors, size: 44),
      title: Text(
        record.name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(subtitle, maxLines: 1, overflow: TextOverflow.ellipsis),
      onTap: () => _open(context, ref),
      trailing: PopupMenuButton<String>(
        onSelected: (action) => switch (action) {
          'open' => _open(context, ref),
          'share' => _share(context, ref),
          _ => ref.read(outputsProvider.notifier).remove(record.id),
        },
        itemBuilder: (_) => [
          PopupMenuItem(value: 'open', child: Text(l.fileOpen)),
          PopupMenuItem(value: 'share', child: Text(l.fileShare)),
          PopupMenuItem(value: 'remove', child: Text(l.fileRemoveFromList)),
        ],
      ),
    );
  }

  /// A plain file path that no longer exists (deleted from a file manager or
  /// cleared storage). content:// URIs can only be checked natively.
  Future<bool> _isMissing() async =>
      !record.isContentUri && !await File(record.location).exists();

  /// "Couldn't open… moved or deleted", with a one-tap way to drop the stale
  /// entry instead of leaving a dead row in the list forever.
  void _showFailed(
    ScaffoldMessengerState messenger,
    AppLocalizations l,
    WidgetRef ref,
  ) {
    final notifier = ref.read(outputsProvider.notifier);
    messenger.showSnackBar(
      SnackBar(
        content: Text(l.fileOpenFailed),
        action: SnackBarAction(
          label: l.fileRemoveFromList,
          onPressed: () => notifier.remove(record.id),
        ),
      ),
    );
  }

  Future<void> _open(BuildContext context, WidgetRef ref) async {
    if (_debounced()) return;
    final messenger = ScaffoldMessenger.of(context);
    final l = AppLocalizations.of(context);
    final ok = !await _isMissing() &&
        await SystemBridge.instance.openFile(record.location, record.mimeType);
    if (!ok && context.mounted) _showFailed(messenger, l, ref);
  }

  Future<void> _share(BuildContext context, WidgetRef ref) async {
    if (_debounced()) return;
    final messenger = ScaffoldMessenger.of(context);
    final l = AppLocalizations.of(context);
    if (await _isMissing()) {
      if (context.mounted) _showFailed(messenger, l, ref);
      return;
    }
    var ok = await SystemBridge.instance.shareFile(
      record.location,
      record.mimeType,
    );
    // Non-Android (or no native share): plain file paths still work.
    if (!ok && !record.isContentUri) {
      try {
        await Share.shareXFiles([XFile(record.location)]);
        ok = true;
      } catch (_) {}
    }
    if (!ok && context.mounted) _showFailed(messenger, l, ref);
  }
}

class _Empty extends StatelessWidget {
  const _Empty({required this.l});

  final AppLocalizations l;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.folder_open_rounded,
              size: 64,
              color: theme.colorScheme.primary.withValues(alpha: 0.6),
            ),
            const SizedBox(height: 16),
            Text(
              l.filesEmptyTitle,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              l.filesEmptyBody,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
