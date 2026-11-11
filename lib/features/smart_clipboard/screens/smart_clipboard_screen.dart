import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:utility_toolbox/core/widgets/empty_state.dart';
import 'package:utility_toolbox/core/widgets/premium_button.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/features/smart_clipboard/models/clip_item.dart';
import 'package:utility_toolbox/features/smart_clipboard/providers/clipboard_providers.dart';
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';

const _accent = Color(0xFF7C3AED); // Purple — uniquely identifies this tool
const _accentGlow = Color(0xFFA78BFA);

class SmartClipboardScreen extends ConsumerStatefulWidget {
  const SmartClipboardScreen({super.key});

  @override
  ConsumerState<SmartClipboardScreen> createState() =>
      _SmartClipboardScreenState();
}

class _SmartClipboardScreenState extends ConsumerState<SmartClipboardScreen> {
  // The search provider outlives this screen, so start the box with the
  // query that's still filtering the list (instead of an empty box that
  // hides why clips are missing).
  late final _searchCtrl =
      TextEditingController(text: ref.read(clipSearchProvider));

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  Future<void> _pasteFromClipboard() async {
    final notifier = ref.read(clipboardNotifierProvider.notifier);
    final item = await notifier.addFromClipboard();
    if (!mounted) return;
    final l = AppLocalizations.of(context);
    if (item == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l.clipEmptyClipboard)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l.clipSaved(_truncate(item.content, 40))),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  void _showAddManual() {
    final l = AppLocalizations.of(context);
    final ctrl = TextEditingController();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => Padding(
        padding: EdgeInsets.fromLTRB(
          20,
          20,
          20,
          MediaQuery.viewInsetsOf(ctx).bottom + 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              l.clipAddManualTitle,
              style: Theme.of(
                ctx,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 14),
            TextField(
              controller: ctrl,
              autofocus: true,
              maxLines: 5,
              minLines: 2,
              decoration: InputDecoration(
                hintText: l.clipAddHint,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 14),
            FilledButton(
              onPressed: () {
                if (ctrl.text.trim().isNotEmpty) {
                  ref
                      .read(clipboardNotifierProvider.notifier)
                      .add(ctrl.text.trim());
                }
                Navigator.pop(ctx);
              },
              style: FilledButton.styleFrom(backgroundColor: _accent),
              child: Text(l.commonSave),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final clips = ref.watch(filteredClipsProvider);
    final filter = ref.watch(clipFilterProvider);
    final all = ref.watch(clipboardNotifierProvider);
    final theme = Theme.of(context);
    final notifier = ref.read(clipboardNotifierProvider.notifier);
    final l = AppLocalizations.of(context);

    return ToolScaffold(
      title: l.toolSmartClipboardTitle,
      accentColor: _accent,
      actions: [
        IconButton(
          icon: const Icon(Icons.delete_sweep_rounded),
          tooltip: l.clipClearUnpinned,
          onPressed: all.isEmpty
              ? null
              : () => showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text(l.clipClearHistoryTitle),
                    content: Text(l.clipClearHistoryBody),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(l.commonCancel),
                      ),
                      FilledButton(
                        onPressed: () {
                          notifier.clearAll();
                          Navigator.pop(context);
                        },
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: Text(l.commonClear),
                      ),
                    ],
                  ),
                ),
        ),
      ],
      body: Column(
        children: [
          // ── Search + paste bar ──────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchCtrl,
                    decoration: InputDecoration(
                      hintText: l.clipSearchHint,
                      prefixIcon: const Icon(Icons.search_rounded, size: 20),
                      isDense: true,
                      suffixIcon: _searchCtrl.text.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.clear_rounded, size: 18),
                              tooltip: l.commonClear,
                              onPressed: () {
                                _searchCtrl.clear();
                                ref.read(clipSearchProvider.notifier).state =
                                    '';
                              },
                            )
                          : null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      filled: true,
                    ),
                    onChanged: (v) =>
                        ref.read(clipSearchProvider.notifier).state = v,
                  ),
                ),
                const SizedBox(width: 8),
                // Paste button
                FilledButton.icon(
                  onPressed: _pasteFromClipboard,
                  icon: const Icon(Icons.content_paste_rounded, size: 18),
                  label: Text(l.commonPaste),
                  style: FilledButton.styleFrom(
                    backgroundColor: _accent,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ── Filter chips ────────────────────────────────────────────
          SizedBox(
            height: 48,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              children: ClipFilter.values.map((f) {
                final selected = f == filter;
                return Padding(
                  padding: const EdgeInsetsDirectional.only(end: 8),
                  child: FilterChip(
                    label: Text(_filterLabel(l, f)),
                    selected: selected,
                    visualDensity: VisualDensity.compact,
                    selectedColor: _accent.withValues(alpha: 0.15),
                    checkmarkColor: _accent,
                    labelStyle: TextStyle(
                      color: selected
                          ? _accent
                          : theme.colorScheme.onSurfaceVariant,
                      fontWeight: selected ? FontWeight.w700 : FontWeight.w400,
                    ),
                    side: BorderSide(
                      color: selected
                          ? _accent.withValues(alpha: 0.5)
                          : theme.colorScheme.outline.withValues(alpha: 0.3),
                    ),
                    onSelected: (_) =>
                        ref.read(clipFilterProvider.notifier).state = f,
                  ),
                );
              }).toList(),
            ),
          ),

          // ── Stats bar ───────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '${l.clipSavedCount(all.length)} · '
                    '${l.clipPinnedCount(all.where((c) => c.pinned).length)}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
                TextButton.icon(
                  onPressed: _showAddManual,
                  icon: const Icon(Icons.add_rounded, size: 16),
                  label: Text(l.clipAddText),
                  style: TextButton.styleFrom(
                    foregroundColor: _accent,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ── Clips list ─────────────────────────────────────────────
          Expanded(
            child: clips.isEmpty
                ? _EmptyState(onPaste: _pasteFromClipboard)
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
                    itemCount: clips.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (ctx, i) =>
                        _ClipCard(item: clips[i], notifier: notifier),
                  ),
          ),
        ],
      ),
    );
  }
}

