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
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';

class QrScannerScreen extends ConsumerStatefulWidget {
  const QrScannerScreen({super.key, this.initialImagePath});

  /// A photo shared into the app: decode the code in it instead of (first)
  /// opening the camera.
  final String? initialImagePath;

  @override
  ConsumerState<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends ConsumerState<QrScannerScreen>
    with WidgetsBindingObserver {
  MobileScannerController? _controller;
  String? _lastScanned;
  DateTime? _lastScanTime;
  bool _permissionChecked = false;
  PermissionOutcome? _permissionOutcome;

  /// True while a result sheet is up. The camera is paused meanwhile —
  /// otherwise it kept detecting the same code and stacked a new sheet (and
  /// a new history entry) every 2 seconds.
  bool _handling = false;
  bool _picking = false;

  @override
  void initState() {
    super.initState();
    // We pass our own controller, so MobileScanner doesn't follow the app
    // lifecycle itself: without this the camera kept running in the
    // background and could fail to restart on return.
    WidgetsBinding.instance.addObserver(this);
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

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final controller = _controller;
    if (state == AppLifecycleState.resumed &&
        _permissionOutcome == PermissionOutcome.permanentlyDenied) {
      // Back from system Settings: pick up a newly granted permission.
      // (Permanently denied never shows a dialog, so this can't loop.)
      _checkPermission();
      return;
    }
    if (controller == null || !controller.value.hasCameraPermission) return;
    switch (state) {
      case AppLifecycleState.resumed:
        if (!_handling && !_picking) _startCamera();
      case AppLifecycleState.inactive:
        unawaited(controller.stop().catchError((Object _) {}));
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
      case AppLifecycleState.paused:
        break;
    }
  }

  void _startCamera() {
    final controller = _controller;
    if (controller == null || !mounted) return;
    // start() throws while a previous start is still in flight; the camera
    // ends up running either way.
    unawaited(controller.start().catchError((Object _) {}));
  }

  Future<void> _pickFromGallery() async {
    if (_picking || _handling) return;
    _picking = true;
    try {
      final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (picked == null || !mounted) return;
      await _scanImage(picked.path);
    } catch (e) {
      debugPrint('QR photo pick failed: $e');
    } finally {
      _picking = false;
      // Opening the picker stopped the camera (app went inactive); restart
      // it even when the photo had no code in it.
      if (mounted && !_handling) _startCamera();
    }
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
          SnackBar(content: Text(AppLocalizations.of(context).qrScanNoCodeInPhoto)),
        );
        return;
      }
      await _handleValue(value);
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context).qrScanPhotoFailed)),
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
        _controller ??= MobileScannerController();
      }
    });
  }

  Future<void> _onDetect(BarcodeCapture capture) async {
    if (_handling) return;
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
    if (_handling) return;
    _handling = true;
    final qrService = ref.read(qrServiceProvider);
    final history = ref.read(scanHistoryProvider.notifier);
    final ads = ref.read(adsServiceProvider);
    final controller = _controller;
    try {
      if (controller != null && controller.value.isRunning) {
        await controller.pause().catchError((Object _) {});
      }
      await history.addItem(qrService.createHistoryItem(value));

      if (!mounted) return;
      await _showResultSheet(context, value, qrService.classifyContent(value));
      if (!mounted) return;
      await ads.showInterstitialIfAllowed();
    } finally {
      // The code is usually still in front of the lens: start the 2-second
      // "same code" window now, not from when it was first seen.
      _lastScanned = value;
      _lastScanTime = DateTime.now();
      _handling = false;
      if (mounted) _startCamera();
    }
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
        final l = AppLocalizations.of(context);
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                l.qrScanResultTitle(qrTypeLabel(l, type)),
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
                      child: Text(l.commonCopy),
                    ),
                  ),
                  const SizedBox(width: 8),
                  if (type == 'url')
                    Expanded(
                      child: FilledButton(
                        onPressed: () async {
                          final uri = Uri.tryParse(content.trim());
                          if (uri == null) return;
                          // canLaunchUrl() is false on Android 11+ without
                          // manifest <queries>, which made Open do nothing.
                          try {
                            await launchUrl(
                              uri,
                              mode: LaunchMode.externalApplication,
                            );
                          } catch (e) {
                            debugPrint('Opening scanned link failed: $e');
                          }
                        },
                        child: Text(l.commonOpen),
                      ),
                    ),
                  const SizedBox(width: 8),
                  IconButton(
                    tooltip: l.commonShare,
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
    WidgetsBinding.instance.removeObserver(this);
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    if (!_permissionChecked) {
      return ToolScaffold(
        title: l.toolQrScannerTitle,
        accentColor: AppColors.toolAccent('qr_barcode'),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (_permissionOutcome != PermissionOutcome.granted) {
      return ToolScaffold(
        title: l.toolQrScannerTitle,
        accentColor: AppColors.toolAccent('qr_barcode'),
        actions: [
          IconButton(
            tooltip: l.qrScanFromPhoto,
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
                Text(
                  l.qrScanCameraNeeded,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                if (_permissionOutcome == PermissionOutcome.permanentlyDenied)
                  FilledButton(
                    onPressed: () =>
                        ref.read(permissionServiceProvider).openSettings(),
                    child: Text(l.commonOpenSettings),
                  )
                else
                  FilledButton(
                    onPressed: _checkPermission,
                    child: Text(l.commonRetry),
                  ),
              ],
            ),
          ),
        ),
      );
    }

    final controller = _controller;
    return ToolScaffold(
      title: l.toolQrScannerTitle,
      accentColor: AppColors.toolAccent('qr_barcode'),
      actions: [
        if (controller != null) _TorchButton(controller: controller),
        IconButton(
          tooltip: l.qrScanFromPhoto,
          icon: const Icon(Icons.photo_library_outlined),
          onPressed: _pickFromGallery,
        ),
      ],
      body: MobileScanner(
        controller: _controller,
        onDetect: _onDetect,
        errorBuilder: (context, error) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Text(
                AppLocalizations.of(context).qrScanCameraError,
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ),
    );
  }
}

/// Torch on/off for the live camera. Hidden when the camera has no torch
/// (front camera, some tablets) or isn't running yet.
class _TorchButton extends StatelessWidget {
  const _TorchButton({required this.controller});

  final MobileScannerController controller;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return ValueListenableBuilder<MobileScannerState>(
      valueListenable: controller,
      builder: (context, state, _) {
        if (!state.isInitialized ||
            !state.isRunning ||
            state.torchState == TorchState.unavailable) {
          return const SizedBox.shrink();
        }
        final on = state.torchState == TorchState.on;
        return IconButton(
          tooltip: on ? l.qrScanTorchOff : l.qrScanTorchOn,
          isSelected: on,
          icon: const Icon(Icons.flashlight_off_rounded),
          selectedIcon: const Icon(Icons.flashlight_on_rounded),
          onPressed: () =>
              controller.toggleTorch().catchError((Object e) {
                debugPrint('Torch toggle failed: $e');
              }),
        );
      },
    );
  }
}

/// Name of a scan type from [QrService.classifyContent] in the app language.
String qrTypeLabel(AppLocalizations l, String type) => switch (type) {
  'url' => l.qrScanTypeLink,
  'wifi' => l.qrScanTypeWifi,
  'contact' => l.qrScanTypeContact,
  _ => l.qrScanTypeText,
};

extension _FirstOrNull<E> on List<E> {
  E? get firstOrNull => isEmpty ? null : first;
}
