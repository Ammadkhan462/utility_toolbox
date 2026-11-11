import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:utility_toolbox/core/services/storage_service.dart';
import 'package:utility_toolbox/features/direct_chat/calling_codes.dart';
import 'package:utility_toolbox/features/direct_chat/direct_chat_screen.dart';
import 'package:utility_toolbox/features/direct_chat/phone_utils.dart';
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';

void main() {
  group('normalizePhone', () {
    String n(String input, String dial) => normalizePhone(input, dial).digits;

    test('national numbers drop the trunk zero', () {
      expect(n('0300-1234567', '92'), '923001234567');
      expect(n('(0300) 123 4567', '92'), '923001234567');
      expect(n('07700 900123', '44'), '447700900123');
      expect(n('01712-345678', '880'), '8801712345678');
      expect(n('0812-3456-7890', '62'), '6281234567890');
      expect(n('98765 43210', '91'), '919876543210');
      expect(n('(415) 555-2671', '1'), '14155552671');
    });

    test('international forms are kept as typed', () {
      expect(n('+92 300 1234567', '91'), '923001234567');
      expect(n('0092 300 1234567', '1'), '923001234567');
      expect(n('+1 (415) 555-2671', '92'), '14155552671');
      expect(n('923001234567', '92'), '923001234567');
      expect(n('14155552671', '1'), '14155552671');
    });

    test('a national number starting like the country code is still national', () {
      // Indian mobile numbers can start with 91.
      expect(n('9123456789', '91'), '919123456789');
    });

    test('country-specific trunk prefixes', () {
      expect(n('8 (912) 345-67-89', '7'), '79123456789');
      expect(n('06 30 123 4567', '36'), '36301234567');
      expect(n('8 029 123 45 67', '375'), '375291234567');
      // Italy keeps the leading zero of landlines.
      expect(n('06 1234 5678', '39'), '390612345678');
    });

    test('native digits', () {
      expect(n('٠٥٠١٢٣٤٥٦٧', '966'), '966501234567');
      expect(n('۰۳۰۰۱۲۳۴۵۶۷', '92'), '923001234567');
    });

    test('validation', () {
      expect(normalizePhone('', '92').issue, PhoneIssue.empty);
      expect(normalizePhone('12', '92').issue, PhoneIssue.tooShort);
      expect(normalizePhone('+1234567890123456', '92').issue, PhoneIssue.tooLong);
      expect(normalizePhone('0300 1234567', '92').isValid, isTrue);
    });
  });

  group('extractPhoneNumber', () {
    test('finds numbers in shared text', () {
      expect(extractPhoneNumber('Call me at 0300-1234567 please'), '0300-1234567');
      expect(extractPhoneNumber('Contact: +971 50 123 4567.'), '+971 50 123 4567');
      expect(extractPhoneNumber('https://wa.me/923001234567?text=hi'), '+923001234567');
      expect(extractPhoneNumber('tel:+14155552671'), '+14155552671');
      expect(extractPhoneNumber('No number here'), isNull);
      expect(extractPhoneNumber('Room 12'), isNull);
    });
  });

  group('chat link', () {
    test('encodes the message', () {
      expect(chatLink('923001234567', '').toString(), 'https://wa.me/923001234567');
      expect(
        chatLink('923001234567', 'Salam! Price & size?').toString(),
        'https://wa.me/923001234567?text=Salam!%20Price%20%26%20size%3F',
      );
    });

    test('display', () {
      expect(displayPhone('923001234567', '92'), '+92 3001234567');
      expect(displayPhone('14155552671', '92'), '+14155552671');
    });
  });

  group('calling codes', () {
    test('longest prefix wins and shared codes prefer the user country', () {
      expect(callingCodeForNumber('923001234567')?.iso, 'PK');
      expect(callingCodeForNumber('8801712345678')?.iso, 'BD');
      expect(callingCodeForNumber('14155552671')?.iso, 'US');
      expect(callingCodeForNumber('14165552671', preferIso: 'CA')?.iso, 'CA');
      expect(callingCodeForNumber('77011234567', preferIso: 'KZ')?.iso, 'KZ');
      expect(callingCodeForNumber('971501234567')?.iso, 'AE');
      expect(callingCodeForIso('tr')?.dial, '90');
    });

    test('every entry is well formed and unique', () {
      final isos = <String>{};
      for (final c in callingCodes) {
        expect(RegExp(r'^[A-Z]{2}$').hasMatch(c.iso), isTrue, reason: c.iso);
        expect(RegExp(r'^\d{1,4}$').hasMatch(c.dial), isTrue, reason: c.iso);
        expect(isos.add(c.iso), isTrue, reason: 'duplicate ${c.iso}');
      }
    });
  });

  group('DirectChatScreen', () {
    for (final (locale, scale) in [(const Locale('en'), 1.0), (const Locale('ur'), 2.0)]) {
      testWidgets('prefills shared number, history, picker ($locale ×$scale)', (tester) async {
        await _pumpScreen(
          tester,
          const DirectChatScreen(initialText: 'Order from +92 300 1234567 today'),
          locale: locale,
          textScale: scale,
          prefs: {
            'direct_chat_history': ['447700900123'],
          },
        );
        expect(find.text('3001234567'), findsOneWidget);
        expect(find.text('+92'), findsOneWidget);
        await tester.scrollUntilVisible(find.text('+44 7700900123'), 200, scrollable: _vertical());
        expect(find.text('+44 7700900123'), findsOneWidget);
        // Launching fails in tests (no plugin) → friendly snackbar.
        final launched = <Object?>[];
        tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
          const MethodChannel('plugins.flutter.io/url_launcher'),
          (call) async {
            launched.add(call.arguments is Map ? (call.arguments as Map)['url'] : call.arguments);
            return false; // pretend the app is missing → friendly snackbar
          },
        );
        await tester.ensureVisible(find.byIcon(Icons.chat_rounded));
        await tester.tap(find.byIcon(Icons.chat_rounded));
        await tester.pumpAndSettle();
        expect(launched, ['https://wa.me/923001234567']);
        expect(find.byType(SnackBar), findsOneWidget);
        await tester.scrollUntilVisible(find.text('+92'), -200, scrollable: _vertical());
        await tester.pumpAndSettle();
        await tester.tap(find.text('+92'));
        await tester.pumpAndSettle();
        await tester.enterText(find.byType(TextField).last, 'türk');
        await tester.pumpAndSettle();
        await tester.tap(find.text('Türkiye'));
        await tester.pumpAndSettle();
        expect(find.text('+90'), findsOneWidget);
        await tester.scrollUntilVisible(
          find.byIcon(Icons.delete_outline_rounded),
          200,
          scrollable: _vertical(),
        );
        await tester.ensureVisible(find.byIcon(Icons.delete_outline_rounded));
        await tester.pumpAndSettle();
        await tester.tap(find.byIcon(Icons.delete_outline_rounded));
        await tester.pumpAndSettle();
        expect(find.text('+44 7700900123'), findsNothing);
      });
    }

    testWidgets('shared text without a number becomes the message', (tester) async {
      await _pumpScreen(tester, const DirectChatScreen(initialText: 'Hello there'));
      expect(find.text('Hello there'), findsOneWidget);
    });
  });
}

// ── Widget smoke test helper ───────────────────────────────────────────────

Future<void> _pumpScreen(
  WidgetTester tester,
  Widget screen, {
  Locale locale = const Locale('en'),
  double textScale = 1,
  Map<String, Object> prefs = const {},
}) async {
  SharedPreferences.setMockInitialValues(prefs);
  final storage = StorageService(await SharedPreferences.getInstance());
  tester.view.physicalSize = const Size(360 * 2, 740 * 2);
  tester.view.devicePixelRatio = 2;
  addTearDown(tester.view.reset);
  await tester.pumpWidget(
    ProviderScope(
      overrides: [storageServiceProvider.overrideWithValue(storage)],
      child: MaterialApp(
        locale: locale,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(textScale)),
          child: child!,
        ),
        home: screen,
      ),
    ),
  );
  await tester.pumpAndSettle();
}

Finder _vertical() => find
    .byWidgetPredicate(
      (w) => w is Scrollable && axisDirectionToAxis(w.axisDirection) == Axis.vertical,
    )
    .hitTestable()
    .first;
