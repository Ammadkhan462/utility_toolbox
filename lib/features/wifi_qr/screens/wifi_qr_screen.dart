import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:utility_toolbox/core/utils/file_utils.dart';
import 'package:utility_toolbox/core/widgets/premium_button.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/features/wifi_qr/providers/wifi_qr_providers.dart';
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';

const _accentColor = Color(0xFF06B6D4);
const _accentGlow  = Color(0xFF22D3EE);

class WifiQrScreen extends ConsumerStatefulWidget {
  const WifiQrScreen({super.key});

  @override
  ConsumerState<WifiQrScreen> createState() => _WifiQrScreenState();
}

class _WifiQrScreenState extends ConsumerState<WifiQrScreen> {
  // Per screen, not a top-level global: two live instances (e.g. reopening
  // the tool during the pop animation) crashed with a duplicate GlobalKey.
  final _qrKey = GlobalKey();
  bool _busy = false;

  @override
  Widget build(BuildContext context) {
    final qrString = ref.watch(wifiQrStringProvider);
    final encryption = ref.watch(wifiEncryptionProvider);
    final hidden = ref.watch(wifiHiddenProvider);
    final showPass = ref.watch(showPasswordProvider);
    final theme = Theme.of(context);
    final l = AppLocalizations.of(context);

    return ToolScaffold(
      title: l.toolWifiQrTitle,
      accentColor: _accentColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ── QR preview ───────────────────────────────────────────────
            Center(
              child: RepaintBoundary(
                key: _qrKey,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: qrString.isEmpty
                      ? Container(
                          key: const ValueKey('placeholder'),
                          width: 220,
                          height: 220,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.surface,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: _accentColor.withValues(alpha: 0.3),
                              width: 2,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.wifi_rounded,
                                size: 56,
                                color: _accentColor.withValues(alpha: 0.4),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                l.wifiQrPlaceholder,
                                textAlign: TextAlign.center,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: theme.colorScheme.onSurfaceVariant,
                                ),
                              ),
                              ),
                            ],
                          ),
                        )
                      : Container(
                          key: const ValueKey('qr'),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: _accentColor.withValues(alpha: 0.2),
                                blurRadius: 20,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: QrImageView(
                            data: qrString,
                            semanticsLabel: l.wifiQrPreviewLabel,
                            version: QrVersions.auto,
                            size: 188,
                            backgroundColor: Colors.white,
                            eyeStyle: const QrEyeStyle(
                              eyeShape: QrEyeShape.square,
                              color: Color(0xFF0891B2),
                            ),
                            dataModuleStyle: const QrDataModuleStyle(
                              dataModuleShape: QrDataModuleShape.square,
                              color: Color(0xFF0F172A),
                            ),
                          ),
                        ),
                ),
              ),
            ),
            const SizedBox(height: 28),

            // ── Form ─────────────────────────────────────────────────────
            Text(l.wifiQrNetworkDetails, style: theme.textTheme.labelLarge),
            const SizedBox(height: 12),

            // SSID
            _WifiTextField(
              label: l.wifiQrSsidLabel,
              hint: l.wifiQrSsidHint,
              icon: Icons.wifi_rounded,
              onChanged: (v) => ref.read(wifiSsidProvider.notifier).state = v,
            ),
            const SizedBox(height: 12),

            // Password (hidden if nopass)
            if (encryption != WifiEncryption.none) ...[
              _WifiTextField(
                label: l.wifiQrPasswordLabel,
                hint: l.wifiQrPasswordHint,
                icon: Icons.lock_rounded,
                obscure: !showPass,
                onChanged: (v) =>
                    ref.read(wifiPasswordProvider.notifier).state = v,
                suffix: IconButton(
                  tooltip: showPass ? l.wifiQrHidePassword : l.wifiQrShowPassword,
                  icon: Icon(
                    showPass
                        ? Icons.visibility_off_rounded
                        : Icons.visibility_rounded,
                    size: 20,
                  ),
                  onPressed: () =>
                      ref.read(showPasswordProvider.notifier).state = !showPass,
                ),
              ),
              const SizedBox(height: 12),
            ],

            // Encryption
            Text(l.wifiQrSecurity, style: theme.textTheme.labelLarge),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: WifiEncryption.values.map((e) {
                final label = switch (e) {
                  WifiEncryption.wpa => 'WPA/WPA2',
                  WifiEncryption.wep => 'WEP',
                  WifiEncryption.none => l.wifiQrSecurityNone,
                };
                return ChoiceChip(
                  label: Text(label),
                  selected: encryption == e,
                  selectedColor: _accentColor.withValues(alpha: 0.15),
                  labelStyle: TextStyle(
                    color: encryption == e
                        ? _accentColor
                        : theme.colorScheme.onSurfaceVariant,
                    fontWeight: encryption == e
                        ? FontWeight.w700
                        : FontWeight.w400,
                  ),
                  side: BorderSide(
                    color: encryption == e
                        ? _accentColor.withValues(alpha: 0.5)
                        : theme.colorScheme.outline.withValues(alpha: 0.3),
                  ),
                  onSelected: (_) {
                    ref.read(wifiEncryptionProvider.notifier).state = e;
                    // The password field leaves the tree for open networks
                    // and comes back empty; drop the old value with it.
                    if (e == WifiEncryption.none) {
                      ref.read(wifiPasswordProvider.notifier).state = '';
                    }
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 12),

            // Hidden network toggle
            SwitchListTile.adaptive(
              value: hidden,
              onChanged: (v) => ref.read(wifiHiddenProvider.notifier).state = v,
              title: Text(l.wifiQrHidden),
              subtitle: Text(l.wifiQrHiddenHint),
              activeThumbColor: _accentColor,
              activeTrackColor: _accentColor.withValues(alpha: 0.5),
              contentPadding: EdgeInsets.zero,
            ),
            const SizedBox(height: 24),

            // Actions
            if (qrString.isNotEmpty) ...[
              Row(
                children: [
                  Expanded(
                    child: PremiumOutlineButton(
                      onPressed: _busy ? null : _shareQr,
                      icon: Icons.share_rounded,
                      label: l.commonShare,
                      accent: _accentColor,
                      dense: true,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: PremiumButton(
                      onPressed: _busy ? null : _saveQr,
                      icon: Icons.download_rounded,
                      label: l.wifiQrSaveImage,
                      gradient: const LinearGradient(
                          colors: [_accentColor, _accentGlow]),
                      dense: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // Info card
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: _accentColor.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: _accentColor.withValues(alpha: 0.25),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline_rounded,
                      color: _accentColor,
                      size: 18,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        l.wifiQrInfo,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: _accentColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Future<Uint8List?> _captureQr() async {
    try {
      final boundary =
          _qrKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
      if (boundary == null) return null;
      final image = await boundary.toImage(pixelRatio: 3.0);
      final data = await image.toByteData(format: ui.ImageByteFormat.png);
      return data?.buffer.asUint8List();
    } catch (_) {
      return null;
    }
  }

  Future<void> _shareQr() async {
    if (_busy) return;
    final shareText = AppLocalizations.of(context).wifiQrShareText;
    setState(() => _busy = true);
    try {
      final bytes = await _captureQr();
      if (bytes == null) return;
      final dir = await getTemporaryDirectory();
      final file = File('${dir.path}/wifi_qr.png');
      await file.writeAsBytes(bytes);

      // Updated syntax for share_plus package
      await Share.shareXFiles([
        XFile(file.path),
      ], text: shareText);
    } catch (e) {
      debugPrint('WiFi QR share failed: $e');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  /// Saves to the gallery and My Files (it used to only open the share
  /// sheet, so nothing was ever saved or listed in My Files).
  Future<void> _saveQr() async {
    if (_busy) return;
    setState(() => _busy = true);
    try {
      final bytes = await _captureQr();
      if (bytes == null || !mounted) return;
      final ok = await FileUtils.saveImageToGallery(
        bytes: bytes,
        fileName: 'wifi_qr_${DateTime.now().millisecondsSinceEpoch}.png',
        mimeType: 'image/png',
        toolId: 'wifi_qr',
      );
      if (!mounted) return;
      final l = AppLocalizations.of(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(ok ? l.commonSavedToGallery : l.commonSaveFailed)),
      );
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }
}

// ── WiFi text field ────────────────────────────────────────────────────────

class _WifiTextField extends StatelessWidget {
  const _WifiTextField({
    required this.label,
    required this.hint,
    required this.icon,
    required this.onChanged,
    this.obscure = false,
    this.suffix,
  });

  final String label;
  final String hint;
  final IconData icon;
  final void Function(String) onChanged;
  final bool obscure;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscure,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon, size: 20),
        suffixIcon: suffix,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
        filled: true,
      ),
      onChanged: onChanged,
    );
  }
}
