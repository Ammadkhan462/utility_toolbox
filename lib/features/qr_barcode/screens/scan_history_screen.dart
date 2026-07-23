import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:utility_toolbox/core/widgets/empty_state.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/features/qr_barcode/providers/qr_providers.dart';

class ScanHistoryScreen extends ConsumerWidget {
  const ScanHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final history = ref.watch(scanHistoryProvider);

    return ToolScaffold(
      title: 'Scan History',
      actions: [
        if (history.isNotEmpty)
          PopupMenuButton<String>(
            onSelected: (value) async {
              if (value == 'clear') {
                await ref.read(scanHistoryProvider.notifier).clearAll();
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'clear', child: Text('Clear all')),
            ],
          ),
      ],
      body: history.isEmpty
          ? const EmptyState(
              icon: Icons.history,
              message: 'Scanned codes will appear here.',
            )
          : ListView.separated(
              itemCount: history.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final item = history[index];
                return Dismissible(
                  key: ValueKey(item.id),
                  direction: DismissDirection.endToStart,
                  onDismissed: (_) =>
                      ref.read(scanHistoryProvider.notifier).deleteItem(item.id),
                  background: Container(
                    color: Theme.of(context).colorScheme.error,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 16),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  child: ListTile(
                    title: Text(item.content, maxLines: 2, overflow: TextOverflow.ellipsis),
                    subtitle: Text(
                      '${item.type.toUpperCase()} · ${DateFormat.yMMMd().add_jm().format(item.scannedAt)}',
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
                                      if (context.mounted) Navigator.pop(context);
                                    },
                                    child: const Text('Copy'),
                                  ),
                                  const SizedBox(width: 8),
                                  IconButton(
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
