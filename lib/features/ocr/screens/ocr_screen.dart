import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:utility_toolbox/core/services/ads_service.dart';
import 'package:utility_toolbox/core/services/permission_service.dart';
import 'package:utility_toolbox/core/utils/result.dart';
import 'package:utility_toolbox/core/widgets/empty_state.dart';
import 'package:utility_toolbox/core/widgets/error_state.dart';
import 'package:utility_toolbox/core/widgets/loading_indicator.dart';
import 'package:utility_toolbox/core/theme/app_colors.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/features/ocr/providers/ocr_providers.dart';

class OcrScreen extends ConsumerWidget {
  const OcrScreen({super.key});

  Future<void> _pickImage(WidgetRef ref, ImageSource source) async {
    final permission = ref.read(permissionServiceProvider);
    final outcome = source == ImageSource.camera
        ? await permission.requestCamera()
        : await permission.requestPhotos();

    if (outcome != PermissionOutcome.granted) {
      ref.read(ocrResultProvider.notifier).state = ErrorResult(
        outcome == PermissionOutcome.permanentlyDenied
            ? 'Permission denied. Open Settings to allow access.'
            : 'Permission is required to pick an image.',
      );
      return;
    }

    final picker = ImagePicker();
    final picked = await picker.pickImage(source: source);
    if (picked == null) return;

    final file = File(picked.path);
    ref.read(ocrImageProvider.notifier).state = file;
    ref.read(ocrResultProvider.notifier).state = const Loading();

    try {
      final text = await ref.read(ocrServiceProvider).recognizeText(file.path);
      ref.read(ocrTextProvider.notifier).state = text;
      ref.read(ocrResultProvider.notifier).state = Success(text);
    } catch (_) {
      ref.read(ocrResultProvider.notifier).state = const ErrorResult(
        'Could not read text from this image.',
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resultState = ref.watch(ocrResultProvider);
    final text = ref.watch(ocrTextProvider);

    return ToolScaffold(
      title: 'OCR',
      accentColor: AppColors.toolAccent('ocr'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              'On-device AI · Text is processed locally on your phone',
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(child: _buildBody(context, ref, resultState, text)),
        ],
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    WidgetRef ref,
    Result<String> resultState,
    String text,
  ) {
    return switch (resultState) {
      Idle() => EmptyState(
        icon: Icons.document_scanner_outlined,
        message: 'Pick a photo to extract editable text.',
        action: _pickButtons(ref),
      ),
      Loading() => const LoadingIndicator(message: 'Recognizing text…'),
      ErrorResult(message: final msg) => ErrorState(
        message: msg,
        onRetry: () {
          ref.read(ocrResultProvider.notifier).state = const Idle();
          ref.read(ocrImageProvider.notifier).state = null;
        },
      ),
      Success(data: final recognized) => _SuccessView(
        text: text.isEmpty ? recognized : text,
        onTextChanged: (value) =>
            ref.read(ocrTextProvider.notifier).state = value,
        onDone: () async {
          await ref.read(adsServiceProvider).showInterstitialIfAllowed();
          ref.read(ocrResultProvider.notifier).state = const Idle();
          ref.read(ocrImageProvider.notifier).state = null;
          ref.read(ocrTextProvider.notifier).state = '';
        },
      ),
    };
  }

  Widget _pickButtons(WidgetRef ref) {
    return Wrap(
      spacing: 8,
      alignment: WrapAlignment.center,
      children: [
        FilledButton.icon(
          onPressed: () => _pickImage(ref, ImageSource.camera),
          icon: const Icon(Icons.camera_alt),
          label: const Text('Camera'),
        ),
        FilledButton.tonalIcon(
          onPressed: () => _pickImage(ref, ImageSource.gallery),
          icon: const Icon(Icons.photo_library_outlined),
          label: const Text('Gallery'),
        ),
      ],
    );
  }
}

class _SuccessView extends StatefulWidget {
  const _SuccessView({
    required this.text,
    required this.onTextChanged,
    required this.onDone,
  });

  final String text;
  final ValueChanged<String> onTextChanged;
  final VoidCallback onDone;

  @override
  State<_SuccessView> createState() => _SuccessViewState();
}

class _SuccessViewState extends State<_SuccessView> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.text);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.text.isEmpty) {
      return const EmptyState(
        icon: Icons.text_snippet_outlined,
        message: 'No text found — try a clearer photo.',
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              maxLines: null,
              expands: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
              onChanged: widget.onTextChanged,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: FilledButton.tonal(
                  onPressed: () async {
                    await Clipboard.setData(
                      ClipboardData(text: _controller.text),
                    );
                  },
                  child: const Text('Copy'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: FilledButton.tonal(
                  onPressed: () => Share.share(_controller.text),
                  child: const Text('Share'),
                ),
              ),
              const SizedBox(width: 8),
              FilledButton(onPressed: widget.onDone, child: const Text('Done')),
            ],
          ),
        ],
      ),
    );
  }
}
