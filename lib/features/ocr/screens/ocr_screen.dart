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
import 'package:utility_toolbox/core/widgets/feature_badge.dart';
import 'package:utility_toolbox/core/widgets/loading_indicator.dart';
import 'package:utility_toolbox/core/widgets/premium_button.dart';
import 'package:utility_toolbox/core/theme/app_colors.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/features/ocr/providers/ocr_providers.dart';

// ─────────────────────────────────────────────────────────────────────────────
//  OcrScreen
//
//  MUST be a ConsumerStatefulWidget — NOT ConsumerWidget — because _pickImage
//  is async and uses ref across multiple awaits (permission → picker → OCR).
//  With ConsumerWidget, ref can be invalidated between awaits when the image
//  picker overlay returns, causing "Cannot use ref after widget was disposed".
//  ConsumerStatefulWidget gives us a stable ref tied to the State lifetime,
//  and we guard every post-await write with `if (!mounted) return`.
// ─────────────────────────────────────────────────────────────────────────────

class OcrScreen extends ConsumerStatefulWidget {
  const OcrScreen({super.key, this.initialImagePath});

  /// A photo shared into the app (or handed over by another tool): read it
  /// straight away.
  final String? initialImagePath;

  @override
  ConsumerState<OcrScreen> createState() => _OcrScreenState();
}

class _OcrScreenState extends ConsumerState<OcrScreen> {
  static Color get _ocrAccent => AppColors.toolAccent('ocr');
  Future<void> _pickImage(ImageSource source) async {
    // Read everything we need BEFORE the first await so ref is accessed
    // synchronously and cannot be disposed between reads.
    final permission = ref.read(permissionServiceProvider);

    // Only the camera needs a runtime permission. The gallery uses the
    // system photo picker via image_picker, which needs no permission.
    if (source == ImageSource.camera) {
      final outcome = await permission.requestCamera();

      // Guard after every await — the picker overlay or back navigation
      // can dispose the widget while we wait.
      if (!mounted) return;

      if (outcome != PermissionOutcome.granted) {
        ref.read(ocrResultProvider.notifier).state = ErrorResult(
          outcome == PermissionOutcome.permanentlyDenied
              ? 'Camera permission denied. Open Settings to allow access.'
              : 'Camera permission is required to take a photo.',
        );
        return;
      }
    }

    final picker = ImagePicker();
    // imageQuality: 100 — OcrService does a single controlled downscale.
    // Letting ImagePicker compress first then compressing again wastes time.
    final picked = await picker.pickImage(source: source, imageQuality: 100);

    if (!mounted) return;
    if (picked == null) return;

    await _recognize(File(picked.path));
  }

