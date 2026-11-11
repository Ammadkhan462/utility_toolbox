import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';

const _accentColor = Color(0xFF14B8A6);
const _accentGlow = Color(0xFF2DD9C4);
final _service = ImageCompressorService();

/// ErrorResult marker; the screen shows the localized message for it.
const _kCompressFailed = 'compress_failed';

class ImageCompressorScreen extends ConsumerWidget {
  const ImageCompressorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final image = ref.watch(selectedImageProvider);
    final quality = ref.watch(qualityProvider);
    final mode = ref.watch(compressModeProvider);
    final targetKb = ref.watch(targetKbProvider);
    final state = ref.watch(compressionResultProvider);
    final l = AppLocalizations.of(context);

    return ToolScaffold(
      title: l.toolImageCompressorTitle,
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
              _ModePicker(mode: mode, ref: ref),
              const SizedBox(height: 16),
              if (mode == CompressMode.quality)
                _QualitySlider(quality: quality, ref: ref)
              else
                _TargetPicker(targetKb: targetKb, ref: ref),
              const SizedBox(height: 20),
              PremiumButton(
                onPressed: state is Loading
                    ? null
                    : () => _compress(
                        context,
                        ref,
                        image,
                        quality.round(),
                        mode == CompressMode.targetSize ? targetKb : null,
                      ),
                icon: state is Loading ? null : Icons.compress_rounded,
                label: state is Loading
                    ? l.imgCompressCompressing
                    : l.imgCompressButton,
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
    int? targetKb,
  ) async {
    final previous = ref.read(compressionResultProvider);
    if (previous is Loading) return; // double tap before the rebuild
    ref.read(compressionResultProvider.notifier).state = const Loading();
    // Each run writes a new temp JPEG; drop the one it replaces.
    if (previous is Success<CompressResult>) {
      previous.data.compressedFile.delete().ignore();
    }
    try {
      final originalSize = await image.length();
      File compressed;
      var missedTarget = false;
      if (targetKb != null) {
        final out = await _service.compressToTarget(
          source: image,
          maxBytes: targetKb * 1000,
        );
        compressed = out.file;
        missedTarget = !out.fits;
      } else {
        compressed = await _service.compress(source: image, quality: quality);
      }
      final compressedSize = await compressed.length();
      // The user may have left (provider auto-disposed) or picked another
      // photo while this was running.
      if (!context.mounted || ref.read(selectedImageProvider) != image) {
        compressed.delete().ignore();
        return;
      }
      ref.read(compressionResultProvider.notifier).state = Success(
        CompressResult(
          originalBytes: originalSize,
          compressedBytes: compressedSize,
          compressedFile: compressed,
          targetKb: targetKb,
          missedTarget: missedTarget,
        ),
      );
    } catch (e) {
      debugPrint('Compression failed: $e');
      if (!context.mounted) return;
      // Localized when shown (see _ErrorCard).
      ref.read(compressionResultProvider.notifier).state = const ErrorResult(
        _kCompressFailed,
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
    final l = AppLocalizations.of(context);
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
                title: Text(l.commonGallery),
                onTap: () => Navigator.pop(ctx, ImageSource.gallery),
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera_rounded, color: _accentColor),
                title: Text(l.commonCamera),
                onTap: () => Navigator.pop(ctx, ImageSource.camera),
              ),
            ],
          ),
        ),
      ),
    );

    if (source == null) return;
    try {
      final picked = await picker.pickImage(source: source);
      if (picked != null) onPick(File(picked.path));
    } on PlatformException catch (e) {
      // Camera/photos permission denied, no camera app, etc.
      debugPrint('Image pick failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l = AppLocalizations.of(context);

    return Semantics(
      button: true,
      label: image == null ? null : l.imgCompressChange,
      child: GestureDetector(
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
                    l.imgCompressPickHint,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    l.imgCompressSupported('JPG, PNG, WEBP'),
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
                    // Decode at display size: a full 50 MP decode for a
                    // 220 px preview can OOM a low-end phone.
                    child: Image.file(
                      image!,
                      fit: BoxFit.cover,
                      cacheWidth: (MediaQuery.sizeOf(context).width *
                              MediaQuery.devicePixelRatioOf(context))
                          .round(),
                      errorBuilder: (_, _, _) => Icon(
                        Icons.broken_image_outlined,
                        size: 48,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                  PositionedDirectional(
                    bottom: 10,
                    end: 10,
                    child: Material(
                      color: Colors.black.withValues(alpha: 0.65),
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: () => _chooseImage(context),
                        borderRadius: BorderRadius.circular(10),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.edit_rounded, color: Colors.white, size: 14),
                              const SizedBox(width: 4),
                              Text(
                                l.imgCompressChange,
                                style: const TextStyle(
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
      ),
    );
  }
}

// ── Mode picker ────────────────────────────────────────────────────────────

class _ModePicker extends StatelessWidget {
  const _ModePicker({required this.mode, required this.ref});

  final CompressMode mode;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return SegmentedButton<CompressMode>(
      segments: [
        ButtonSegment(
          value: CompressMode.quality,
          icon: const Icon(Icons.tune_rounded),
          label: Text(l.imgCompressModeQuality),
        ),
        ButtonSegment(
          value: CompressMode.targetSize,
          icon: const Icon(Icons.straighten_rounded),
          label: Text(l.imgCompressModeTarget),
        ),
      ],
      selected: {mode},
      onSelectionChanged: (s) {
        ref.read(compressModeProvider.notifier).state = s.first;
        ref.read(compressionResultProvider.notifier).state = const Idle();
      },
    );
  }
}

// ── Target size picker ─────────────────────────────────────────────────────

class _TargetPicker extends StatelessWidget {
  const _TargetPicker({required this.targetKb, required this.ref});

  final int targetKb;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final kb in kCompressTargetsKb)
              ChoiceChip(
                label: Text(l.imgCompressTargetUnder(_kbLabel(kb))),
                selected: kb == targetKb,
                selectedColor: _accentColor.withValues(alpha: 0.18),
                onSelected: (_) {
                  ref.read(targetKbProvider.notifier).state = kb;
                  ref.read(compressionResultProvider.notifier).state =
                      const Idle();
                },
              ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          l.imgCompressTargetHint,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
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
    final l = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(l.imgCompressQuality, style: theme.textTheme.labelLarge),
            ),
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
            Flexible(
              child: Text(
                l.imgCompressSmallest,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                l.imgCompressBestQuality,
                textAlign: TextAlign.end,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          l.imgCompressQualityNote,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
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
    final l = AppLocalizations.of(context);
    final target = result.targetKb;
    final missed = result.missedTarget && target != null;
    const ok = Color(0xFF22C55E);
    const warn = Color(0xFFF59E0B);

    return GlassCard(
      padding: const EdgeInsets.all(20),
      accentColor: missed ? warn : ok,
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                missed ? Icons.info_rounded : Icons.check_circle_rounded,
                color: missed ? warn : ok,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  missed
                      ? l.imgCompressMissedTarget(_kbLabel(target))
                      : target != null
                      ? l.imgCompressFitsTarget(_kbLabel(target))
                      : l.imgCompressSuccess,
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: missed ? warn : ok,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _StatItem(
                label: l.imgCompressStatOriginal,
                value: _formatBytes(result.originalBytes),
              ),
              const Icon(Icons.arrow_forward_rounded, size: 18),
              _StatItem(
                label: l.imgCompressStatCompressed,
                value: _formatBytes(result.compressedBytes),
              ),
              _StatItem(
                label: l.imgCompressStatSaved,
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
                  label: l.commonShare,
                  accent: const Color(0xFF22C55E),
                  dense: true,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: PremiumButton(
                  onPressed: () => _save(context, result.compressedFile),
                  icon: Icons.save_alt_rounded,
                  label: l.commonSave,
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
    final l = AppLocalizations.of(context);
    var ok = false;
    try {
      ok = await FileUtils.saveImageToGallery(
        bytes: await file.readAsBytes(),
        fileName: 'compressed_${DateTime.now().millisecondsSinceEpoch}.jpg',
        toolId: 'image_compressor',
      );
    } catch (e) {
      debugPrint('Saving compressed image failed: $e');
    }
    messenger.showSnackBar(SnackBar(
      content: Text(ok ? l.commonSavedToGallery : l.commonSaveFailed),
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
            textAlign: TextAlign.center,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w800,
              color: highlight
                  ? const Color(0xFF22C55E)
                  : theme.colorScheme.onSurface,
            ),
          ),
          Text(
            label,
            textAlign: TextAlign.center,
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
              message == _kCompressFailed
                  ? AppLocalizations.of(context).imgCompressFailed
                  : message,
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

/// "100 KB" / "1 MB" for a decimal target size (unit names stay as is).
String _kbLabel(int kb) =>
    kb >= 1000 && kb % 1000 == 0 ? '${kb ~/ 1000} MB' : '$kb KB';

String _formatBytes(int bytes) {
  if (bytes < 1024) return '$bytes B';
  if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
  return '${(bytes / (1024 * 1024)).toStringAsFixed(2)} MB';
}
