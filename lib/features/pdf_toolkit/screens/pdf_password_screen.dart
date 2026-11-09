import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/features/pdf_toolkit/services/pdf_extra_service.dart';
import 'package:utility_toolbox/features/pdf_toolkit/widgets/pdf_tool_widgets.dart';

/// Lock PDF (add a password) and Unlock PDF (remove a password the user
/// knows) share one screen; [lock] picks the mode.
class PdfPasswordScreen extends ConsumerStatefulWidget {
  const PdfPasswordScreen({super.key, required this.lock, this.initialPath});

  final bool lock;
  final String? initialPath;

  @override
  ConsumerState<PdfPasswordScreen> createState() => _PdfPasswordScreenState();
}

class _PdfPasswordScreenState extends ConsumerState<PdfPasswordScreen> {
  String? _path;
  PdfInfo? _info;
  bool _inspecting = false;
  bool _working = false;
  bool _obscure = true;
  String? _error;
  File? _result;
  final _password = TextEditingController();
  final _confirm = TextEditingController();

  Color get _accent => widget.lock ? const Color(0xFF7C6FFF) : const Color(0xFF2ECC8A);

  @override
  void initState() {
    super.initState();
    if (widget.initialPath != null) _load(widget.initialPath!);
  }

  @override
  void dispose() {
    _password.dispose();
    _confirm.dispose();
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
    final path = _path;
    if (path == null) return;
    final password = _password.text;
    if (password.isEmpty) {
      setState(() => _error = 'Enter a password.');
      return;
    }
    if (widget.lock) {
      if (password.length < 4) {
        setState(() => _error = 'Use at least 4 characters.');
        return;
      }
      if (password != _confirm.text) {
        setState(() => _error = 'The passwords don’t match.');
        return;
      }
    }
    setState(() {
      _working = true;
      _error = null;
    });
    final service = ref.read(pdfExtraServiceProvider);
    try {
      final file = widget.lock
          ? await service.protect(path, password)
          : await service.unlock(path, password);
      if (!mounted) return;
      setState(() => _result = file);
    } on PdfPasswordException {
      if (!mounted) return;
      setState(() => _error = 'That password is not correct.');
    } catch (_) {
      if (!mounted) return;
      setState(() => _error = widget.lock ? 'Couldn’t lock this PDF.' : 'Couldn’t unlock this PDF.');
    } finally {
      if (mounted) setState(() => _working = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final info = _info;
    final lock = widget.lock;
    final ready = info != null && (lock ? !info.isEncrypted : info.isEncrypted);

    return ToolScaffold(
      title: lock ? 'Lock PDF' : 'Unlock PDF',
      accentColor: _accent,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (_result != null)
            PdfResultCard(
              file: _result!,
              toolId: lock ? 'protect_pdf' : 'unlock_pdf',
              accent: _accent,
              headline: lock ? 'Your PDF is locked' : 'Password removed',
              onReset: () => setState(() {
                _result = null;
                _password.clear();
                _confirm.clear();
              }),
            )
          else ...[
            PdfSourceCard(
              path: _path,
              info: info,
              loading: _inspecting,
              onPick: _pick,
              accent: _accent,
            ),
            if (info != null && lock && info.isEncrypted)
              const InlineError(message: 'This PDF already has a password. Unlock it first.'),
            if (info != null && !lock && !info.isEncrypted)
              const InlineError(message: 'This PDF has no password — nothing to unlock.'),
            if (ready) ...[
              const SizedBox(height: 16),
              TextField(
                controller: _password,
                obscureText: _obscure,
                autofillHints: const [AutofillHints.password],
                decoration: InputDecoration(
                  labelText: lock ? 'New password' : 'Current password',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(_obscure ? Icons.visibility_rounded : Icons.visibility_off_rounded),
                    onPressed: () => setState(() => _obscure = !_obscure),
                  ),
                ),
              ),
              if (lock) ...[
                const SizedBox(height: 12),
                TextField(
                  controller: _confirm,
                  obscureText: _obscure,
                  decoration: const InputDecoration(
                    labelText: 'Repeat password',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Keep this password safe — it can’t be recovered. Encrypted with AES-256.',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
              const SizedBox(height: 16),
              FilledButton.icon(
                style: FilledButton.styleFrom(backgroundColor: _accent),
                onPressed: _working ? null : _run,
                icon: _working
                    ? const SizedBox.square(
                        dimension: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Icon(lock ? Icons.lock_rounded : Icons.lock_open_rounded),
                label: Text(lock ? 'Lock PDF' : 'Unlock PDF'),
              ),
            ],
            if (_error != null) InlineError(message: _error!),
          ],
        ],
      ),
    );
  }
}
