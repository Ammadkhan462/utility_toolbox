import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:utility_toolbox/core/services/storage_service.dart';
import 'package:utility_toolbox/features/currency_converter/currency_converter_screen.dart';
import 'package:utility_toolbox/features/currency_converter/currency_data.dart';
import 'package:utility_toolbox/features/currency_converter/currency_rates.dart';
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';

String _apiBody() => jsonEncode({
  'date': '2026-11-10',
  'usd': {
    'usd': 1,
    'eur': 0.9,
    'pkr': 280.0,
    'inr': 84.0,
    'jpy': 150.0,
    'gbp': 0.8,
    'sar': 3.75,
    'aed': 3.6725,
    'try': 34.0,
    'idr': 16000.0,
    'btc': 0.00001,
    'bad': 'x',
    'zero': 0,
  },
});

void main() {
  group('RateTable', () {
    final table = RateTable.parseApi(_apiBody())!;

    test('parses and uppercases codes, skipping junk', () {
      expect(table.date, '2026-11-10');
      expect(table.perUsd['EUR'], 0.9);
      expect(table.has('PKR'), isTrue);
      expect(table.has('BAD'), isFalse);
      expect(table.has('ZERO'), isFalse);
      expect(table.perUsd['USD'], 1);
    });

    test('cross rates go through USD', () {
      expect(table.convert(100, 'USD', 'PKR'), closeTo(28000, 1e-9));
      expect(table.convert(28000, 'PKR', 'USD'), closeTo(100, 1e-9));
      expect(table.convert(90, 'EUR', 'GBP'), closeTo(80, 1e-9));
      expect(table.rate('INR', 'PKR'), closeTo(280 / 84, 1e-12));
      expect(table.convert(1, 'PKR', 'XXX'), isNull);
      expect(table.convert(5, 'SAR', 'SAR'), closeTo(5, 1e-12));
    });

    test('rejects malformed responses', () {
      expect(RateTable.parseApi('not json'), isNull);
      expect(RateTable.parseApi('{"date":"x","eur":{}}'), isNull);
      expect(RateTable.parseApi('{"date":"x","usd":{"eur":1}}'), isNull);
    });

    test('cache round trip keeps rates and fetch time', () {
      final at = DateTime(2026, 11, 10, 8);
      final t = RateTable(date: '2026-11-10', perUsd: {'EUR': 0.9, 'PKR': 280}, fetchedAt: at);
      final back = RateTable.fromCacheJson(t.toCacheJson())!;
      expect(back.date, '2026-11-10');
      expect(back.perUsd['PKR'], 280);
      expect(back.fetchedAt, at);
      expect(RateTable.fromCacheJson('{broken'), isNull);
      expect(RateTable.fromCacheJson(null), isNull);
    });
  });

  test('displayFractionDigits gives tiny amounts enough precision', () {
    expect(displayFractionDigits(1234.5, 2), 2);
    expect(displayFractionDigits(0, 2), 2);
    expect(displayFractionDigits(0.5, 2), 4);
    expect(displayFractionDigits(0.0036, 2), 6);
    expect(displayFractionDigits(150, 0), 0);
    expect(displayFractionDigits(1e-12, 2), 8);
  });

  group('currency data', () {
    test('default currency for device country', () {
      expect(currencyForCountry('PK'), 'PKR');
      expect(currencyForCountry('in'), 'INR');
      expect(currencyForCountry('BD'), 'BDT');
      expect(currencyForCountry('ID'), 'IDR');
      expect(currencyForCountry('SA'), 'SAR');
      expect(currencyForCountry('AE'), 'AED');
      expect(currencyForCountry('TR'), 'TRY');
      expect(currencyForCountry('BR'), 'BRL');
      expect(currencyForCountry('DE'), 'EUR');
      expect(currencyForCountry('EC'), 'USD');
      expect(currencyForCountry('SN'), 'XOF');
      expect(currencyForCountry('GB'), 'GBP');
      expect(currencyForCountry('ZZ'), isNull);
      expect(currencyForCountry(null), isNull);
    });

    test('flags', () {
      expect(currencyFlag('PKR'), '🇵🇰');
      expect(currencyFlag('EUR'), '🇪🇺');
      expect(currencyFlag('XOF'), '🌐');
      expect(flagEmoji('tr'), '🇹🇷');
    });
  });

  group('CurrencyRatesService', () {
    setUp(() => SharedPreferences.setMockInitialValues({}));

    test('falls back to the second URL and caches the table', () async {
      final hits = <String>[];
      final client = MockClient((req) async {
        hits.add(req.url.host);
        if (req.url.host.contains('jsdelivr')) return http.Response('oops', 503);
        return http.Response(_apiBody(), 200);
      });
      final service = CurrencyRatesService(client: client);
      final table = await service.fetch();
      expect(table.perUsd['PKR'], 280);
      expect(hits.length, 2);
      final cached = await service.loadCached();
      expect(cached?.perUsd['PKR'], 280);
      expect(CurrencyRatesService.isStale(cached!), isFalse);
    });

    test('throws when every source fails', () async {
      final service = CurrencyRatesService(
        client: MockClient((_) async => throw http.ClientException('offline')),
      );
      expect(service.fetch(), throwsException);
    });
  });

  group('CurrencyConverterScreen', () {
    final cache = RateTable.parseApi(_apiBody(), fetchedAt: DateTime.now())!.toCacheJson();

    for (final (locale, scale) in [(const Locale('en'), 1.0), (const Locale('ar'), 2.0)]) {
      testWidgets('converts from cache, swaps, opens picker ($locale ×$scale)', (tester) async {
        await _pumpScreen(
          tester,
          const CurrencyConverterScreen(),
          locale: locale,
          textScale: scale,
          prefs: {
            CurrencyRatesService.cacheKey: cache,
            'currency_from': 'USD',
            'currency_to': 'EUR',
          },
        );
        if (locale.languageCode == 'en') expect(find.text('0.90 EUR'), findsOneWidget);
        await tester.tap(find.byIcon(Icons.swap_vert_rounded));
        await tester.pumpAndSettle();
        if (locale.languageCode == 'en') expect(find.text('1.11 USD'), findsOneWidget);
        await tester.tap(find.byIcon(Icons.expand_more_rounded).first);
        await tester.pumpAndSettle();
        await tester.enterText(find.byType(TextField).last, 'eur');
        await tester.pumpAndSettle();
        expect(find.text('Euro'), findsWidgets);
        await tester.tap(find.text('Euro').last);
        await tester.pumpAndSettle();
        if (locale.languageCode == 'en') expect(find.text('1.00 EUR'), findsNothing);
      });
    }

    testWidgets('shows the offline empty state without cache', (tester) async {
      await _pumpScreen(tester, const CurrencyConverterScreen());
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(find.text('Rates not downloaded yet'), findsOneWidget);
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
