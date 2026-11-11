import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// Raw intent payload from MainActivity (see its class doc for the shape).
typedef RawIntent = Map<Object?, Object?>;

/// Thin wrapper over the `utility_toolbox/system` channel in MainActivity.kt.
/// Every call is a no-op (returns null/false) off Android, so callers never
/// need platform checks.
class SystemBridge {
  SystemBridge._() {
    if (_supported) _channel.setMethodCallHandler(_onCall);
  }

  static final SystemBridge instance = SystemBridge._();

  static const _channel = MethodChannel('utility_toolbox/system');
  static bool get _supported => !kIsWeb && Platform.isAndroid;

  final _intents = StreamController<RawIntent>.broadcast();

  /// Intents delivered while the app is already running (onNewIntent).
  Stream<RawIntent> get intents => _intents.stream;

  Future<Object?> _onCall(MethodCall call) async {
    if (call.method == 'onIntent' && call.arguments is Map) {
      _intents.add(call.arguments as RawIntent);
    }
    return null;
  }

  /// Whether the app was launched by a share/open-with/shortcut intent.
  /// Cheap: does not copy any shared files.
  Future<bool> hasInitialIntent() => _invokeBool('hasInitialIntent', const {});

  /// The intent that launched the app, delivered at most once per process.
  Future<RawIntent?> getInitialIntent() async {
    if (!_supported) return null;
    try {
      return await _channel.invokeMethod<RawIntent>('getInitialIntent');
    } on PlatformException catch (e) {
      debugPrint('getInitialIntent failed: $e');
      return null;
    }
  }

  /// Asks the launcher to pin a shortcut that opens [toolId] directly.
  /// Returns false when the launcher can't pin shortcuts (or Android < 8).
  Future<bool> pinShortcut({required String toolId, required String label}) =>
      _invokeBool('pinShortcut', {'toolId': toolId, 'label': label});

  /// Opens a content:// URI or app file in another app (with a chooser).
  Future<bool> openFile(String location, String mimeType) =>
      _invokeBool('openFile', {'location': location, 'mimeType': mimeType});

  /// Shares a content:// URI or app file through the system share sheet.
  Future<bool> shareFile(String location, String mimeType) =>
      _invokeBool('shareFile', {'location': location, 'mimeType': mimeType});

  /// Whether the phone has a flash LED the app can switch on.
  Future<bool> hasTorch() => _invokeBool('hasTorch', const {});

  /// Turns the flash LED on or off. Returns false when there is no flash or
  /// another app is using the camera.
  Future<bool> setTorch(bool on) => _invokeBool('setTorch', {'on': on});

  /// Forces this app window's brightness (0..1); `null` gives control back
  /// to the system setting. Used by the flashlight's screen-light mode.
  Future<bool> setScreenBrightness(double? value) =>
      _invokeBool('setScreenBrightness', {'value': value});

  Future<bool> _invokeBool(String method, Map<String, Object?> args) async {
    if (!_supported) return false;
    try {
      return await _channel.invokeMethod<bool>(method, args) ?? false;
    } on PlatformException catch (e) {
      debugPrint('$method failed: $e');
      return false;
    }
  }
}