// ── Clip card ──────────────────────────────────────────────────────────────

class _ClipCard extends ConsumerWidget {
  const _ClipCard({required this.item, required this.notifier});

  final ClipItem item;
  final ClipboardNotifier notifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final type = item.clipType;
    final typeColor = _typeColor(type);
    final l = AppLocalizations.of(context);

    return Dismissible(
      key: ValueKey(item.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: AlignmentDirectional.centerEnd,
        padding: const EdgeInsetsDirectional.only(end: 20),
        decoration: BoxDecoration(
          color: Colors.red.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(18),
        ),
        child: const Icon(Icons.delete_rounded, color: Colors.red),
      ),
      onDismissed: (_) => notifier.delete(item),
      child: Container(
        decoration: BoxDecoration(
          color: item.pinned
              ? _accent.withValues(alpha: isDark ? 0.1 : 0.05)
              : theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: item.pinned
                ? _accent.withValues(alpha: 0.3)
                : theme.colorScheme.outline.withValues(alpha: 0.4),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Header ──────────────────────────────────────────────
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(14, 10, 6, 0),
              child: Row(
                children: [
                  // Type badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: typeColor.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(_typeIcon(type), size: 12, color: typeColor),
                        const SizedBox(width: 4),
                        Text(
                          _typeLabel(l, type),
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: typeColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  if (item.label.isNotEmpty)
                    Expanded(
                      child: Text(
                        item.label,
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  const Spacer(),
                  Text(
                    _relativeTime(l, item.savedAt),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                      fontSize: 11,
                    ),
                  ),
                  const SizedBox(width: 4),
                  // Pin toggle
                  Tooltip(
                    message: item.pinned ? l.clipUnpin : l.clipPin,
                    child: Semantics(
                      button: true,
                      child: GestureDetector(
                        onTap: () => notifier.togglePin(item),
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: Icon(
                            item.pinned
                                ? Icons.push_pin_rounded
                                : Icons.push_pin_outlined,
                            size: 18,
                            color: item.pinned
                                ? _accent
                                : theme.colorScheme.onSurfaceVariant.withValues(
                                    alpha: 0.5,
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ── Content ──────────────────────────────────────────────
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(14, 6, 14, 10),
              child: Text(
                item.content,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: type == ClipType.code
                    ? theme.textTheme.bodySmall?.copyWith(
                        fontFamily: 'monospace',
                      )
                    : theme.textTheme.bodyMedium,
              ),
            ),

            // ── Action row ────────────────────────────────────────────
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: theme.colorScheme.outline.withValues(alpha: 0.3),
                  ),
                ),
              ),
              child: Row(
                children: [
                  _ActionBtn(
                    icon: Icons.copy_rounded,
                    label: l.commonCopy,
                    onTap: () async {
                      await notifier.copyToClipboard(item);
                      if (context.mounted) {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            SnackBar(
                              content: Text(l.commonCopied),
                              duration: const Duration(seconds: 1),
                            ),
                          );
                      }
                    },
                  ),
                  _ActionBtn(
                    icon: Icons.share_rounded,
                    label: l.commonShare,
                    onTap: () => Share.share(item.content),
                  ),
                  if (type == ClipType.url)
                    _ActionBtn(
                      icon: Icons.open_in_browser_rounded,
                      label: l.commonOpen,
                      onTap: () async {
                        final uri = Uri.tryParse(item.content.trim());
                        if (uri == null) return;
                        try {
                          await launchUrl(
                            uri,
                            mode: LaunchMode.externalApplication,
                          );
                        } catch (_) {
                          // No app can open it — nothing to do.
                        }
                      },
                    ),
                  _ActionBtn(
                    icon: Icons.label_outline_rounded,
                    label: l.clipLabel,
                    onTap: () => _showLabelDialog(context, item, notifier),
                  ),
                  _ActionBtn(
                    icon: Icons.delete_outline_rounded,
                    label: l.commonDelete,
                    color: Colors.red,
                    onTap: () => notifier.delete(item),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLabelDialog(
    BuildContext context,
    ClipItem item,
    ClipboardNotifier notifier,
  ) {
    final ctrl = TextEditingController(text: item.label);
    final l = AppLocalizations.of(context);
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(l.clipAddLabelTitle),
        content: TextField(
          controller: ctrl,
          autofocus: true,
          decoration: InputDecoration(hintText: l.clipLabelHint),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l.commonCancel),
          ),
          FilledButton(
            onPressed: () {
              notifier.updateLabel(item, ctrl.text.trim());
              Navigator.pop(context);
            },
            child: Text(l.commonSave),
          ),
        ],
      ),
    );
  }
}

class _ActionBtn extends StatelessWidget {
  const _ActionBtn({
    required this.icon,
    required this.label,
    required this.onTap,
    this.color,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final iconColor = color ?? theme.colorScheme.onSurfaceVariant;

    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 18, color: iconColor),
              const SizedBox(height: 3),
              // Scales down instead of overflowing for long translations.
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  label,
                  maxLines: 1,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: iconColor,
                    fontSize: 9,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Empty state ────────────────────────────────────────────────────────────

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.onPaste});

  final VoidCallback onPaste;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return EmptyState(
      icon: Icons.content_paste_rounded,
      gradient: const LinearGradient(colors: [_accent, _accentGlow]),
      title: l.clipEmptyTitle,
      message: l.clipEmptyMessage,
      action: PremiumButton(
        onPressed: onPaste,
        icon: Icons.content_paste_rounded,
        label: l.clipPasteFromClipboard,
        gradient: const LinearGradient(colors: [_accent, _accentGlow]),
        expanded: false,
      ),
    );
  }
}

// ── Helpers ────────────────────────────────────────────────────────────────

Color _typeColor(ClipType t) => switch (t) {
  ClipType.url => const Color(0xFF3B82F6),
  ClipType.email => const Color(0xFF22C55E),
  ClipType.phone => const Color(0xFFF59E0B),
  ClipType.code => const Color(0xFF8B5CF6),
  ClipType.text => const Color(0xFF64748B),
};

IconData _typeIcon(ClipType t) => switch (t) {
  ClipType.url => Icons.link_rounded,
  ClipType.email => Icons.email_rounded,
  ClipType.phone => Icons.phone_rounded,
  ClipType.code => Icons.code_rounded,
  ClipType.text => Icons.text_fields_rounded,
};

String _typeLabel(AppLocalizations l, ClipType t) => switch (t) {
  ClipType.url => l.clipTypeLink,
  ClipType.email => l.clipTypeEmail,
  ClipType.phone => l.clipTypePhone,
  ClipType.code => l.clipTypeCode,
  ClipType.text => l.clipTypeText,
};

String _filterLabel(AppLocalizations l, ClipFilter f) => switch (f) {
  ClipFilter.all => l.clipFilterAll,
  ClipFilter.pinned => '📌 ${l.clipFilterPinned}',
  ClipFilter.urls => '🔗 ${l.clipFilterLinks}',
  ClipFilter.text => '📝 ${l.clipFilterText}',
  ClipFilter.code => '💻 ${l.clipFilterCode}',
};

// Truncates by grapheme so an emoji is never split into broken halves.
String _truncate(String s, int max) => s.characters.length <= max
    ? s
    : '${s.characters.take(max)}…';

String _relativeTime(AppLocalizations l, DateTime dt) {
  final diff = DateTime.now().difference(dt);
  if (diff.inSeconds < 60) return l.clipJustNow;
  if (diff.inMinutes < 60) return l.clipMinutesAgo(diff.inMinutes);
  if (diff.inHours < 24) return l.clipHoursAgo(diff.inHours);
  return l.clipDaysAgo(diff.inDays);
}
