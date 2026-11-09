import 'package:flutter_riverpod/flutter_riverpod.dart';

enum WifiEncryption { wpa, wep, none }

final wifiSsidProvider = StateProvider<String>((ref) => '');
final wifiPasswordProvider = StateProvider<String>((ref) => '');
final wifiEncryptionProvider = StateProvider<WifiEncryption>(
  (ref) => WifiEncryption.wpa,
);
final wifiHiddenProvider = StateProvider<bool>((ref) => false);
final showPasswordProvider = StateProvider<bool>((ref) => false);

final wifiQrStringProvider = Provider<String>((ref) {
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

  return 'WIFI:T:$encStr;S:$ssid;P:$password;H:$hidden;;';
});
