import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utility_toolbox/core/utils/result.dart';
import 'package:utility_toolbox/core/widgets/premium_button.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/features/hash_generator/providers/hash_providers.dart';

const _accentColor = Color(0xFF3B82F6);
const _accentGlow  = Color(0xFF60A5FA);

class HashGeneratorScreen extends ConsumerWidget {
  const HashGeneratorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final algo       = ref.watch(selectedAlgoProvider);
    final isFileMode = ref.watch(isFileHashModeProvider);

    return ToolScaffold(
      title: 'Hash Generator',
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
                    label: 'Text',
                    selected: !isFileMode,
                    onTap: () =>
                        ref.read(isFileHashModeProvider.notifier).state = false,
                  ),
                  _ModeTab(
                    label: 'File',
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
            style: TextStyle(
              color: selected
                  ? Colors.white
                  : Theme.of(context).colorScheme.onSurfaceVariant,
              fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
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
        Text('Algorithm', style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
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
              onSelected: (_) =>
                  ref.read(selectedAlgoProvider.notifier).state = a,
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
        TextField(
          minLines: 4,
          maxLines: 6,
          decoration: InputDecoration(
            hintText: 'Enter text to hash…',
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GestureDetector(
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
                        'Tap to pick a file',
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
                            file.path.split('/').last,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        TextButton(
                          onPressed: () => _pickFile(context, watchRef),
                          child: const Text('Change'),
                        ),
                      ],
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
            label: result is Loading ? 'Hashing…' : 'Generate Hash',
            gradient: const LinearGradient(colors: [_accentColor, _accentGlow]),
          ),
        const SizedBox(height: 16),
        if (result is Success<String>)
          _HashOutput(hash: result.data, algo: algo),
        if (result is ErrorResult<String>)
          Text(
            result.message,
            style: const TextStyle(color: Color(0xFFEF4444)),
          ),
      ],
    );
  }

  Future<void> _pickFile(BuildContext context, WidgetRef ref) async {
    final result = await FilePicker.platform.pickFiles();
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
                    const SnackBar(
                      content: Text('Hash copied!'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                icon: const Icon(Icons.copy_rounded, size: 18),
                tooltip: 'Copy hash',
                color: _accentColor,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
          const SizedBox(height: 8),
          SelectableText(
            hash,
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
