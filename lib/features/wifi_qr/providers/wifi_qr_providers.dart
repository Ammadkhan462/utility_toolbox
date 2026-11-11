import 'package:flutter_riverpod/flutter_riverpod.dart';

enum WifiEncryption { wpa, wep, none }

// autoDispose: the form fields have no controllers, so values kept from a
// previous visit produced a QR code for a network the empty form didn't show.
final wifiSsidProvider = StateProvider.autoDispose<String>((ref) => '');
final wifiPasswordProvider = StateProvider.autoDispose<String>((ref) => '');
final wifiEncryptionProvider = StateProvider.autoDispose<WifiEncryption>(
  (ref) => WifiEncryption.wpa,
);
final wifiHiddenProvider = StateProvider.autoDispose<bool>((ref) => false);
final showPasswordProvider = StateProvider.autoDispose<bool>((ref) => false);

final wifiQrStringProvider = Provider.autoDispose<String>((ref) {
  final ssid = ref.watch(wifiSsidProvider);
  final password = ref.watch(wifiPasswordProvider);
  final encryption = ref.watch(wifiEncryptionProvider);
  final hidden = ref.watch(wifiHiddenProvider);

  if (ssid.isEmpty) return '';

  final encStr = switch (encryption) {
    WifiEncryption.wpa => 'WPA',
    WifiEncryption.wep => 'WEP',
    WifiEncryption.none => 'nopass',
  };
  final pass = encryption == WifiEncryption.none
      ? ''
      : 'P:${escapeWifiField(password)};';

  return 'WIFI:T:$encStr;S:${escapeWifiField(ssid)};$pass${hidden ? 'H:true;' : ''};';
});

/// The WIFI: format reserves `\ ; , : "` — unescaped, a password such as
/// `a;b` produced a code that phones read as the wrong password.
String escapeWifiField(String value) =>
    value.replaceAllMapped(RegExp(r'[\\;,:"]'), (m) => '\\${m[0]}');
