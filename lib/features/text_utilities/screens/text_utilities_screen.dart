import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utility_toolbox/core/theme/app_colors.dart';
import 'package:utility_toolbox/core/widgets/empty_state.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/features/text_utilities/providers/text_utilities_providers.dart';

class TextUtilitiesScreen extends ConsumerWidget {
  const TextUtilitiesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = ref.watch(textInputProvider);
    final base64Mode = ref.watch(base64ModeProvider);
    final base64Output = ref.watch(base64OutputProvider);
    final base64Error = ref.watch(base64ErrorProvider);
    final words = ref.watch(wordCountProvider);
    final chars = ref.watch(characterCountProvider);
    final charsNoSpaces = ref.watch(characterCountNoSpacesProvider);
    final service = ref.watch(textServiceProvider);

    if (text.isEmpty && !base64Mode) {
      return ToolScaffold(
        title: 'Text Utilities',
        accentColor: AppColors.toolAccent('text_utilities'),
        body: EmptyState(
          icon: Icons.text_fields,
          message:
              'Enter text below to count words, transform case, or encode/decode Base64.',
          action: _buildEditor(
            ref,
            text,
            base64Mode,
            base64Output,
            base64Error,
            service,
          ),
        ),
      );
    }

    return ToolScaffold(
      title: 'Text Utilities',
      accentColor: AppColors.toolAccent('text_utilities'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildEditor(
              ref,
              text,
              base64Mode,
              base64Output,
              base64Error,
              service,
            ),
            const SizedBox(height: 12),
            if (!base64Mode)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    'Words: $words · Characters: $chars · Without spaces: $charsNoSpaces',
                  ),
                ),
              ),
            if (!base64Mode) ...[
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  FilledButton.tonal(
                    onPressed: text.isEmpty
                        ? null
                        : () => ref.read(textInputProvider.notifier).state =
                              service.toUpperCase(text),
                    child: const Text('UPPERCASE'),
                  ),
                  FilledButton.tonal(
                    onPressed: text.isEmpty
                        ? null
                        : () => ref.read(textInputProvider.notifier).state =
                              service.toLowerCase(text),
                    child: const Text('lowercase'),
                  ),
                  FilledButton.tonal(
                    onPressed: text.isEmpty
                        ? null
                        : () => ref.read(textInputProvider.notifier).state =
                              service.toTitleCase(text),
                    child: const Text('Title Case'),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildEditor(
    WidgetRef ref,
    String text,
    bool base64Mode,
    String base64Output,
    String? base64Error,
    service,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SwitchListTile(
          title: const Text('Base64 mode'),
          value: base64Mode,
          onChanged: (value) {
            ref.read(base64ModeProvider.notifier).state = value;
            ref.read(base64OutputProvider.notifier).state = '';
            ref.read(base64ErrorProvider.notifier).state = null;
          },
        ),
        TextField(
          maxLines: 8,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: base64Mode ? 'Text or Base64 input' : 'Enter text…',
          ),
          controller: TextEditingController(text: text)
            ..selection = TextSelection.collapsed(offset: text.length),
          onChanged: (value) =>
              ref.read(textInputProvider.notifier).state = value,
        ),
        if (base64Mode) ...[
          const SizedBox(height: 12),
          FilledButton(
            onPressed: text.isEmpty
                ? null
                : () {
                    final encode = !text.contains(' ');
                    if (encode) {
                      ref.read(base64OutputProvider.notifier).state = service
                          .encodeBase64(text);
                      ref.read(base64ErrorProvider.notifier).state = null;
                    } else {
                      final decoded = service.decodeBase64(text);
                      if (decoded == null) {
                        ref.read(base64ErrorProvider.notifier).state =
                            'Invalid Base64 input';
                        ref.read(base64OutputProvider.notifier).state = '';
                      } else {
                        ref.read(base64OutputProvider.notifier).state = decoded;
                        ref.read(base64ErrorProvider.notifier).state = null;
                      }
                    }
                  },
            child: const Text('Convert'),
          ),
          const SizedBox(height: 12),
          TextField(
            readOnly: true,
            maxLines: 4,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: 'Output',
              errorText: base64Error,
            ),
            controller: TextEditingController(text: base64Output),
          ),
        ],
      ],
    );
  }
}
