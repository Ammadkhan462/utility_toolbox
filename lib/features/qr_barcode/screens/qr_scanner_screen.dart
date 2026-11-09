import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:utility_toolbox/core/services/ads_service.dart';
import 'package:utility_toolbox/core/services/permission_service.dart';
import 'package:utility_toolbox/core/theme/app_colors.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/features/qr_barcode/providers/qr_providers.dart';

class QrScannerScreen extends ConsumerStatefulWidget {
  const QrScannerScreen({super.key, this.initialImagePath});

  /// A photo shared into the app: decode the code in it instead of (first)
  /// opening the camera.
  final String? initialImagePath;

  @override
  ConsumerState<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends ConsumerState<QrScannerScreen> {
  MobileScannerController? _controller;
  String? _lastScanned;
  DateTime? _lastScanTime;
  bool _permissionChecked = false;
  PermissionOutcome? _permissionOutcome;

  @override
  void initState() {
    super.initState();
    final initial = widget.initialImagePath;
    if (initial == null) {
      _checkPermission();
    } else {
      // Don't ask for the camera before showing what was in the photo.
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await _scanImage(initial);
        if (mounted) _checkPermission();
      });
    }
  }

  Future<void> _pickFromGallery() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked == null || !mounted) return;
    await _scanImage(picked.path);
  }

  /// Decodes a QR code/barcode from a photo (gallery or shared).
  Future<void> _scanImage(String path) async {
    final controller = _controller ?? MobileScannerController(autoStart: false);
    try {
      final capture = await controller.analyzeImage(path);
      final value = capture?.barcodes.firstOrNull?.rawValue;
      if (!mounted) return;
      if (value == null || value.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No QR code or barcode found in this photo.')),
        );
        return;
      }
      await _handleValue(value);
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Couldn't read this photo.")),
      );
    } finally {
      if (!identical(controller, _controller)) controller.dispose();
    }
  }

  Future<void> _checkPermission() async {
    final outcome = await ref.read(permissionServiceProvider).requestCamera();
    if (!mounted) return;
    setState(() {
      _permissionOutcome = outcome;
      _permissionChecked = true;
      if (outcome == PermissionOutcome.granted) {
        _controller = MobileScannerController();
      }
    });
  }

  Future<void> _onDetect(BarcodeCapture capture) async {
    final barcode = capture.barcodes.firstOrNull;
    final value = barcode?.rawValue;
    if (value == null || value.isEmpty) return;

    final now = DateTime.now();
    if (_lastScanned == value &&
        _lastScanTime != null &&
        now.difference(_lastScanTime!) < const Duration(seconds: 2)) {
      return;
    }

    _lastScanned = value;
    _lastScanTime = now;
    await _handleValue(value);
  }

  Future<void> _handleValue(String value) async {
    final qrService = ref.read(qrServiceProvider);
    final item = qrService.createHistoryItem(value);
    await ref.read(scanHistoryProvider.notifier).addItem(item);

    if (!mounted) return;
    await _showResultSheet(context, value, qrService.classifyContent(value));
    await ref.read(adsServiceProvider).showInterstitialIfAllowed();
  }

  Future<void> _showResultSheet(
    BuildContext context,
    String content,
    String type,
  ) async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Scanned ($type)',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 12),
              SelectableText(content),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: FilledButton.tonal(
                      onPressed: () async {
                        await Clipboard.setData(ClipboardData(text: content));
                        if (context.mounted) Navigator.pop(context);
                      },
                      child: const Text('Copy'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  if (type == 'url')
                    Expanded(
                      child: FilledButton(
                        onPressed: () async {
                          final uri = Uri.tryParse(content);
                          if (uri != null && await canLaunchUrl(uri)) {
                            await launchUrl(
                              uri,
                              mode: LaunchMode.externalApplication,
                            );
                          }
                        },
                        child: const Text('Open'),
                      ),
                    ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: () => Share.share(content),
                    icon: const Icon(Icons.share),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_permissionChecked) {
      return ToolScaffold(
        title: 'Scan',
        accentColor: AppColors.toolAccent('qr_barcode'),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (_permissionOutcome != PermissionOutcome.granted) {
      return ToolScaffold(
        title: 'Scan',
        accentColor: AppColors.toolAccent('qr_barcode'),
        actions: [
          IconButton(
            tooltip: 'Scan from photo',
            icon: const Icon(Icons.photo_library_outlined),
            onPressed: _pickFromGallery,
          ),
        ],
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Camera access is needed to scan QR codes and barcodes.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                if (_permissionOutcome == PermissionOutcome.permanentlyDenied)
                  FilledButton(
                    onPressed: () =>
                        ref.read(permissionServiceProvider).openSettings(),
                    child: const Text('Open Settings'),
                  )
                else
                  FilledButton(
                    onPressed: _checkPermission,
                    child: const Text('Try again'),
                  ),
              ],
            ),
          ),
        ),
      );
    }

    return ToolScaffold(
      title: 'Scan',
      accentColor: AppColors.toolAccent('qr_barcode'),
      actions: [
        IconButton(
          tooltip: 'Scan from photo',
          icon: const Icon(Icons.photo_library_outlined),
          onPressed: _pickFromGallery,
        ),
      ],
      body: MobileScanner(
        controller: _controller,
        onDetect: _onDetect,
        errorBuilder: (context, error) {
          return Center(child: Text("Couldn't read this code, try again."));
        },
      ),
    );
  }
}

extension _FirstOrNull<E> on List<E> {
  E? get firstOrNull => isEmpty ? null : first;
}
