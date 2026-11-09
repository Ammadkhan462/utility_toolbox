import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import 'package:utility_toolbox/core/theme/app_colors.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/features/text_utilities/providers/text_utilities_providers.dart';

class TextUtilitiesScreen extends ConsumerStatefulWidget {
  const TextUtilitiesScreen({super.key, this.initialText});

  final String? initialText;

  @override
  ConsumerState<TextUtilitiesScreen> createState() =>
      _TextUtilitiesScreenState();
}

class _TextUtilitiesScreenState extends ConsumerState<TextUtilitiesScreen> {
  // FIX: Controller must live here, NOT recreated on every build.
  // Recreating it per build resets the cursor to position 0.
  late final TextEditingController _inputCtrl;
  late final TextEditingController _outputCtrl;

  @override
  void initState() {
    super.initState();
    _inputCtrl  = TextEditingController(text: widget.initialText);
    _outputCtrl = TextEditingController();
    final initial = widget.initialText;
    if (initial != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) ref.read(textInputProvider.notifier).state = initial;
      });
    }
  }

  @override
  void dispose() {
    _inputCtrl.dispose();
    _outputCtrl.dispose();
    super.dispose();
  }

  void _applyTransform(String transformed) {
    ref.read(textInputProvider.notifier).state = transformed;
    _inputCtrl.value = TextEditingValue(
      text: transformed,
      selection: TextSelection.collapsed(offset: transformed.length),
    );
  }

  @override
  Widget build(BuildContext context) {
    final text          = ref.watch(textInputProvider);
    final base64Mode    = ref.watch(base64ModeProvider);
    final base64Output  = ref.watch(base64OutputProvider);
    final base64Error   = ref.watch(base64ErrorProvider);
    final words         = ref.watch(wordCountProvider);
    final chars         = ref.watch(characterCountProvider);
    final charsNoSpaces = ref.watch(characterCountNoSpacesProvider);
    final service       = ref.watch(textServiceProvider);
    final theme         = Theme.of(context);

    // Sync output controller
    if (_outputCtrl.text != base64Output) {
      _outputCtrl.text = base64Output;
    }

    return ToolScaffold(
      title: 'Text Utilities',
      accentColor: AppColors.toolAccent('text_utilities'),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(
          16, 8, 16,
          MediaQuery.viewInsetsOf(context).bottom + 16,
        ),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ── Mode toggle ────────────────────────────────────────
            Row(
              children: [
                Text('Mode', style: theme.textTheme.labelLarge),
                const SizedBox(width: 12),
                ChoiceChip(
                  label: const Text('Text'),
                  selected: !base64Mode,
                  onSelected: (_) {
                    ref.read(base64ModeProvider.notifier).state = false;
                    ref.read(base64OutputProvider.notifier).state = '';
                    ref.read(base64ErrorProvider.notifier).state = null;
                  },
                ),
                const SizedBox(width: 8),
                ChoiceChip(
                  label: const Text('Base64'),
                  selected: base64Mode,
                  onSelected: (_) {
                    ref.read(base64ModeProvider.notifier).state = true;
                    ref.read(base64OutputProvider.notifier).state = '';
                    ref.read(base64ErrorProvider.notifier).state = null;
                  },
                ),
              ],
            ),
            const SizedBox(height: 12),

            // ── Input ──────────────────────────────────────────────
            TextField(
              controller: _inputCtrl,
              maxLines: 8,
              minLines: 4,
              textInputAction: TextInputAction.newline,
              decoration: InputDecoration(
                hintText: base64Mode
                    ? 'Enter text or Base64 to convert…'
                    : 'Enter text here…',
                suffixIcon: text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear_rounded, size: 18),
                        onPressed: () {
                          _inputCtrl.clear();
                          ref.read(textInputProvider.notifier).state = '';
                          ref.read(base64OutputProvider.notifier).state = '';
                          ref.read(base64ErrorProvider.notifier).state = null;
                        },
                      )
                    : null,
              ),
              onChanged: (v) =>
                  ref.read(textInputProvider.notifier).state = v,
            ),
            const SizedBox(height: 12),

            // ── Stats ─────────────────────────────────────────────
            if (!base64Mode && text.isNotEmpty) ...[
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.toolAccent('text_utilities')
                      .withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: AppColors.toolAccent('text_utilities')
                        .withValues(alpha: 0.2),
                  ),
                ),
                child: Row(
                  children: [
                    _StatChip(label: 'Words', value: '$words'),
                    const SizedBox(width: 16),
                    _StatChip(label: 'Chars', value: '$chars'),
                    const SizedBox(width: 16),
                    _StatChip(
                        label: 'No spaces', value: '$charsNoSpaces'),
                  ],
                ),
              ),
              const SizedBox(height: 12),
            ],

            // ── Case transform buttons ─────────────────────────────
            if (!base64Mode) ...[
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _ActionChip(
                    label: 'UPPERCASE',
                    enabled: text.isNotEmpty,
                    onTap: () =>
                        _applyTransform(service.toUpperCase(text)),
                  ),
                  _ActionChip(
                    label: 'lowercase',
                    enabled: text.isNotEmpty,
                    onTap: () =>
                        _applyTransform(service.toLowerCase(text)),
                  ),
                  _ActionChip(
                    label: 'Title Case',
                    enabled: text.isNotEmpty,
                    onTap: () =>
                        _applyTransform(service.toTitleCase(text)),
                  ),
                  _ActionChip(
                    label: 'Sentence case',
                    enabled: text.isNotEmpty,
                    onTap: () =>
                        _applyTransform(service.toSentenceCase(text)),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              if (text.isNotEmpty)
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () => Clipboard.setData(
                            ClipboardData(text: text)),
                        icon: const Icon(Icons.copy_rounded, size: 18),
                        label: const Text('Copy'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () => Share.share(text),
                        icon: const Icon(Icons.share_rounded, size: 18),
                        label: const Text('Share'),
                      ),
                    ),
                  ],
                ),
            ],

            // ── Base64 section ─────────────────────────────────────
            if (base64Mode) ...[
              Row(
                children: [
                  Expanded(
                    child: FilledButton.icon(
                      onPressed: text.isEmpty
                          ? null
                          : () {
                              final encoded =
                                  service.encodeBase64(text);
                              ref
                                  .read(base64OutputProvider.notifier)
                                  .state = encoded;
                              ref
                                  .read(base64ErrorProvider.notifier)
                                  .state = null;
                            },
                      icon: const Icon(Icons.lock_outline_rounded,
                          size: 18),
                      label: const Text('Encode'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: FilledButton.icon(
                      onPressed: text.isEmpty
                          ? null
                          : () {
                              final decoded =
                                  service.decodeBase64(text);
                              if (decoded == null) {
                                ref
                                    .read(base64ErrorProvider.notifier)
                                    .state = 'Invalid Base64 input';
                                ref
                                    .read(base64OutputProvider.notifier)
                                    .state = '';
                              } else {
                                ref
                                    .read(base64OutputProvider.notifier)
                                    .state = decoded;
                                ref
                                    .read(base64ErrorProvider.notifier)
                                    .state = null;
                              }
                            },
                      icon: const Icon(Icons.lock_open_rounded,
                          size: 18),
                      label: const Text('Decode'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _outputCtrl,
                readOnly: true,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: 'Output',
                  errorText: base64Error,
                  suffixIcon: base64Output.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.copy_rounded, size: 18),
                          onPressed: () => Clipboard.setData(
                              ClipboardData(text: base64Output)),
                        )
                      : null,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  const _StatChip({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.toolAccent('text_utilities'),
          ),
        ),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

class _ActionChip extends StatelessWidget {
  const _ActionChip({
    required this.label,
    required this.enabled,
    required this.onTap,
  });

  final String label;
  final bool   enabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: Text(label),
      onPressed: enabled ? onTap : null,
    );
  }
}
