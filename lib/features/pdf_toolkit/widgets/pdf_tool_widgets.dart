import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:share_plus/share_plus.dart';
import 'package:utility_toolbox/core/services/ads_service.dart';
import 'package:utility_toolbox/core/utils/file_utils.dart';
import 'package:utility_toolbox/features/pdf_toolkit/services/pdf_extra_service.dart';
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';

final pdfExtraServiceProvider = Provider<PdfExtraService>((_) => PdfExtraService());

/// Maps a [PageRangeException] from [parsePageRanges] to a message in the
/// app language.
String pageRangeErrorText(AppLocalizations l, PageRangeException e) =>
    switch (e.kind) {
      PageRangeError.empty => l.pdfToolsRangeEmpty,
      PageRangeError.invalid => l.pdfToolsRangeInvalid(e.part),
      PageRangeError.outOfRange => l.pdfToolsRangeOutside(e.part, e.pageCount),
    };

/// Opens the system file picker for a single PDF.
/// Returns null when the user cancels or the picker can't open.
Future<String?> pickPdfPath() async {
  try {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: const ['pdf'],
    );
    final files = result?.files;
    return files == null || files.isEmpty ? null : files.first.path;
  } catch (e) {
    debugPrint('PDF picker failed: $e');
    return null;
  }
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
    final l = AppLocalizations.of(context);
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
                  l.pdfToolsChoosePdf,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  l.pdfToolsChooseHint,
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
        ? (loading ? l.pdfToolsReading : '')
        : info!.isEncrypted
        ? l.pdfToolsLockedShort
        : l.pdfToolsPageCount(info!.pageCount);
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
        trailing: TextButton(onPressed: onPick, child: Text(l.pdfToolsChange)),
      ),
    );
  }
}

/// Finished-PDF card with Save to Downloads / Share / Start over.
class PdfResultCard extends ConsumerStatefulWidget {
  const PdfResultCard({
    super.key,
    required this.file,
    required this.toolId,
    required this.accent,
    required this.onReset,
    this.headline,
  });

  final File file;
  final String toolId;
  final Color accent;
  final VoidCallback onReset;
  /// Defaults to "Your PDF is ready" in the app language.
  final String? headline;

  @override
  ConsumerState<PdfResultCard> createState() => _PdfResultCardState();
}

class _PdfResultCardState extends ConsumerState<PdfResultCard> {
  bool _saving = false;
  late Future<int> _size = widget.file.length();

  @override
  void didUpdateWidget(PdfResultCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.file.path != widget.file.path) _size = widget.file.length();
  }

  @override
  Widget build(BuildContext context) {
    final file = widget.file;
    final accent = widget.accent;
    final theme = Theme.of(context);
    final l = AppLocalizations.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(Icons.check_circle_rounded, color: accent, size: 48),
            const SizedBox(height: 12),
            Text(
              widget.headline ?? l.pdfToolsResultReady,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 4),
            FutureBuilder<int>(
              future: _size,
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
              // Disabled while saving so a double tap can't save twice.
              onPressed: _saving ? null : _save,
              icon: const Icon(Icons.download_rounded),
              label: Text(l.pdfToolsSaveDownloads),
            ),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: () => Share.shareXFiles([XFile(file.path)]),
              icon: const Icon(Icons.share_rounded),
              label: Text(l.commonShare),
            ),
            const SizedBox(height: 8),
            TextButton(onPressed: widget.onReset, child: Text(l.pdfToolsStartOver)),
          ],
        ),
      ),
    );
  }

  Future<void> _save() async {
    final messenger = ScaffoldMessenger.of(context);
    final l = AppLocalizations.of(context);
    // Read before the await: ref can't be used once the screen is gone.
    final ads = ref.read(adsServiceProvider);
    setState(() => _saving = true);
    final SaveOutcome outcome;
    try {
      outcome = await FileUtils.saveToDownloads(
        sourcePath: widget.file.path,
        fileName: p.basenameWithoutExtension(widget.file.path),
        ext: 'pdf',
        toolId: widget.toolId,
      );
    } finally {
      if (mounted) setState(() => _saving = false);
    }
    messenger.showSnackBar(
      SnackBar(
        content: Text(
          outcome == SaveOutcome.downloaded
              ? l.pdfToolsSavedToDownloads
              : l.pdfToolsSharedInstead,
        ),
      ),
    );
    await ads.showInterstitialIfAllowed();
  }
}

class InlineError extends StatelessWidget {
  const InlineError({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 12),
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
