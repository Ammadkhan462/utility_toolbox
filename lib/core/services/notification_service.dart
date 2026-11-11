import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

/// Handles local notifications — fires a "download complete" notification
/// after a file is saved to Downloads so the user can tap to open it.
class NotificationService {
  NotificationService._();

  static final _plugin = FlutterLocalNotificationsPlugin();
  static bool _initialized = false;

  /// Call once from `main()` before `runApp()`.
  static Future<void> initialize() async {
    if (_initialized) return;

    // initialize() takes a positional InitializationSettings argument —
    // NOT a named 'settings:' parameter.
    await _plugin.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('ic_notification'),
        iOS: DarwinInitializationSettings(
          requestAlertPermission: true,
          requestBadgePermission: false,
          requestSoundPermission: false,
        ),
      ),
      // This was completely missing before, which is why tapping the
      // notification (or its "Open" action) did nothing: the payload was
      // being set on show(), but nothing was ever listening for the tap.
      onDidReceiveNotificationResponse: _onNotificationTap,
      onDidReceiveBackgroundNotificationResponse: _onBackgroundNotificationTap,
    );

    _initialized = true;
  }

  /// Opens the file (via its content:// URI, passed as [savedPath] to
  /// [showDownloadComplete]) in whatever app the OS picks — a PDF viewer,
  /// etc. Fired both by tapping the notification body and by the "Open"
  /// action button; both carry the same payload.
  static Future<void> _openPayload(String? payload) async {
    if (payload == null || payload.isEmpty) return;
    final uri = Uri.parse(payload);
    try {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (_) {
      // No app available to open it, or the URI is stale — nothing more
      // we can do from here.
    }
  }

  static void _onNotificationTap(NotificationResponse response) {
    _openPayload(response.payload);
  }

  @pragma('vm:entry-point')
  static void _onBackgroundNotificationTap(NotificationResponse response) {
    _openPayload(response.payload);
  }

  /// Shows a persistent "Download complete" notification.
  ///
  /// [fileName] appears as the notification body (e.g. "merged_1234.pdf").
  /// [savedPath] must be a URI the OS can hand to another app (a
  /// content:// URI) — a raw private file path will silently fail to open
  /// when tapped, since other apps can't read it.
  static Future<void> showDownloadComplete({
    required String fileName,
    required String savedPath,
    String mimeType = 'application/pdf',
  }) async {
    await initialize();

    // Request permission on Android 13+. Guarded on its own: some OEM
    // ROMs (heavily customized ones, which Infinix/XOS is) throw instead
    // of returning false when the permission dialog can't be shown (e.g.
    // notifications disabled by policy, or a dialog already in flight from
    // the gallery-save permission request that just ran). Never let this
    // step take the whole download flow down with it.
    try {
      await _plugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >()
          ?.requestNotificationsPermission();
    } catch (_) {
      // If we can't get permission, just skip the notification below.
      return;
    }

    const androidDetails = AndroidNotificationDetails(
      'downloads_channel',
      'Downloads',
      channelDescription: 'Notifies when a file has been saved to Downloads',
      importance: Importance.high,
      priority: Priority.high,
      autoCancel: false,
      styleInformation: BigTextStyleInformation(''),
      actions: [
        AndroidNotificationAction(
          'open_file',
          'Open',
          showsUserInterface: true,
        ),
      ],
    );

    const darwinDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: false,
      presentSound: false,
    );

    final id = savedPath.hashCode & 0x7FFFFFFF;

    // show() takes positional args: (int id, String? title, String? body,
    // NotificationDetails details, {String? payload})
    try {
      await _plugin.show(
        id,
        'Download complete',
        fileName,
        const NotificationDetails(android: androidDetails, iOS: darwinDetails),
        payload: savedPath,
      );
    } catch (_) {
      // The file is already saved successfully — a notification failure
      // here should never surface as a crash to the user.
    }
  }
}

final notificationServiceProvider = Provider<NotificationService>((_) {
  throw UnimplementedError(
    'NotificationService is a static-only class; '
    'access it via NotificationService.showDownloadComplete()',
  );
});
