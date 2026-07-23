import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';
import 'package:share_plus/share_plus.dart';
import 'package:utility_toolbox/core/utils/result.dart';
import 'package:utility_toolbox/core/widgets/error_state.dart';
import 'package:utility_toolbox/core/widgets/loading_indicator.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/features/translation/providers/translation_providers.dart';

class TranslationScreen extends ConsumerWidget {
  const TranslationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languages = ref.watch(supportedLanguagesProvider);
    final source = ref.watch(sourceLanguageProvider);
    final target = ref.watch(targetLanguageProvider);
    final input = ref.watch(translationInputProvider);
    final resultState = ref.watch(translationResultProvider);
    final downloadState = ref.watch(modelDownloadStateProvider);
    final actions = ref.watch(translationActionsProvider);
    final sameLanguage = source.bcpCode == target.bcpCode;

    return ToolScaffold(
      title: 'Translation',
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'On-device AI · Models download once, then work offline',
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _LanguageDropdown(
                    label: 'From',
                    value: source,
                    languages: languages,
                    onChanged: (lang) =>
                        ref.read(sourceLanguageProvider.notifier).state = lang,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    ref.read(sourceLanguageProvider.notifier).state = target;
                    ref.read(targetLanguageProvider.notifier).state = source;
                  },
                  icon: const Icon(Icons.swap_horiz),
                ),
                Expanded(
                  child: _LanguageDropdown(
                    label: 'To',
                    value: target,
                    languages: languages,
                    onChanged: (lang) =>
                        ref.read(targetLanguageProvider.notifier).state = lang,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              maxLines: 5,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter text to translate',
              ),
              onChanged: (value) =>
                  ref.read(translationInputProvider.notifier).state = value,
            ),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: input.trim().isEmpty || sameLanguage || resultState is Loading<String>
                  ? null
                  : actions.translate,
              child: const Text('Translate'),
            ),
            const SizedBox(height: 16),
            if (downloadState is Loading<void>)
              const LoadingIndicator(message: 'Downloading language model…'),
            if (resultState is Loading<String>)
              const LoadingIndicator(message: 'Translating…'),
            if (resultState is ErrorResult<String>)
              ErrorState(
                message: resultState.message,
                onRetry: actions.translate,
              ),
            if (resultState is Success<String>) ...[
              Text(
                resultState.data,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  FilledButton.tonal(
                    onPressed: () async {
                      await Clipboard.setData(
                        ClipboardData(text: resultState.data),
                      );
                    },
                    child: const Text('Copy'),
                  ),
                  const SizedBox(width: 8),
                  FilledButton.tonal(
                    onPressed: () => Share.share(resultState.data),
                    child: const Text('Share'),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _LanguageDropdown extends StatelessWidget {
  const _LanguageDropdown({
    required this.label,
    required this.value,
    required this.languages,
    required this.onChanged,
  });

  final String label;
  final TranslateLanguage value;
  final List<TranslateLanguage> languages;
  final ValueChanged<TranslateLanguage> onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<TranslateLanguage>(
      value: value,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      items: languages
          .map(
            (lang) => DropdownMenuItem(
              value: lang,
              child: Text(lang.name, overflow: TextOverflow.ellipsis),
            ),
          )
          .toList(),
      onChanged: (lang) {
        if (lang != null) onChanged(lang);
      },
    );
  }
}
