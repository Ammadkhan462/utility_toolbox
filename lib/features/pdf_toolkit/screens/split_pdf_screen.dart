import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/features/pdf_toolkit/services/pdf_extra_service.dart';
import 'package:utility_toolbox/features/pdf_toolkit/widgets/pdf_tool_widgets.dart';

enum _SplitMode { keep, remove }

/// Extract pages into a new PDF, or remove pages from it.
class SplitPdfScreen extends ConsumerStatefulWidget {
  const SplitPdfScreen({super.key, this.initialPath});

  final String? initialPath;

  @override
  ConsumerState<SplitPdfScreen> createState() => _SplitPdfScreenState();
}

class _SplitPdfScreenState extends ConsumerState<SplitPdfScreen> {
  static const _accent = Color(0xFFFF5C7A);

  String? _path;
  PdfInfo? _info;
  bool _inspecting = false;
  bool _working = false;
  String? _error;
  File? _result;
  _SplitMode _mode = _SplitMode.keep;
  final _ranges = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.initialPath != null) _load(widget.initialPath!);
  }

  @override
  void dispose() {
    _ranges.dispose();
    super.dispose();
  }

  Future<void> _pick() async {
    final path = await pickPdfPath();
    if (path != null) await _load(path);
  }

  Future<void> _load(String path) async {
    setState(() {
      _path = path;
      _info = null;
      _result = null;
      _error = null;
      _inspecting = true;
    });
    try {
      final info = await ref.read(pdfExtraServiceProvider).inspect(path);
      if (!mounted) return;
      setState(() => _info = info);
    } catch (_) {
      if (!mounted) return;
      setState(() => _error = 'This file doesn’t look like a valid PDF.');
    } finally {
      if (mounted) setState(() => _inspecting = false);
    }
  }

  Future<void> _run() async {
    final info = _info;
    final path = _path;
    if (info == null || path == null) return;
    final count = info.pageCount;
    List<int> selected;
    try {
      selected = parsePageRanges(_ranges.text, count);
    } on FormatException catch (e) {
      setState(() => _error = e.message);
      return;
    }
    final keep = _mode == _SplitMode.keep
        ? selected
        : [for (var i = 0; i < count; i++) if (!selected.contains(i)) i];
    if (keep.isEmpty) {
      setState(() => _error = 'That would remove every page.');
      return;
    }
    setState(() {
      _working = true;
      _error = null;
    });
    try {
      final file = await ref.read(pdfExtraServiceProvider).keepPages(path, keep);
      if (!mounted) return;
      setState(() => _result = file);
    } catch (_) {
      if (!mounted) return;
      setState(() => _error = 'Couldn’t split this PDF.');
    } finally {
      if (mounted) setState(() => _working = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final info = _info;
    return ToolScaffold(
      title: 'Split PDF',
      accentColor: _accent,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (_result != null)
            PdfResultCard(
              file: _result!,
              toolId: 'split_pdf',
              accent: _accent,
              onReset: () => setState(() => _result = null),
            )
          else ...[
            PdfSourceCard(
              path: _path,
              info: info,
              loading: _inspecting,
              onPick: _pick,
              accent: _accent,
            ),
            if (info != null && info.isEncrypted)
              const InlineError(
                message: 'This PDF is password protected. Unlock it first with Unlock PDF.',
              ),
            if (info != null && !info.isEncrypted) ...[
              const SizedBox(height: 16),
              SegmentedButton<_SplitMode>(
                segments: const [
                  ButtonSegment(
                    value: _SplitMode.keep,
                    icon: Icon(Icons.content_cut_rounded),
                    label: Text('Extract pages'),
                  ),
                  ButtonSegment(
                    value: _SplitMode.remove,
                    icon: Icon(Icons.delete_outline_rounded),
                    label: Text('Remove pages'),
                  ),
                ],
                selected: {_mode},
                onSelectionChanged: (s) => setState(() => _mode = s.first),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _ranges,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Pages (1–${info.pageCount})',
                  hintText: 'e.g. 1-3, 5, 8-',
                  helperText: 'Use commas and ranges. “8-” means page 8 to the end.',
                  border: const OutlineInputBorder(),
                ),
                onSubmitted: (_) => _run(),
              ),
              const SizedBox(height: 16),
              FilledButton.icon(
                style: FilledButton.styleFrom(backgroundColor: _accent),
                onPressed: _working ? null : _run,
                icon: _working
                    ? const SizedBox.square(
                        dimension: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.call_split_rounded),
                label: Text(_mode == _SplitMode.keep ? 'Extract pages' : 'Remove pages'),
              ),
            ],
            if (_error != null) InlineError(message: _error!),
          ],
        ],
      ),
    );
  }
}
