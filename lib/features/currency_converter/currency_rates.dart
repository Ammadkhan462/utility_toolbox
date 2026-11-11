import 'dart:async';
import 'dart:convert';
import 'dart:math' as math;

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

/// A USD-based rate table: how many units of each currency one US dollar
/// buys. Any pair is converted locally via USD (cross rate).
class RateTable {
  RateTable({required this.date, required Map<String, double> perUsd, this.fetchedAt})
    : perUsd = {...perUsd, 'USD': 1.0};

  /// Rate date reported by the source, e.g. "2026-11-10".
  final String date;

  /// Uppercase currency code → units per 1 USD.
  final Map<String, double> perUsd;

  /// When this table was downloaded (null if unknown).
  final DateTime? fetchedAt;

  bool has(String code) => perUsd.containsKey(code);

  /// Converts [amount] of [from] into [to]; null when a rate is missing.
  double? convert(double amount, String from, String to) {
    final f = perUsd[from];
    final t = perUsd[to];
    if (f == null || t == null || f <= 0 || t <= 0) return null;
    final v = amount / f * t;
    return v.isFinite ? v : null;
  }

  /// Price of one [from] in [to].
  double? rate(String from, String to) => convert(1, from, to);

  /// Parses the currency-api response for base USD:
  /// `{"date": "2026-11-10", "usd": {"eur": 0.92, ...}}`.
  static RateTable? parseApi(String body, {DateTime? fetchedAt}) {
    try {
      final json = jsonDecode(body);
      if (json is! Map) return null;
      final date = json['date'];
      final rates = json['usd'];
      if (date is! String || rates is! Map) return null;
      final out = <String, double>{};
      rates.forEach((k, v) {
        if (k is String && v is num && v > 0 && v.isFinite) {
          out[k.toUpperCase()] = v.toDouble();
        }
      });
      if (out.length < 10) return null; // clearly not a real table
      return RateTable(date: date, perUsd: out, fetchedAt: fetchedAt);
    } catch (_) {
      return null;
    }
  }

  String toCacheJson() =>
      jsonEncode({'date': date, 'fetchedAt': fetchedAt?.millisecondsSinceEpoch, 'rates': perUsd});

  static RateTable? fromCacheJson(String? s) {
    if (s == null) return null;
    try {
      final json = jsonDecode(s) as Map<String, dynamic>;
      final rates = (json['rates'] as Map).map(
        (k, v) => MapEntry(k as String, (v as num).toDouble()),
      );
      final at = json['fetchedAt'];
      return RateTable(
        date: json['date'] as String,
        perUsd: rates,
        fetchedAt: at is int ? DateTime.fromMillisecondsSinceEpoch(at) : null,
      );
    } catch (_) {
      return null;
    }
  }
}

/// Fraction digits to show for a converted [value]: the currency's usual
/// digits, or enough significant digits for tiny amounts (0.0036).
int displayFractionDigits(double value, int currencyDigits) {
  final abs = value.abs();
  if (abs == 0 || abs >= 1) return currencyDigits;
  final leadingZeros = (-math.log(abs) / math.ln10).floor();
  return math.min(8, math.max(currencyDigits, leadingZeros + 4));
}

/// Downloads and caches the USD rate table.
class CurrencyRatesService {
  CurrencyRatesService({http.Client? client}) : _client = client;

  final http.Client? _client;

  static const cacheKey = 'currency_rates_v1';
  static const timeout = Duration(seconds: 8);
  static const urls = [
    'https://cdn.jsdelivr.net/npm/@fawazahmed0/currency-api@latest/v1/currencies/usd.json',
    'https://latest.currency-api.pages.dev/v1/currencies/usd.json',
  ];

  /// Cached table is considered fresh for this long.
  static const maxAge = Duration(hours: 6);

  Future<RateTable?> loadCached() async {
    final prefs = await SharedPreferences.getInstance();
    return RateTable.fromCacheJson(prefs.getString(cacheKey));
  }

  /// Tries the primary URL, then the fallback. Throws when both fail.
  Future<RateTable> fetch() async {
    final client = _client ?? http.Client();
    Object? lastError;
    try {
      for (final url in urls) {
        try {
          final res = await client.get(Uri.parse(url)).timeout(timeout);
          if (res.statusCode != 200) {
            lastError = 'HTTP ${res.statusCode}';
            continue;
          }
          final table = RateTable.parseApi(utf8.decode(res.bodyBytes), fetchedAt: DateTime.now());
          if (table == null) {
            lastError = 'Bad response';
            continue;
          }
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString(cacheKey, table.toCacheJson());
          return table;
        } catch (e) {
          lastError = e;
        }
      }
    } finally {
      if (_client == null) client.close();
    }
    throw Exception('Rates unavailable: $lastError');
  }

  static bool isStale(RateTable t) {
    final at = t.fetchedAt;
    return at == null || DateTime.now().difference(at) > maxAge;
  }
}
