import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utility_toolbox/core/utils/file_utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:utility_toolbox/core/utils/result.dart';
import 'package:utility_toolbox/core/widgets/glass_card.dart';
import 'package:utility_toolbox/core/widgets/gradient_icon_badge.dart';
import 'package:utility_toolbox/core/widgets/premium_button.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/features/image_compressor/providers/image_compressor_providers.dart';
import 'package:utility_toolbox/features/image_compressor/services/image_compressor_service.dart';

const _accentColor = Color(0xFF14B8A6);
const _accentGlow = Color(0xFF2DD9C4);
final _service = ImageCompressorService();

class ImageCompressorScreen extends ConsumerWidget {
  const ImageCompressorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final image = ref.watch(selectedImageProvider);
    final quality = ref.watch(qualityProvider);
    final state = ref.watch(compressionResultProvider);

    return ToolScaffold(
      title: 'Image Compressor',
      accentColor: _accentColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _PickerCard(
              image: image,
              onPick: (f) {
                ref.read(selectedImageProvider.notifier).state = f;
                ref.read(compressionResultProvider.notifier).state =
                    const Idle();
              },
            ),
            const SizedBox(height: 20),
            if (image != null) ...[
              _QualitySlider(quality: quality, ref: ref),
              const SizedBox(height: 20),
              PremiumButton(
                onPressed: state is Loading
                    ? null
                    : () => _compress(context, ref, image, quality.round()),
                icon: state is Loading ? null : Icons.compress_rounded,
                label: state is Loading ? 'Compressing…' : 'Compress Image',
                gradient: const LinearGradient(
                  colors: [_accentColor, _accentGlow],
                ),
              ),
            ],
            const SizedBox(height: 20),
            if (state is Success<CompressResult>)
              _ResultCard(result: state.data),
            if (state is ErrorResult<CompressResult>)
              _ErrorCard(message: state.message),
          ],
        ),
      ),
    );
  }

  Future<void> _compress(
    BuildContext context,
    WidgetRef ref,
    File image,
    int quality,
  ) async {
    ref.read(compressionResultProvider.notifier).state = const Loading();
    try {
      final originalSize = await image.length();
      final compressed = await _service.compress(
        source: image,
        quality: quality,
      );
      final compressedSize = await compressed.length();
      ref.read(compressionResultProvider.notifier).state = Success(
        CompressResult(
          originalBytes: originalSize,
          compressedBytes: compressedSize,
          compressedFile: compressed,
        ),
      );
    } catch (e) {
      ref.read(compressionResultProvider.notifier).state = ErrorResult(
        'Compression failed: $e',
      );
    }
  }
}

// ── Picker card ────────────────────────────────────────────────────────────

class _PickerCard extends StatelessWidget {
  const _PickerCard({required this.image, required this.onPick});

  final File? image;
  final void Function(File) onPick;

  Future<void> _chooseImage(BuildContext context) async {
    final picker = ImagePicker();
    final source = await showModalBottomSheet<ImageSource>(
      context: context,
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? const Color(0xFF1B2232)
          : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library_rounded, color: _accentColor),
                title: const Text('Choose from Gallery'),
                onTap: () => Navigator.pop(ctx, ImageSource.gallery),
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera_rounded, color: _accentColor),
                title: const Text('Take a Photo'),
                onTap: () => Navigator.pop(ctx, ImageSource.camera),
              ),
            ],
          ),
        ),
      ),
    );

    if (source != null) {
      final picked = await picker.pickImage(source: source);
      if (picked != null) onPick(File(picked.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () => _chooseImage(context),
      child: GlassCard(
        height: 220,
        padding: EdgeInsets.zero,
        accentColor: _accentColor,
        child: image == null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GradientIconBadge(
                    icon: Icons.add_photo_alternate_rounded,
                    gradient: const LinearGradient(
                      colors: [_accentColor, _accentGlow],
                    ),
                    size: 56,
                    iconSize: 26,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Tap to pick or capture an image',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'JPG, PNG, WEBP supported',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              )
            : Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.file(image!, fit: BoxFit.cover),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Material(
                      color: Colors.black.withValues(alpha: 0.65),
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: () => _chooseImage(context),
                        borderRadius: BorderRadius.circular(10),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.edit_rounded, color: Colors.white, size: 14),
                              SizedBox(width: 4),
                              Text(
                                'Change',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

// ── Quality slider ─────────────────────────────────────────────────────────

class _QualitySlider extends StatelessWidget {
  const _QualitySlider({required this.quality, required this.ref});

  final double quality;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Quality', style: theme.textTheme.labelLarge),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: _accentColor.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '${quality.round()}%',
                style: theme.textTheme.labelMedium?.copyWith(
                  color: _accentColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        Slider(
          value: quality,
          min: 10,
          max: 100,
          divisions: 90,
          activeColor: _accentColor,
          onChanged: (v) => ref.read(qualityProvider.notifier).state = v,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '10% (Max compress)',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            Text(
              '100% (Original)',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ── Result card ────────────────────────────────────────────────────────────

class _ResultCard extends StatelessWidget {
  const _ResultCard({required this.result});

  final CompressResult result;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GlassCard(
      padding: const EdgeInsets.all(20),
      accentColor: const Color(0xFF22C55E),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.check_circle_rounded, color: Color(0xFF22C55E)),
              const SizedBox(width: 8),
              Text(
                'Compressed successfully!',
                style: theme.textTheme.titleSmall?.copyWith(
                  color: const Color(0xFF22C55E),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _StatItem(
                label: 'Original',
                value: _formatBytes(result.originalBytes),
              ),
              const Icon(Icons.arrow_forward_rounded, size: 18),
              _StatItem(
                label: 'Compressed',
                value: _formatBytes(result.compressedBytes),
              ),
              _StatItem(
                label: 'Saved',
                value: '${result.savedPercent.toStringAsFixed(1)}%',
                highlight: true,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: PremiumOutlineButton(
                  onPressed: () => _share(result.compressedFile),
                  icon: Icons.share_rounded,
                  label: 'Share',
                  accent: const Color(0xFF22C55E),
                  dense: true,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: PremiumButton(
                  onPressed: () => _save(context, result.compressedFile),
                  icon: Icons.save_alt_rounded,
                  label: 'Save',
                  accent: const Color(0xFF22C55E),
                  dense: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _share(File file) async {
    await Share.shareXFiles([XFile(file.path)]);
  }

  Future<void> _save(BuildContext context, File file) async {
    final messenger = ScaffoldMessenger.of(context);
    final ok = await FileUtils.saveImageToGallery(
      bytes: await file.readAsBytes(),
      fileName: 'compressed_${DateTime.now().millisecondsSinceEpoch}.jpg',
      toolId: 'image_compressor',
    );
    messenger.showSnackBar(SnackBar(
      content: Text(ok ? 'Saved to gallery!' : 'Could not save to your gallery'),
    ));
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({
    required this.label,
    required this.value,
    this.highlight = false,
  });

  final String label;
  final String value;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w800,
              color: highlight
                  ? const Color(0xFF22C55E)
                  : theme.colorScheme.onSurface,
            ),
          ),
          Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _ErrorCard extends StatelessWidget {
  const _ErrorCard({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFEF4444).withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFEF4444).withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        children: [
          const Icon(Icons.error_outline_rounded, color: Color(0xFFEF4444)),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: const Color(0xFFEF4444),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String _formatBytes(int bytes) {
  if (bytes < 1024) return '$bytes B';
  if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
  return '${(bytes / (1024 * 1024)).toStringAsFixed(2)} MB';
}
