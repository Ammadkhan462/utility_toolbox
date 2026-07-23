import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gal/gal.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:utility_toolbox/core/services/ads_service.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/features/qr_barcode/providers/qr_providers.dart';

class QrGeneratorScreen extends ConsumerStatefulWidget {
  const QrGeneratorScreen({super.key});

  @override
  ConsumerState<QrGeneratorScreen> createState() => _QrGeneratorScreenState();
}

class _QrGeneratorScreenState extends ConsumerState<QrGeneratorScreen> {
  final _qrKey = GlobalKey();
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<Uint8List?> _captureQr() async {
    final boundary =
        _qrKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
    if (boundary == null) return null;

    final image = await boundary.toImage(pixelRatio: 3);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return byteData?.buffer.asUint8List();
  }

  Future<void> _saveToGallery() async {
    final bytes = await _captureQr();
    if (bytes == null || !mounted) return;

    await Gal.putImageBytes(bytes, name: 'qr_${DateTime.now().millisecondsSinceEpoch}');
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Saved to gallery')),
    );
    await ref.read(adsServiceProvider).showInterstitialIfAllowed();
  }

  Future<void> _shareQr() async {
    final bytes = await _captureQr();
    if (bytes == null) return;
    await Share.shareXFiles([
      XFile.fromData(bytes, mimeType: 'image/png', name: 'qr_code.png'),
    ]);
    await ref.read(adsServiceProvider).showInterstitialIfAllowed();
  }

  @override
  Widget build(BuildContext context) {
    final text = ref.watch(generatorTextProvider);
    final hasText = text.trim().isNotEmpty;

    return ToolScaffold(
      title: 'Generate QR',
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Text or URL',
                hintText: 'Enter content to encode',
              ),
              onChanged: (value) =>
                  ref.read(generatorTextProvider.notifier).state = value,
            ),
            const SizedBox(height: 24),
            if (hasText)
              RepaintBoundary(
                key: _qrKey,
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(16),
                  child: QrImageView(
                    data: text,
                    version: QrVersions.auto,
                    size: 220,
                  ),
                ),
              )
            else
              const Padding(
                padding: EdgeInsets.all(32),
                child: Text('Enter text above to preview your QR code.'),
              ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: hasText ? _saveToGallery : null,
                    child: const Text('Save to Gallery'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton.tonal(
                    onPressed: hasText ? _shareQr : null,
                    child: const Text('Share'),
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
