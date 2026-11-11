import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import 'package:utility_toolbox/core/theme/app_colors.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:intl/intl.dart';
import 'package:utility_toolbox/features/text_utilities/providers/text_utilities_providers.dart';
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';

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

  Future<void> _copy(String value) async {
    await Clipboard.setData(ClipboardData(text: value));
    if (!mounted) return;
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context).commonCopied),
          duration: const Duration(seconds: 2),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final l             = AppLocalizations.of(context);
    final numbers       = NumberFormat.decimalPattern(
      Localizations.localeOf(context).toLanguageTag(),
    );
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
      title: l.toolTextUtilitiesTitle,
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
            Wrap(
              spacing: 8,
              runSpacing: 8,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 4),
                  child: Text(l.textUtilMode, style: theme.textTheme.labelLarge),
                ),
                ChoiceChip(
                  label: Text(l.textUtilModeText),
                  selected: !base64Mode,
                  onSelected: (_) {
                    ref.read(base64ModeProvider.notifier).state = false;
                    ref.read(base64OutputProvider.notifier).state = '';
                    ref.read(base64ErrorProvider.notifier).state = null;
                  },
                ),
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
                hintText: base64Mode ? l.textUtilHintBase64 : l.textUtilHint,
                suffixIcon: text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear_rounded, size: 18),
                        tooltip: l.commonClear,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _StatChip(
                        label: l.textUtilWords(words),
                        value: numbers.format(words),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _StatChip(
                        label: l.textUtilCharacters(chars),
                        value: numbers.format(chars),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _StatChip(
                        label: l.textUtilNoSpaces,
                        value: numbers.format(charsNoSpaces),
                      ),
                    ),
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
                    label: l.textUtilUpper,
                    enabled: text.isNotEmpty,
                    onTap: () =>
                        _applyTransform(service.toUpperCase(text)),
                  ),
                  _ActionChip(
                    label: l.textUtilLower,
                    enabled: text.isNotEmpty,
                    onTap: () =>
                        _applyTransform(service.toLowerCase(text)),
                  ),
                  _ActionChip(
                    label: l.textUtilTitle,
                    enabled: text.isNotEmpty,
                    onTap: () =>
                        _applyTransform(service.toTitleCase(text)),
                  ),
                  _ActionChip(
                    label: l.textUtilSentence,
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
                        onPressed: () => _copy(text),
                        icon: const Icon(Icons.copy_rounded, size: 18),
                        label: Text(l.commonCopy),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () => Share.share(text),
                        icon: const Icon(Icons.share_rounded, size: 18),
                        label: Text(l.commonShare),
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
                      label: Text(l.textUtilEncode),
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
                                    .state = 'invalid';
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
                      label: Text(l.textUtilDecode),
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
                  labelText: l.textUtilOutput,
                  errorText:
                      base64Error == null ? null : l.textUtilInvalidBase64,
                  suffixIcon: base64Output.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.copy_rounded, size: 18),
                          tooltip: l.commonCopy,
                          onPressed: () => _copy(base64Output),
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
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
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
