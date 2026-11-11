import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:path/path.dart' as p;
import 'package:share_plus/share_plus.dart';
import 'package:utility_toolbox/core/routing/app_routes.dart';
import 'package:utility_toolbox/core/services/ads_service.dart';
import 'package:utility_toolbox/core/tools/tool_input.dart';
import 'package:utility_toolbox/core/utils/file_utils.dart';
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';

/// Opens the system file picker for a single PDF.
Future<String?> pickPdfFile() async {
  final result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: const ['pdf'],
  );
  return result?.files.single.path;
}

/// "Choose a PDF" card, or the chosen file with its page count.
class PdfPickCard extends StatelessWidget {
  const PdfPickCard({
    super.key,
    required this.path,
    required this.pageCount,
    required this.onPick,
    required this.accent,
    this.loading = false,
    this.locked = false,
  });

  final String? path;
  final int? pageCount;
  final VoidCallback? onPick;
  final Color accent;
  final bool loading;
  final bool locked;

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
                  l.pdfEditChoosePdf,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 4),
                Text(
                  l.pdfEditChooseHint,
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
    final subtitle = loading
        ? l.pdfEditReading
        : locked
        ? l.pdfEditLockedShort
        : pageCount == null
        ? ''
        : l.pdfEditPageCount(pageCount!);
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsetsDirectional.only(start: 16, end: 8),
        leading: Icon(Icons.picture_as_pdf_rounded, color: accent, size: 36),
        title: Text(
          p.basename(path!),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        subtitle: Text(subtitle),
        trailing: TextButton(
          style: TextButton.styleFrom(minimumSize: const Size(64, 48)),
          onPressed: onPick,
          child: Text(l.pdfEditChange),
        ),
      ),
    );
  }
}

/// Shown for password-protected files, with a shortcut to Unlock PDF.
class PdfLockedNotice extends StatelessWidget {
  const PdfLockedNotice({super.key, required this.path});

  final String path;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PdfInlineError(message: l.pdfEditLocked),
        const SizedBox(height: 12),
        OutlinedButton.icon(
          onPressed: () => context.push(
            AppRoutes.pdfUnlock,
            extra: ToolInput(paths: [path], kind: InputKind.pdf),
          ),
          icon: const Icon(Icons.lock_open_rounded),
          label: Text(l.toolUnlockPdfTitle),
        ),
      ],
    );
  }
}

/// Finished-file card with Save to Downloads / Share / Start over. Saving
/// goes through [FileUtils.saveToDownloads], which also records the file in
/// My Files and counts the job for the review prompt.
class PdfEditResultCard extends ConsumerStatefulWidget {
  const PdfEditResultCard({
    super.key,
    required this.file,
    required this.toolId,
    required this.accent,
    required this.onReset,
    this.headline,
    this.mimeType = 'application/pdf',
    this.ext = 'pdf',
  });

  final File file;
  final String toolId;
  final Color accent;
  final VoidCallback onReset;
  final String? headline;
  final String mimeType;
  final String ext;

  @override
  ConsumerState<PdfEditResultCard> createState() => _PdfEditResultCardState();
}

class _PdfEditResultCardState extends ConsumerState<PdfEditResultCard> {
  bool _saving = false;
  late final Future<int> _size = widget.file.length();

  Future<void> _save() async {
    final l = AppLocalizations.of(context);
    final messenger = ScaffoldMessenger.of(context);
    final ads = ref.read(adsServiceProvider);
    setState(() => _saving = true);
    final outcome = await FileUtils.saveToDownloads(
      sourcePath: widget.file.path,
      fileName: p.basenameWithoutExtension(widget.file.path),
      ext: widget.ext,
      mimeType: widget.mimeType,
      toolId: widget.toolId,
    );
    if (!mounted) return;
    setState(() => _saving = false);
    messenger.showSnackBar(
      SnackBar(
        content: Text(
          outcome == SaveOutcome.downloaded ? l.pdfEditSavedToDownloads : l.pdfEditSharedInstead,
        ),
      ),
    );
    await ads.showInterstitialIfAllowed();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l = AppLocalizations.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(Icons.check_circle_rounded, color: widget.accent, size: 56),
            const SizedBox(height: 12),
            Text(
              widget.headline ?? l.pdfEditResultReady,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 4),
            FutureBuilder<int>(
              future: _size,
              builder: (_, snap) => Text(
                snap.hasData
                    ? '${p.basename(widget.file.path)} · ${FileUtils.formatFileSize(snap.data!)}'
                    : p.basename(widget.file.path),
                textAlign: TextAlign.center,
                style: theme.textTheme.bodySmall,
              ),
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: _saving ? null : _save,
              icon: _saving
                  ? const SizedBox.square(
                      dimension: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.download_rounded),
              label: Text(l.pdfEditSaveDownloads),
            ),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: () => Share.shareXFiles([XFile(widget.file.path, mimeType: widget.mimeType)]),
              icon: const Icon(Icons.share_rounded),
              label: Text(l.pdfEditShare),
            ),
            const SizedBox(height: 8),
            TextButton(
              style: TextButton.styleFrom(minimumSize: const Size(64, 48)),
              onPressed: widget.onReset,
              child: Text(l.pdfEditStartOver),
            ),
          ],
        ),
      ),
    );
  }
}

class PdfInlineError extends StatelessWidget {
  const PdfInlineError({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 12),
      child: Semantics(
        liveRegion: true,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.error_outline_rounded, color: theme.colorScheme.error, size: 20),
            const SizedBox(width: 8),
            Expanded(
              child: Text(message, style: TextStyle(color: theme.colorScheme.error)),
            ),
          ],
        ),
      ),
    );
  }
}

/// Big primary action with an inline spinner while [busy].
class PdfActionButton extends StatelessWidget {
  const PdfActionButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
    this.busy = false,
  });

  final String label;
  final IconData icon;
  final VoidCallback? onPressed;
  final bool busy;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(52)),
      onPressed: busy ? null : onPressed,
      icon: busy
          ? const SizedBox.square(dimension: 18, child: CircularProgressIndicator(strokeWidth: 2))
          : Icon(icon),
      label: Text(label),
    );
  }
}

/// Small numbered heading for step-by-step screens ("1  Choose a PDF").
class PdfStepHeader extends StatelessWidget {
  const PdfStepHeader({super.key, required this.step, required this.title, required this.accent});

  final int step;
  final String title;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 20, bottom: 8),
      child: Row(
        children: [
          CircleAvatar(
            radius: 13,
            backgroundColor: accent,
            child: Text(
              '$step',
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 13),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800),
            ),
          ),
        ],
      ),
    );
  }
}