  @override
  void initState() {
    super.initState();
    final initial = widget.initialImagePath;
    if (initial != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _recognize(File(initial));
      });
    }
  }

  Future<void> _recognize(File file) async {
    final ocrService = ref.read(ocrServiceProvider);

    // Set state synchronously — no await between here and the OCR call.
    ref.read(ocrImageProvider.notifier).state = file;
    ref.read(ocrDetailedResultProvider.notifier).state = null;
    ref.read(ocrHighlightedBlockProvider.notifier).state = -1;
    ref.read(ocrLoadingMessageProvider.notifier).state = 'Scanning image…';
    ref.read(ocrResultProvider.notifier).state = const Loading();

    try {
      // Heavy work — runs on native threads inside OcrService.
      final detailed = await ocrService.recognizeDetailed(file.path);

      // Guard again — user may have navigated away while OCR ran.
      if (!mounted) return;

      ref.read(ocrDetailedResultProvider.notifier).state = detailed;
      ref.read(ocrTextProvider.notifier).state = detailed.fullText;
      ref.read(ocrResultProvider.notifier).state = Success(detailed.fullText);
    } catch (e) {
      if (!mounted) return;
      ref.read(ocrResultProvider.notifier).state = const ErrorResult(
        'Could not read text from this image. Try a clearer photo.',
      );
    }
  }

  void _reset() {
    ref.read(ocrResultProvider.notifier).state = const Idle();
    ref.read(ocrImageProvider.notifier).state = null;
    ref.read(ocrTextProvider.notifier).state = '';
    ref.read(ocrDetailedResultProvider.notifier).state = null;
    ref.read(ocrHighlightedBlockProvider.notifier).state = -1;
  }

  @override
  Widget build(BuildContext context) {
    final resultState = ref.watch(ocrResultProvider);
    final text = ref.watch(ocrTextProvider);
    final image = ref.watch(ocrImageProvider);
    final detailed = ref.watch(ocrDetailedResultProvider);
    final loadingMsg = ref.watch(ocrLoadingMessageProvider);

    return ToolScaffold(
      title: 'OCR Scanner',
      accentColor: _ocrAccent,
      resizeToAvoidBottomInset: false,
      body: switch (resultState) {
        Idle() => _IdleView(onPick: _pickImage),
        Loading() => _LoadingView(image: image, message: loadingMsg),
        ErrorResult(message: final msg) => ErrorState(
          message: msg,
          onRetry: _reset,
        ),
        Success() => _ResultView(
          image: image,
          detailed: detailed,
          fullText: text,
          onScan: () => _pickImage(ImageSource.gallery),
          onDone: () async {
            await ref.read(adsServiceProvider).showInterstitialIfAllowed();
            if (mounted) _reset();
          },
        ),
      },
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
//  _IdleView
// ─────────────────────────────────────────────────────────────────────────────

class _IdleView extends StatelessWidget {
  const _IdleView({required this.onPick});
  final Future<void> Function(ImageSource) onPick;

  @override
  Widget build(BuildContext context) {
    final accent = AppColors.toolAccent('ocr');
    final gradient = AppColors.toolGradient('ocr');

    return Consumer(
      builder: (ctx, ref, _) {
        // Pre-warm the ML model as soon as the idle screen appears so the
        // native TextRecognizer is resident before the user taps "Scan".
        // Uses addPostFrameCallback so it doesn't block the first frame.
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ref.read(ocrServiceProvider).warmUp();
        });

        return EmptyState(
          icon: Icons.document_scanner_outlined,
          gradient: gradient,
          title: 'Extract text from any image',
          message:
              'Point your camera or choose a photo — text is extracted instantly, on-device.',
          badges: [
            FeatureBadge(
              icon: Icons.phone_android_rounded,
              label: 'On-device AI',
              accent: accent,
            ),
            FeatureBadge(
              icon: Icons.lock_outline_rounded,
              label: 'Processed locally',
              accent: accent,
            ),
            FeatureBadge(
              icon: Icons.layers_outlined,
              label: 'Block-level copy',
              accent: accent,
            ),
          ],
          action: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PremiumButton(
                onPressed: () => onPick(ImageSource.camera),
                icon: Icons.camera_alt_rounded,
                label: 'Use Camera',
                gradient: gradient,
              ),
              const SizedBox(height: 12),
              PremiumOutlineButton(
                onPressed: () => onPick(ImageSource.gallery),
                icon: Icons.photo_library_outlined,
                label: 'Choose from Gallery',
                accent: accent,
              ),
            ],
          ),
        );
      },
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
//  _LoadingView  — shows the picked image blurred behind a progress indicator
//  so the user always has visual feedback that their image was received.
// ─────────────────────────────────────────────────────────────────────────────

class _LoadingView extends StatelessWidget {
  const _LoadingView({required this.image, required this.message});
  final File? image;
  final String message;

  @override
  Widget build(BuildContext context) {
    final accent = AppColors.toolAccent('ocr');
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // If no image yet (shouldn't happen, but be safe) fall back to plain loader
    if (image == null) {
      return LoadingIndicator(message: message);
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        // ── Blurred image in background ────────────────────────────────────
        ColorFiltered(
          colorFilter: ColorFilter.mode(
            (isDark ? Colors.black : Colors.white).withValues(alpha: 0.55),
            BlendMode.srcOver,
          ),
          child: Image.file(image!, fit: BoxFit.cover),
        ),

        // ── Scan-line animation overlay ────────────────────────────────────
        const _ScanLineOverlay(),

        // ── Central card with progress ─────────────────────────────────────
        Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 40),
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
            decoration: BoxDecoration(
              color: isDark
                  ? AppColors.darkSurface.withValues(alpha: 0.92)
                  : Colors.white.withValues(alpha: 0.93),
              borderRadius: BorderRadius.circular(20),
              boxShadow: AppColors.glowShadow(accent, blur: 28, opacity: 0.22),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Gradient ring progress
                SizedBox(
                  width: 52,
                  height: 52,
                  child: CircularProgressIndicator(
                    strokeWidth: 3.5,
                    valueColor: AlwaysStoppedAnimation<Color>(accent),
                    backgroundColor: accent.withValues(alpha: 0.15),
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: isDark
                        ? AppColors.darkOnSurface
                        : AppColors.lightOnSurface,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'On-device · no upload needed',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// Animated horizontal scan line that sweeps down the image
class _ScanLineOverlay extends StatefulWidget {
  const _ScanLineOverlay();
  @override
  State<_ScanLineOverlay> createState() => _ScanLineOverlayState();
}

class _ScanLineOverlayState extends State<_ScanLineOverlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _pos;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    )..repeat();
    _pos = CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final accent = AppColors.toolAccent('ocr');
    return AnimatedBuilder(
      animation: _pos,
      builder: (_, __) => CustomPaint(
        painter: _ScanPainter(progress: _pos.value, accent: accent),
        child: const SizedBox.expand(),
      ),
    );
  }
}

class _ScanPainter extends CustomPainter {
  const _ScanPainter({required this.progress, required this.accent});
  final double progress;
  final Color accent;

  @override
  void paint(Canvas canvas, Size size) {
    final y = size.height * progress;
    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.transparent,
          accent.withValues(alpha: 0.6),
          accent.withValues(alpha: 0.9),
          accent.withValues(alpha: 0.6),
          Colors.transparent,
        ],
        stops: const [0.0, 0.3, 0.5, 0.7, 1.0],
      ).createShader(Rect.fromLTWH(0, y - 14, size.width, 28));
    canvas.drawRect(Rect.fromLTWH(0, y - 14, size.width, 28), paint);
  }

  @override
  bool shouldRepaint(_ScanPainter old) => old.progress != progress;
}

// ─────────────────────────────────────────────────────────────────────────────
//  _ResultView  — split panel: image with overlays | extracted text panel
// ─────────────────────────────────────────────────────────────────────────────

class _ResultView extends ConsumerStatefulWidget {
  const _ResultView({
    required this.image,
    required this.detailed,
    required this.fullText,
    required this.onScan,
    required this.onDone,
  });

  final File? image;
  final OcrResult? detailed;
  final String fullText;
  final VoidCallback onScan;
  final VoidCallback onDone;

  @override
  ConsumerState<_ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends ConsumerState<_ResultView>
    with SingleTickerProviderStateMixin {
  late final TabController _tab;

  @override
  void initState() {
    super.initState();
    _tab = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tab.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final accent = AppColors.toolAccent('ocr');
    final gradient = AppColors.toolGradient('ocr');
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final theme = Theme.of(context);

    return Column(
      children: [
        // ── Tab bar ──────────────────────────────────────────────────────────
        Container(
          margin: const EdgeInsets.fromLTRB(16, 8, 16, 0),
          decoration: BoxDecoration(
            color: isDark
                ? AppColors.darkSurfaceVariant
                : AppColors.lightSurfaceVariant,
            borderRadius: BorderRadius.circular(14),
          ),
          child: TabBar(
            controller: _tab,
            dividerColor: Colors.transparent,
            indicator: BoxDecoration(
              gradient: gradient,
              borderRadius: BorderRadius.circular(12),
              boxShadow: AppColors.glowShadow(accent, blur: 12, opacity: 0.35),
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: Colors.white,
            unselectedLabelColor: theme.colorScheme.onSurfaceVariant,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 13.5,
            ),
            tabs: const [
              Tab(
                icon: Icon(Icons.image_search_rounded, size: 18),
                text: 'Image',
              ),
              Tab(icon: Icon(Icons.article_outlined, size: 18), text: 'Text'),
            ],
          ),
        ),

        // ── Content ───────────────────────────────────────────────────────────
        Expanded(
          child: TabBarView(
            controller: _tab,
            children: [
              // Tab 0 — Image with block overlays
              _ImageOverlayTab(image: widget.image, detailed: widget.detailed),
              // Tab 1 — Extracted text panel
              _TextTab(
                fullText: widget.fullText,
                detailed: widget.detailed,
                accent: accent,
              ),
            ],
          ),
        ),

        // ── Bottom action bar ─────────────────────────────────────────────────
        _ActionBar(
          fullText: widget.fullText,
          accent: accent,
          gradient: gradient,
          onScan: widget.onScan,
          onDone: widget.onDone,
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
//  _ImageOverlayTab  — image + tappable block bounding-box overlays
// ─────────────────────────────────────────────────────────────────────────────

class _ImageOverlayTab extends ConsumerStatefulWidget {
  const _ImageOverlayTab({required this.image, required this.detailed});
  final File? image;
  final OcrResult? detailed;

  @override
  ConsumerState<_ImageOverlayTab> createState() => _ImageOverlayTabState();
}

class _ImageOverlayTabState extends ConsumerState<_ImageOverlayTab> {
  final _imgKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final accent = AppColors.toolAccent('ocr');
    final highlighted = ref.watch(ocrHighlightedBlockProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (widget.image == null) return const SizedBox.shrink();

    return Stack(
      children: [
        // Scrollable image + overlay
        InteractiveViewer(
          minScale: 0.8,
          maxScale: 4.0,
          child: LayoutBuilder(
            builder: (ctx, constraints) {
              return Stack(
                children: [
                  // ── Image ────────────────────────────────────────────────
                  Positioned.fill(
                    child: Image.file(
                      widget.image!,
                      key: _imgKey,
                      fit: BoxFit.contain,
                      width: constraints.maxWidth,
                      height: constraints.maxHeight,
                    ),
                  ),

                  // ── Block overlays ────────────────────────────────────────
                  if (widget.detailed != null)
                    ...widget.detailed!.blocks.asMap().entries.map((entry) {
                      final i = entry.key;
                      final block = entry.value;
                      final isHit = highlighted == i;

                      // Map normalised [0-1] rect to pixel coords
                      final left = block.rect.left * constraints.maxWidth;
                      final top = block.rect.top * constraints.maxHeight;
                      final width = block.rect.width * constraints.maxWidth;
                      final height = block.rect.height * constraints.maxHeight;

                      return Positioned(
                        left: left,
                        top: top,
                        width: width,
                        height: height,
                        child: GestureDetector(
                          onTap: () {
                            ref
                                .read(ocrHighlightedBlockProvider.notifier)
                                .state = isHit
                                ? -1
                                : i;
                            if (!isHit) {
                              _showBlockMenu(context, block, accent);
                            }
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            decoration: BoxDecoration(
                              color: isHit
                                  ? accent.withValues(alpha: 0.28)
                                  : accent.withValues(alpha: 0.08),
                              border: Border.all(
                                color: isHit
                                    ? accent
                                    : accent.withValues(alpha: 0.45),
                                width: isHit ? 2 : 1.2,
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      );
                    }),
                ],
              );
            },
          ),
        ),

        // ── Hint chip ─────────────────────────────────────────────────────
        if (widget.detailed != null && widget.detailed!.blocks.isNotEmpty)
          Positioned(
            bottom: 12,
            left: 0,
            right: 0,
            child: Center(
              child: _HintChip(
                label: 'Tap a highlighted block to copy it',
                accent: accent,
                isDark: isDark,
              ),
            ),
          ),
      ],
    );
  }

  void _showBlockMenu(BuildContext context, OcrBlock block, Color accent) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => _BlockBottomSheet(block: block, accent: accent),
    ).whenComplete(() {
      if (mounted) {
        ref.read(ocrHighlightedBlockProvider.notifier).state = -1;
      }
    });
  }
}

// ─────────────────────────────────────────────────────────────────────────────
//  _BlockBottomSheet  — lines with individual copy buttons
// ─────────────────────────────────────────────────────────────────────────────

class _BlockBottomSheet extends StatelessWidget {
  const _BlockBottomSheet({required this.block, required this.accent});
  final OcrBlock block;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final theme = Theme.of(context);

    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      minChildSize: 0.3,
      maxChildSize: 0.85,
      builder: (_, ctrl) => Container(
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.22),
              blurRadius: 24,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Handle + header
            const _SheetHandle(),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 4, 16, 12),
              child: Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      gradient: AppColors.toolGradient('ocr'),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.text_fields_rounded,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Block text',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          '${block.lines.length} line${block.lines.length == 1 ? '' : 's'} · tap to copy',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Copy all in block
                  _CopyIconBtn(
                    text: block.text,
                    accent: accent,
                    tooltip: 'Copy block',
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            // Lines list
            Expanded(
              child: ListView.separated(
                controller: ctrl,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                itemCount: block.lines.length,
                separatorBuilder: (_, __) =>
                    const Divider(height: 1, indent: 40),
                itemBuilder: (_, i) {
                  final line = block.lines[i];
                  return _LineRow(line: line, accent: accent);
                },
              ),
            ),
            // Full block copy button
            Padding(
              padding: EdgeInsets.fromLTRB(
                16,
                8,
                16,
                MediaQuery.paddingOf(context).bottom + 16,
              ),
              child: PremiumButton(
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: block.text));
                  _toast(context, 'Block copied!');
                  Navigator.pop(context);
                },
                icon: Icons.copy_all_rounded,
                label: 'Copy entire block',
                gradient: AppColors.toolGradient('ocr'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
//  _LineRow  — individual line with inline copy
// ─────────────────────────────────────────────────────────────────────────────

class _LineRow extends StatelessWidget {
  const _LineRow({required this.line, required this.accent});
  final OcrLine line;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      leading: Icon(
        Icons.short_text_rounded,
        color: accent.withValues(alpha: 0.7),
        size: 18,
      ),
      title: SelectableText(line.text, style: theme.textTheme.bodyMedium),
      trailing: _CopyIconBtn(
        text: line.text,
        accent: accent,
        tooltip: 'Copy line',
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
//  _TextTab  — full extracted text with per-paragraph copy chips
// ─────────────────────────────────────────────────────────────────────────────

class _TextTab extends StatefulWidget {
  const _TextTab({
    required this.fullText,
    required this.detailed,
    required this.accent,
  });

  final String fullText;
  final OcrResult? detailed;
  final Color accent;

  @override
  State<_TextTab> createState() => _TextTabState();
}

class _TextTabState extends State<_TextTab> {
  late final TextEditingController _ctrl;
  bool _editing = false;

  @override
  void initState() {
    super.initState();
    _ctrl = TextEditingController(text: widget.fullText);
  }

  @override
  void didUpdateWidget(_TextTab old) {
    super.didUpdateWidget(old);
    if (old.fullText != widget.fullText) {
      _ctrl.text = widget.fullText;
    }
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final accent = widget.accent;

    if (widget.fullText.isEmpty) {
      return const EmptyState(
        icon: Icons.text_snippet_outlined,
        message: 'No text detected — try a clearer photo.',
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // ── Word / char count bar ─────────────────────────────────────────
        _StatsBar(text: widget.fullText, accent: accent),

        // ── Per-block chips (quick-copy paragraph) ────────────────────────
        if (widget.detailed != null && widget.detailed!.blocks.length > 1) ...[
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Text(
              'Quick copy by section',
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                letterSpacing: 0.5,
              ),
            ),
          ),
          SizedBox(
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              itemCount: widget.detailed!.blocks.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (_, i) {
                final block = widget.detailed!.blocks[i];
                final preview = block.text.replaceAll('\n', ' ');
                return ActionChip(
                  avatar: Icon(Icons.copy_rounded, size: 14, color: accent),
                  label: Text(
                    preview.length > 22
                        ? '${preview.substring(0, 22)}…'
                        : preview,
                    style: const TextStyle(fontSize: 12),
                  ),
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: block.text));
                    _toast(context, 'Copied block ${i + 1}');
                  },
                );
              },
            ),
          ),
          const Divider(height: 1),
        ],

        // ── Editable / selectable text area ───────────────────────────────
        Expanded(
          child: Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 80),
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: _editing
                    ? TextField(
                        controller: _ctrl,
                        maxLines: null,
                        autofocus: true,
                        textInputAction: TextInputAction.newline,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: isDark
                              ? AppColors.darkSurfaceVariant
                              : AppColors.lightSurfaceVariant,
                        ),
                      )
                    : SelectableText(
                        widget.fullText,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          height: 1.7,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
              ),

              // Edit / Done toggle FAB
              Positioned(
                right: 16,
                bottom: 16,
                child: FloatingActionButton.small(
                  heroTag: 'ocr_edit',
                  backgroundColor: accent,
                  foregroundColor: Colors.white,
                  tooltip: _editing ? 'Done editing' : 'Edit text',
                  onPressed: () => setState(() => _editing = !_editing),
                  child: Icon(
                    _editing ? Icons.check_rounded : Icons.edit_rounded,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
//  _ActionBar  — pinned bottom strip
// ─────────────────────────────────────────────────────────────────────────────

class _ActionBar extends StatelessWidget {
  const _ActionBar({
    required this.fullText,
    required this.accent,
    required this.gradient,
    required this.onScan,
    required this.onDone,
  });

  final String fullText;
  final Color accent;
  final LinearGradient gradient;
  final VoidCallback onScan;
  final VoidCallback onDone;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bottom = MediaQuery.paddingOf(context).bottom;

    return Container(
      padding: EdgeInsets.fromLTRB(16, 10, 16, bottom + 10),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
        border: Border(
          top: BorderSide(
            color: Theme.of(
              context,
            ).colorScheme.outline.withValues(alpha: 0.25),
          ),
        ),
      ),
      child: Row(
        children: [
          // Copy all
          Expanded(
            child: PremiumOutlineButton(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: fullText));
                _toast(context, 'All text copied!');
              },
              icon: Icons.copy_all_rounded,
              label: 'Copy All',
              accent: accent,
              dense: true,
            ),
          ),
          const SizedBox(width: 8),
          // Share
          Expanded(
            child: PremiumOutlineButton(
              onPressed: () => Share.share(fullText),
              icon: Icons.share_rounded,
              label: 'Share',
              accent: accent,
              dense: true,
            ),
          ),
          const SizedBox(width: 8),
          // Scan again
          PremiumButton(
            onPressed: onScan,
            icon: Icons.document_scanner_outlined,
            label: 'Scan',
            gradient: gradient,
            expanded: false,
            dense: true,
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
//  Small helpers
// ─────────────────────────────────────────────────────────────────────────────

class _StatsBar extends StatelessWidget {
  const _StatsBar({required this.text, required this.accent});
  final String text;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    final words = text.trim().split(RegExp(r'\s+')).length;
    final chars = text.length;
    final lines = '\n'.allMatches(text).length + 1;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      color: isDark
          ? AppColors.darkSurfaceVariant
          : AppColors.lightSurfaceVariant,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          _StatChip(
            icon: Icons.format_list_numbered_rounded,
            value: '$lines',
            label: 'lines',
            accent: accent,
          ),
          const SizedBox(width: 16),
          _StatChip(
            icon: Icons.text_fields_rounded,
            value: '$words',
            label: 'words',
            accent: accent,
          ),
          const SizedBox(width: 16),
          _StatChip(
            icon: Icons.numbers_rounded,
            value: '$chars',
            label: 'chars',
            accent: accent,
          ),
        ],
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  const _StatChip({
    required this.icon,
    required this.value,
    required this.label,
    required this.accent,
  });
  final IconData icon;
  final String value;
  final String label;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: accent),
        const SizedBox(width: 4),
        Text(
          '$value $label',
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _HintChip extends StatelessWidget {
  const _HintChip({
    required this.label,
    required this.accent,
    required this.isDark,
  });
  final String label;
  final Color accent;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        color: isDark
            ? Colors.black.withValues(alpha: 0.6)
            : Colors.white.withValues(alpha: 0.88),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: accent.withValues(alpha: 0.45)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.touch_app_rounded, size: 14, color: accent),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: accent,
            ),
          ),
        ],
      ),
    );
  }
}

class _SheetHandle extends StatelessWidget {
  const _SheetHandle();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        width: 40,
        height: 4,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.outlineVariant,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }
}

class _CopyIconBtn extends StatelessWidget {
  const _CopyIconBtn({
    required this.text,
    required this.accent,
    required this.tooltip,
  });
  final String text;
  final Color accent;
  final String tooltip;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.copy_rounded, size: 18, color: accent),
      tooltip: tooltip,
      onPressed: () {
        Clipboard.setData(ClipboardData(text: text));
        _toast(context, 'Copied!');
      },
    );
  }
}

void _toast(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          const Icon(Icons.check_circle_rounded, color: Colors.white, size: 18),
          const SizedBox(width: 10),
          Text(message),
        ],
      ),
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}
