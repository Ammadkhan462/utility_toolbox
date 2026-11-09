import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:share_plus/share_plus.dart';
import 'package:utility_toolbox/core/services/ads_service.dart';
import 'package:utility_toolbox/core/utils/file_utils.dart';
import 'package:utility_toolbox/features/pdf_toolkit/services/pdf_extra_service.dart';

final pdfExtraServiceProvider = Provider<PdfExtraService>((_) => PdfExtraService());

/// Opens the system file picker for a single PDF.
Future<String?> pickPdfPath() async {
  final result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: const ['pdf'],
  );
  return result?.files.single.path;
}

/// "Choose a PDF" card, or the chosen file with its page count.
class PdfSourceCard extends StatelessWidget {
  const PdfSourceCard({
    super.key,
    required this.path,
    required this.info,
    required this.onPick,
    required this.accent,
    this.loading = false,
  });

  final String? path;
  final PdfInfo? info;
  final VoidCallback onPick;
  final Color accent;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (path == null) {
      return Card(
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onPick,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 16),
            child: Column(
              children: [
                Icon(Icons.upload_file_rounded, size: 48, color: accent),
                const SizedBox(height: 12),
                Text(
                  'Choose a PDF',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Or share a PDF to Utility Toolbox from any app',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    final pages = info == null
        ? (loading ? 'Reading…' : '')
        : info!.isEncrypted
        ? 'Password protected'
        : '${info!.pageCount} page${info!.pageCount == 1 ? '' : 's'}';
    return Card(
      child: ListTile(
        leading: Icon(Icons.picture_as_pdf_rounded, color: accent, size: 36),
        title: Text(
          p.basename(path!),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        subtitle: Text(pages),
        trailing: TextButton(onPressed: onPick, child: const Text('Change')),
      ),
    );
  }
}

/// Finished-PDF card with Save to Downloads / Share / Start over.
class PdfResultCard extends ConsumerWidget {
  const PdfResultCard({
    super.key,
    required this.file,
    required this.toolId,
    required this.accent,
    required this.onReset,
    this.headline = 'Your PDF is ready',
  });

  final File file;
  final String toolId;
  final Color accent;
  final VoidCallback onReset;
  final String headline;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(Icons.check_circle_rounded, color: accent, size: 48),
            const SizedBox(height: 12),
            Text(
              headline,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 4),
            FutureBuilder<int>(
              future: file.length(),
              builder: (_, snap) => Text(
                snap.hasData
                    ? '${p.basename(file.path)} · ${FileUtils.formatFileSize(snap.data!)}'
                    : p.basename(file.path),
                textAlign: TextAlign.center,
                style: theme.textTheme.bodySmall,
              ),
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              style: FilledButton.styleFrom(backgroundColor: accent),
              onPressed: () => _save(context, ref),
              icon: const Icon(Icons.download_rounded),
              label: const Text('Save to Downloads'),
            ),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: () => Share.shareXFiles([XFile(file.path)]),
              icon: const Icon(Icons.share_rounded),
              label: const Text('Share'),
            ),
            const SizedBox(height: 8),
            TextButton(onPressed: onReset, child: const Text('Start over')),
          ],
        ),
      ),
    );
  }

  Future<void> _save(BuildContext context, WidgetRef ref) async {
    final messenger = ScaffoldMessenger.of(context);
    final outcome = await FileUtils.saveToDownloads(
      sourcePath: file.path,
      fileName: p.basenameWithoutExtension(file.path),
      ext: 'pdf',
      toolId: toolId,
    );
    messenger.showSnackBar(
      SnackBar(
        content: Text(
          outcome == SaveOutcome.downloaded
              ? 'Saved to Downloads — find it in My Files'
              : 'Opened the share sheet instead',
        ),
      ),
    );
    await ref.read(adsServiceProvider).showInterstitialIfAllowed();
  }
}

class InlineError extends StatelessWidget {
  const InlineError({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.error_outline_rounded, color: theme.colorScheme.error, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: TextStyle(color: theme.colorScheme.error),
            ),
          ),
        ],
      ),
    );
  }
}
