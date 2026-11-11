import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utility_toolbox/core/utils/file_utils.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:utility_toolbox/core/services/ads_service.dart';
import 'package:utility_toolbox/core/theme/app_colors.dart';
import 'package:utility_toolbox/core/widgets/empty_state.dart';
import 'package:utility_toolbox/core/widgets/premium_button.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/features/qr_barcode/providers/qr_providers.dart';
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';

class QrGeneratorScreen extends ConsumerStatefulWidget {
  const QrGeneratorScreen({super.key, this.initialText});

  /// Text or a link shared into the app: turned into a QR code right away.
  final String? initialText;

  @override
  ConsumerState<QrGeneratorScreen> createState() => _QrGeneratorScreenState();
}

class _QrGeneratorScreenState extends ConsumerState<QrGeneratorScreen> {
  final _qrKey = GlobalKey();
  late final _controller = TextEditingController(text: widget.initialText);

  /// Blocks double taps on Save/Share (each tap saved another copy).
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    final initial = widget.initialText;
    if (initial != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) ref.read(generatorTextProvider.notifier).state = initial;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<Uint8List?> _captureQr() async {
    final boundary =
        _qrKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
    if (boundary == null) return null;

    try {
      final image = await boundary.toImage(pixelRatio: 3);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      image.dispose();
      return byteData?.buffer.asUint8List();
    } catch (e) {
      debugPrint('QR capture failed: $e');
      return null;
    }
  }

  Future<void> _saveToGallery() async {
    if (_busy) return;
    setState(() => _busy = true);
    try {
      final bytes = await _captureQr();
      if (bytes == null || !mounted) return;

      final ok = await FileUtils.saveImageToGallery(
        bytes: bytes,
        fileName: 'qr_${DateTime.now().millisecondsSinceEpoch}.png',
        mimeType: 'image/png',
        toolId: 'qr_generator',
      );
      if (!mounted) return;
      final l = AppLocalizations.of(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(ok ? l.commonSavedToGallery : l.commonSaveFailed)),
      );
      await ref.read(adsServiceProvider).showInterstitialIfAllowed();
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _shareQr() async {
    if (_busy) return;
    setState(() => _busy = true);
    try {
      final bytes = await _captureQr();
      if (bytes == null) return;
      await Share.shareXFiles([
        XFile.fromData(bytes, mimeType: 'image/png', name: 'qr_code.png'),
      ]);
      if (!mounted) return;
      await ref.read(adsServiceProvider).showInterstitialIfAllowed();
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final text = ref.watch(generatorTextProvider);
    final hasText = text.trim().isNotEmpty;
    final accent = AppColors.toolAccent('qr_barcode');
    final gradient = AppColors.toolGradient('qr_barcode');
    final l = AppLocalizations.of(context);

    return ToolScaffold(
      title: l.toolQrGeneratorTitle,
      accentColor: accent,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                filled: true,
                labelText: l.qrGenInputLabel,
                hintText: l.qrGenInputHint,
                prefixIcon: Icon(Icons.link_rounded, color: accent),
              ),
              onChanged: (value) =>
                  ref.read(generatorTextProvider.notifier).state = value,
            ),
            const SizedBox(height: 24),
            if (hasText)
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: accent.withValues(alpha: 0.18),
                      blurRadius: 24,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: RepaintBoundary(
                  key: _qrKey,
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(16),
                    child: QrImageView(
                      data: text,
                      version: QrVersions.auto,
                      size: 220,
                      semanticsLabel: l.qrGenPreviewLabel,
                    ),
                  ),
                ),
              )
            else
              EmptyState(
                icon: Icons.qr_code_2_rounded,
                gradient: gradient,
                message: l.qrGenEmpty,
              ),
            const SizedBox(height: 28),
            Row(
              children: [
                Expanded(
                  child: PremiumButton(
                    onPressed: hasText && !_busy ? _saveToGallery : null,
                    icon: Icons.download_rounded,
                    label: l.qrGenSaveGallery,
                    gradient: gradient,
                    dense: true,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: PremiumOutlineButton(
                    onPressed: hasText && !_busy ? _shareQr : null,
                    icon: Icons.share_rounded,
                    label: l.commonShare,
                    accent: accent,
                    dense: true,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
