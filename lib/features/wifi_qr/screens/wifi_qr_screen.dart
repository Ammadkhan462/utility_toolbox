import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:utility_toolbox/core/widgets/premium_button.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/features/wifi_qr/providers/wifi_qr_providers.dart';

const _accentColor = Color(0xFF06B6D4);
const _accentGlow  = Color(0xFF22D3EE);
final _qrKey = GlobalKey();

class WifiQrScreen extends ConsumerWidget {
  const WifiQrScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qrString = ref.watch(wifiQrStringProvider);
    final encryption = ref.watch(wifiEncryptionProvider);
    final hidden = ref.watch(wifiHiddenProvider);
    final showPass = ref.watch(showPasswordProvider);
    final theme = Theme.of(context);

    return ToolScaffold(
      title: 'WiFi QR Generator',
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
                              Text(
                                'Enter WiFi details\nto generate QR',
                                textAlign: TextAlign.center,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: theme.colorScheme.onSurfaceVariant,
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
            Text('Network details', style: theme.textTheme.labelLarge),
            const SizedBox(height: 12),

            // SSID
            _WifiTextField(
              label: 'Network Name (SSID)',
              hint: 'My Home WiFi',
              icon: Icons.wifi_rounded,
              onChanged: (v) => ref.read(wifiSsidProvider.notifier).state = v,
            ),
            const SizedBox(height: 12),

            // Password (hidden if nopass)
            if (encryption != WifiEncryption.none) ...[
              _WifiTextField(
                label: 'Password',
                hint: 'Enter password',
                icon: Icons.lock_rounded,
                obscure: !showPass,
                onChanged: (v) =>
                    ref.read(wifiPasswordProvider.notifier).state = v,
                suffix: IconButton(
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
            Text('Security', style: theme.textTheme.labelLarge),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              children: WifiEncryption.values.map((e) {
                final label = switch (e) {
                  WifiEncryption.wpa => 'WPA/WPA2',
                  WifiEncryption.wep => 'WEP',
                  WifiEncryption.none => 'None (Open)',
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
                  onSelected: (_) =>
                      ref.read(wifiEncryptionProvider.notifier).state = e,
                );
              }).toList(),
            ),
            const SizedBox(height: 12),

            // Hidden network toggle
            SwitchListTile.adaptive(
              value: hidden,
              onChanged: (v) => ref.read(wifiHiddenProvider.notifier).state = v,
              title: const Text('Hidden network'),
              subtitle: const Text('Enable if SSID is not broadcast'),
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
                      onPressed: () => _shareQr(),
                      icon: Icons.share_rounded,
                      label: 'Share',
                      accent: _accentColor,
                      dense: true,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: PremiumButton(
                      onPressed: () => _saveQr(),
                      icon: Icons.download_rounded,
                      label: 'Save Image',
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
                        'Anyone who scans this QR code will automatically connect to your WiFi network.',
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
    final bytes = await _captureQr();
    if (bytes == null) return;
    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/wifi_qr.png');
    await file.writeAsBytes(bytes);

    // Updated syntax for share_plus package
    await Share.shareXFiles([
      XFile(file.path),
    ], text: 'Scan this QR code to connect to my WiFi!');
  }

  Future<void> _saveQr() async {
    // Reuse share as the save mechanism (works cross-platform without gal).
    await _shareQr();
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
