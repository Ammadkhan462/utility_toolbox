import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:utility_toolbox/core/theme/app_colors.dart';
import 'package:utility_toolbox/core/widgets/empty_state.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/features/qr_barcode/providers/qr_providers.dart';
import 'package:utility_toolbox/features/qr_barcode/screens/qr_scanner_screen.dart'
    show qrTypeLabel;
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';

class ScanHistoryScreen extends ConsumerWidget {
  const ScanHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final history = ref.watch(scanHistoryProvider);
    final l = AppLocalizations.of(context);
    final dateFormat = DateFormat.yMMMd(
      Localizations.localeOf(context).toLanguageTag(),
    ).add_jm();

    return ToolScaffold(
      title: l.qrHistoryTitle,
      accentColor: AppColors.toolAccent('qr_barcode'),
      actions: [
        if (history.isNotEmpty)
          PopupMenuButton<String>(
            tooltip: l.qrHistoryMore,
            onSelected: (value) async {
              if (value == 'clear') {
                await ref.read(scanHistoryProvider.notifier).clearAll();
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(value: 'clear', child: Text(l.commonClearAll)),
            ],
          ),
      ],
      body: history.isEmpty
          ? EmptyState(
              icon: Icons.history,
              message: l.qrHistoryEmpty,
            )
          : ListView.separated(
              itemCount: history.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final item = history[index];
                return Dismissible(
                  key: ValueKey(item.id),
                  direction: DismissDirection.endToStart,
                  onDismissed: (_) => ref
                      .read(scanHistoryProvider.notifier)
                      .deleteItem(item.id),
                  background: Container(
                    color: Theme.of(context).colorScheme.error,
                    alignment: AlignmentDirectional.centerEnd,
                    padding: const EdgeInsetsDirectional.only(end: 16),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  child: ListTile(
                    title: Text(
                      item.content,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      '${qrTypeLabel(l, item.type)} · ${dateFormat.format(item.scannedAt)}',
                    ),
                    onTap: () async {
                      await showModalBottomSheet<void>(
                        context: context,
                        builder: (context) => Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SelectableText(item.content),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  FilledButton.tonal(
                                    onPressed: () async {
                                      await Clipboard.setData(
                                        ClipboardData(text: item.content),
                                      );
                                      if (context.mounted) {
                                        Navigator.pop(context);
                                      }
                                    },
                                    child: Text(l.commonCopy),
                                  ),
                                  const SizedBox(width: 8),
                                  IconButton(
                                    tooltip: l.commonShare,
                                    onPressed: () => Share.share(item.content),
                                    icon: const Icon(Icons.share),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
