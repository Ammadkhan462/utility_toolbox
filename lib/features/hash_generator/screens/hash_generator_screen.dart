import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utility_toolbox/core/utils/result.dart';
import 'package:utility_toolbox/core/widgets/premium_button.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/features/hash_generator/providers/hash_providers.dart';
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';

const _accentColor = Color(0xFF3B82F6);
const _accentGlow  = Color(0xFF60A5FA);

class HashGeneratorScreen extends ConsumerWidget {
  const HashGeneratorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final algo       = ref.watch(selectedAlgoProvider);
    final isFileMode = ref.watch(isFileHashModeProvider);
    final l          = AppLocalizations.of(context);

    return ToolScaffold(
      title: l.toolHashGeneratorTitle,
      accentColor: _accentColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Mode toggle
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.4),
                ),
              ),
              child: Row(
                children: [
                  _ModeTab(
                    label: l.hashModeText,
                    selected: !isFileMode,
                    onTap: () =>
                        ref.read(isFileHashModeProvider.notifier).state = false,
                  ),
                  _ModeTab(
                    label: l.hashModeFile,
                    selected: isFileMode,
                    onTap: () =>
                        ref.read(isFileHashModeProvider.notifier).state = true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Algorithm selector
            _AlgorithmSelector(algo: algo, ref: ref),
            const SizedBox(height: 20),

            // Input
            if (!isFileMode)
              _TextHashSection(algo: algo)
            else
              _FileHashSection(algo: algo, ref: ref),
          ],
        ),
      ),
    );
  }
}

// ── Mode tab ───────────────────────────────────────────────────────────────

class _ModeTab extends StatelessWidget {
  const _ModeTab({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool   selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Semantics(
        button: true,
        selected: selected,
        child: GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.all(4),
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: selected
                  ? _accentColor
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: selected
                    ? Colors.white
                    : Theme.of(context).colorScheme.onSurfaceVariant,
                fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ── Algorithm selector ─────────────────────────────────────────────────────

class _AlgorithmSelector extends StatelessWidget {
  const _AlgorithmSelector({required this.algo, required this.ref});

  final HashAlgorithm algo;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppLocalizations.of(context).hashAlgorithm,
            style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 4,
          children: HashAlgorithm.values.map((a) {
            final selected = a == algo;
            return ChoiceChip(
              label: Text(a.name.toUpperCase()),
              selected: selected,
              selectedColor: _accentColor.withValues(alpha: 0.15),
              labelStyle: TextStyle(
                color: selected
                    ? _accentColor
                    : Theme.of(context).colorScheme.onSurfaceVariant,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w400,
              ),
              side: BorderSide(
                color: selected
                    ? _accentColor.withValues(alpha: 0.5)
                    : Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
              ),
              onSelected: (_) {
                if (a == algo) return;
                ref.read(selectedAlgoProvider.notifier).state = a;
                // A file hash computed with the old algorithm would otherwise
                // be shown under the new algorithm's label.
                ref.read(fileHashResultProvider.notifier).reset();
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}

// ── Text mode ──────────────────────────────────────────────────────────────

class _TextHashSection extends ConsumerWidget {
  const _TextHashSection({required this.algo});

  final HashAlgorithm algo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hash = ref.watch(textHashProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // TextFormField + initialValue: hashInputProvider outlives this widget
        // (mode switch / leaving the screen), so the field must start from
        // it, or an empty box would show the hash of the old text.
        TextFormField(
          initialValue: ref.read(hashInputProvider),
          minLines: 4,
          maxLines: 6,
          decoration: InputDecoration(
            hintText: AppLocalizations.of(context).hashInputHint,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
            filled: true,
          ),
          onChanged: (v) =>
              ref.read(hashInputProvider.notifier).state = v,
        ),
        const SizedBox(height: 20),
        if (hash.isNotEmpty) _HashOutput(hash: hash, algo: algo),
      ],
    );
  }
}

// ── File mode ──────────────────────────────────────────────────────────────

class _FileHashSection extends ConsumerWidget {
  const _FileHashSection({required this.algo, required this.ref});

  final HashAlgorithm algo;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context, WidgetRef watchRef) {
    final file   = watchRef.watch(hashFileProvider);
    final result = watchRef.watch(fileHashResultProvider);
    final l      = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Semantics(
          button: true,
          child: GestureDetector(
            onTap: () => _pickFile(context, watchRef),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: _accentColor.withValues(alpha: 0.4),
                  width: 1.5,
                ),
              ),
              child: file == null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.upload_file_rounded,
                            color: _accentColor, size: 32),
                        const SizedBox(height: 8),
                        Text(
                          l.hashPickFile,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Theme.of(context).colorScheme.onSurfaceVariant,
                              ),
                        ),
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          const Icon(Icons.insert_drive_file_rounded,
                              color: _accentColor),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              file.path.split(Platform.pathSeparator).last,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          TextButton(
                            onPressed: () => _pickFile(context, watchRef),
                            child: Text(l.hashChange),
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        if (file != null)
          PremiumButton(
            onPressed: result is Loading
                ? null
                : () => watchRef
                      .read(fileHashResultProvider.notifier)
                      .hash(file, algo),
            icon: result is Loading ? null : Icons.tag_rounded,
            label: result is Loading ? l.hashHashing : l.hashGenerate,
            gradient: const LinearGradient(colors: [_accentColor, _accentGlow]),
          ),
        const SizedBox(height: 16),
        if (result is Success<String>)
          _HashOutput(hash: result.data, algo: algo),
        if (result is ErrorResult<String>)
          Text(
            l.hashFileError,
            style: const TextStyle(color: Color(0xFFEF4444)),
          ),
      ],
    );
  }

  static bool _picking = false;

  Future<void> _pickFile(BuildContext context, WidgetRef ref) async {
    // A second tap while the picker is open throws "already_active".
    if (_picking) return;
    _picking = true;
    final FilePickerResult? result;
    try {
      result = await FilePicker.platform.pickFiles();
    } catch (_) {
      return;
    } finally {
      _picking = false;
    }
    // The screen may have been closed while the picker was open; `ref` must
    // not be used after the widget is disposed.
    if (!context.mounted) return;
    if (result != null && result.files.single.path != null) {
      ref.read(hashFileProvider.notifier).state =
          File(result.files.single.path!);
      ref.read(fileHashResultProvider.notifier).reset();
    }
  }
}

// ── Hash output ────────────────────────────────────────────────────────────

class _HashOutput extends StatelessWidget {
  const _HashOutput({required this.hash, required this.algo});

  final String hash;
  final HashAlgorithm algo;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l = AppLocalizations.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _accentColor.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _accentColor.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                algo.name.toUpperCase(),
                style: theme.textTheme.labelSmall?.copyWith(
                  color: _accentColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              IconButton(
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: hash));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(l.hashCopied),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                icon: const Icon(Icons.copy_rounded, size: 18),
                tooltip: l.hashCopy,
                color: _accentColor,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
          const SizedBox(height: 8),
          SelectableText(
            hash,
            textDirection: TextDirection.ltr,
            style: theme.textTheme.bodySmall?.copyWith(
              fontFamily: 'monospace',
              letterSpacing: 0.5,
              color: theme.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
