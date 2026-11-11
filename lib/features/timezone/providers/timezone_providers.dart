import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utility_toolbox/core/services/storage_service.dart';

/// Rows the native World Clock home-screen widget shows by default (at its
/// initial/minimum size). Keep in sync with DEFAULT_ROWS in
/// WorldClockWidgetProvider.kt.
const int kWidgetDefaultRows = 4;

/// Most rows the widget will ever show, even if the user resizes it as
/// large as possible. Keep in sync with MAX_ROWS in
/// WorldClockWidgetProvider.kt and the number of wc_row_N blocks in
/// widget_world_clock.xml.
const int kWidgetMaxRows = 8;

/// Daylight-saving rule a city follows (current law, as of 2026). Dart has
/// no tz database, so the handful of rules our cities use live here; the
/// native widget uses the IANA [TzCity.zone] and gets DST from the OS.
enum TzDstRule {
  none,

  /// US & Canada: 2nd Sunday of March 02:00 → 1st Sunday of November 02:00.
  northAmerica,

  /// EU & UK: last Sunday of March → last Sunday of October, 01:00 UTC.
  europe,

  /// New South Wales: 1st Sunday of October 02:00 → 1st Sunday of April 03:00.
  australiaSouthEast,

  /// New Zealand: last Sunday of September 02:00 → 1st Sunday of April 03:00.
  newZealand,

  /// Egypt (since 2023): last Friday of April 00:00 → last Thursday of
  /// October 24:00.
  egypt,
}

// Curated list of world timezones with UTC offsets in hours
class TzCity {
  final String name;
  final String country;
  final String zone;    // IANA zone name (display only; we compute offset)
  final double offsetHours; // Standard (non-DST) UTC offset in hours
  final TzDstRule dst;
  final String flag;

  const TzCity({
    required this.name,
    required this.country,
    required this.zone,
    required this.offsetHours,
    required this.flag,
    this.dst = TzDstRule.none,
  });

  /// UTC offset in hours at the instant [utc], including DST.
  double offsetHoursAt(DateTime utc) =>
      offsetHours + (_isDst(utc.toUtc()) ? 1 : 0);

  /// UTC offset in hours right now, including DST.
  double get currentOffsetHours => offsetHoursAt(DateTime.now().toUtc());

  /// Wall-clock time in this city. The returned value is a UTC DateTime
  /// whose fields read as the local time there.
  DateTime get currentTime {
    final utc = DateTime.now().toUtc();
    return utc.add(Duration(minutes: (offsetHoursAt(utc) * 60).round()));
  }

  bool _isDst(DateTime utc) {
    final y = utc.year;
    // Local wall-clock hour [localHour] (in standard time, or DST when
    // [inDst]) on [day] expressed as a UTC instant.
    DateTime at(int month, int day, int localHour, {bool inDst = false}) =>
        DateTime.utc(y, month, day, localHour - offsetHours.round() - (inDst ? 1 : 0));
    bool between(DateTime start, DateTime end) =>
        !utc.isBefore(start) && utc.isBefore(end);

    switch (dst) {
      case TzDstRule.none:
        return false;
      case TzDstRule.northAmerica:
        return between(
          at(3, _nthWeekday(y, 3, DateTime.sunday, 2), 2),
          at(11, _nthWeekday(y, 11, DateTime.sunday, 1), 2, inDst: true),
        );
      case TzDstRule.europe:
        return between(
          DateTime.utc(y, 3, _lastWeekday(y, 3, DateTime.sunday), 1),
          DateTime.utc(y, 10, _lastWeekday(y, 10, DateTime.sunday), 1),
        );
      case TzDstRule.australiaSouthEast:
        // Southern hemisphere: DST spans the new year.
        return utc.isBefore(at(4, _nthWeekday(y, 4, DateTime.sunday, 1), 3, inDst: true)) ||
            !utc.isBefore(at(10, _nthWeekday(y, 10, DateTime.sunday, 1), 2));
      case TzDstRule.newZealand:
        return utc.isBefore(at(4, _nthWeekday(y, 4, DateTime.sunday, 1), 3, inDst: true)) ||
            !utc.isBefore(at(9, _lastWeekday(y, 9, DateTime.sunday), 2));
      case TzDstRule.egypt:
        return between(
          at(4, _lastWeekday(y, 4, DateTime.friday), 0),
          at(10, _lastWeekday(y, 10, DateTime.thursday), 24, inDst: true),
        );
    }
  }

  /// Day of month of the [n]th [weekday] (1 = first) in [month].
  static int _nthWeekday(int year, int month, int weekday, int n) {
    final first = DateTime.utc(year, month, 1).weekday;
    return 1 + (weekday - first + 7) % 7 + 7 * (n - 1);
  }

  /// Day of month of the last [weekday] in [month].
  static int _lastWeekday(int year, int month, int weekday) {
    final last = DateTime.utc(year, month + 1, 0);
    return last.day - (last.weekday - weekday + 7) % 7;
  }
}

const _allCities = <TzCity>[
  TzCity(name: 'Karachi',        country: 'Pakistan',        zone: 'Asia/Karachi',          offsetHours:  5.0,  flag: '🇵🇰'),
  TzCity(name: 'Lahore',         country: 'Pakistan',        zone: 'Asia/Karachi',          offsetHours:  5.0,  flag: '🇵🇰'),
  TzCity(name: 'New York',       country: 'United States',   zone: 'America/New_York',      offsetHours: -5.0,  flag: '🇺🇸', dst: TzDstRule.northAmerica),
  TzCity(name: 'Los Angeles',    country: 'United States',   zone: 'America/Los_Angeles',   offsetHours: -8.0,  flag: '🇺🇸', dst: TzDstRule.northAmerica),
  TzCity(name: 'Chicago',        country: 'United States',   zone: 'America/Chicago',       offsetHours: -6.0,  flag: '🇺🇸', dst: TzDstRule.northAmerica),
  TzCity(name: 'London',         country: 'United Kingdom',  zone: 'Europe/London',         offsetHours:  0.0,  flag: '🇬🇧', dst: TzDstRule.europe),
  TzCity(name: 'Paris',          country: 'France',          zone: 'Europe/Paris',          offsetHours:  1.0,  flag: '🇫🇷', dst: TzDstRule.europe),
  TzCity(name: 'Berlin',         country: 'Germany',         zone: 'Europe/Berlin',         offsetHours:  1.0,  flag: '🇩🇪', dst: TzDstRule.europe),
  TzCity(name: 'Dubai',          country: 'UAE',             zone: 'Asia/Dubai',            offsetHours:  4.0,  flag: '🇦🇪'),
  TzCity(name: 'Riyadh',         country: 'Saudi Arabia',    zone: 'Asia/Riyadh',           offsetHours:  3.0,  flag: '🇸🇦'),
  TzCity(name: 'Istanbul',       country: 'Turkey',          zone: 'Europe/Istanbul',       offsetHours:  3.0,  flag: '🇹🇷'),
  TzCity(name: 'Moscow',         country: 'Russia',          zone: 'Europe/Moscow',         offsetHours:  3.0,  flag: '🇷🇺'),
  TzCity(name: 'Mumbai',         country: 'India',           zone: 'Asia/Kolkata',          offsetHours:  5.5,  flag: '🇮🇳'),
  TzCity(name: 'Delhi',          country: 'India',           zone: 'Asia/Kolkata',          offsetHours:  5.5,  flag: '🇮🇳'),
  TzCity(name: 'Dhaka',          country: 'Bangladesh',      zone: 'Asia/Dhaka',            offsetHours:  6.0,  flag: '🇧🇩'),
  TzCity(name: 'Bangkok',        country: 'Thailand',        zone: 'Asia/Bangkok',          offsetHours:  7.0,  flag: '🇹🇭'),
  TzCity(name: 'Singapore',      country: 'Singapore',       zone: 'Asia/Singapore',        offsetHours:  8.0,  flag: '🇸🇬'),
  TzCity(name: 'Beijing',        country: 'China',           zone: 'Asia/Shanghai',         offsetHours:  8.0,  flag: '🇨🇳'),
  TzCity(name: 'Hong Kong',      country: 'China',           zone: 'Asia/Hong_Kong',        offsetHours:  8.0,  flag: '🇭🇰'),
  TzCity(name: 'Tokyo',          country: 'Japan',           zone: 'Asia/Tokyo',            offsetHours:  9.0,  flag: '🇯🇵'),
  TzCity(name: 'Seoul',          country: 'South Korea',     zone: 'Asia/Seoul',            offsetHours:  9.0,  flag: '🇰🇷'),
  TzCity(name: 'Sydney',         country: 'Australia',       zone: 'Australia/Sydney',      offsetHours: 10.0,  flag: '🇦🇺', dst: TzDstRule.australiaSouthEast),
  TzCity(name: 'Auckland',       country: 'New Zealand',     zone: 'Pacific/Auckland',      offsetHours: 12.0,  flag: '🇳🇿', dst: TzDstRule.newZealand),
  TzCity(name: 'São Paulo',      country: 'Brazil',          zone: 'America/Sao_Paulo',     offsetHours: -3.0,  flag: '🇧🇷'),
  TzCity(name: 'Buenos Aires',   country: 'Argentina',       zone: 'America/Argentina/Buenos_Aires', offsetHours: -3.0, flag: '🇦🇷'),
  TzCity(name: 'Toronto',        country: 'Canada',          zone: 'America/Toronto',       offsetHours: -5.0,  flag: '🇨🇦', dst: TzDstRule.northAmerica),
  TzCity(name: 'Vancouver',      country: 'Canada',          zone: 'America/Vancouver',     offsetHours: -8.0,  flag: '🇨🇦', dst: TzDstRule.northAmerica),
  TzCity(name: 'Cairo',          country: 'Egypt',           zone: 'Africa/Cairo',          offsetHours:  2.0,  flag: '🇪🇬', dst: TzDstRule.egypt),
  TzCity(name: 'Lagos',          country: 'Nigeria',         zone: 'Africa/Lagos',          offsetHours:  1.0,  flag: '🇳🇬'),
  TzCity(name: 'Nairobi',        country: 'Kenya',           zone: 'Africa/Nairobi',        offsetHours:  3.0,  flag: '🇰🇪'),
  TzCity(name: 'Kabul',          country: 'Afghanistan',     zone: 'Asia/Kabul',            offsetHours:  4.5,  flag: '🇦🇫'),
  TzCity(name: 'Colombo',        country: 'Sri Lanka',       zone: 'Asia/Colombo',          offsetHours:  5.5,  flag: '🇱🇰'),
  TzCity(name: 'Kathmandu',      country: 'Nepal',           zone: 'Asia/Kathmandu',        offsetHours:  5.75, flag: '🇳🇵'),
  TzCity(name: 'Tehran',         country: 'Iran',            zone: 'Asia/Tehran',           offsetHours:  3.5,  flag: '🇮🇷'),
];

// ── Providers ─────────────────────────────────────────────────────────────────

// autoDispose: the search box starts empty each time the screen opens, so a
// leftover query must not keep silently filtering the list.
final tzSearchProvider = StateProvider.autoDispose<String>((ref) => '');

final pinnedCitiesProvider = StateProvider<List<String>>((ref) {
  return ref.watch(storageServiceProvider).getPinnedCities();
});

final filteredCitiesProvider = Provider.autoDispose<List<TzCity>>((ref) {
  final q = ref.watch(tzSearchProvider).trim().toLowerCase();
  if (q.isEmpty) return _allCities;
  return _allCities
      .where((c) =>
          c.name.toLowerCase().contains(q) ||
          c.country.toLowerCase().contains(q))
      .toList();
});

/// Pinned names resolved to cities; names no longer in [_allCities] are
/// skipped (instead of all turning into a duplicate of the first city).
List<TzCity> _citiesNamed(List<String> names) => [
      for (final name in names)
        ..._allCities.where((c) => c.name == name).take(1),
    ];

final pinnedCityDataProvider = Provider<List<TzCity>>((ref) {
  return _citiesNamed(ref.watch(pinnedCitiesProvider));
});

// Clock refresh (every second). autoDispose so the 1 Hz timer stops when the
// World Clock screen is closed (only that screen watches it; the home-screen
// widget sync reads pinnedCitiesProvider, not this).
final clockTickProvider = StreamProvider.autoDispose<DateTime>((ref) {
  return Stream.periodic(const Duration(seconds: 1), (_) => DateTime.now());
});

// ── Actions ──────────────────────────────────────────────────────────────────

final timezoneActionsProvider = Provider<TimezoneActions>((ref) {
  return TimezoneActions(ref);
});

class TimezoneActions {
  TimezoneActions(this._ref);

  final Ref _ref;

  static const _widgetChannel = MethodChannel('utility_toolbox/widgets');

  /// Pushes whatever is currently pinned to the widget without changing
  /// anything — used once at app startup so a freshly-placed widget shows
  /// the default pins immediately, instead of staying empty until the user
  /// happens to toggle a pin for the first time.
  Future<void> syncWidgetWithCurrentPins() =>
      _pushToWidget(_ref.read(pinnedCitiesProvider));

  /// Pins/unpins [cityName], persists the change so it survives an app
  /// restart, and pushes the new list straight to the native World Clock
  /// home-screen widget so it updates immediately rather than on the
  /// device's next periodic widget refresh (which can be 30+ minutes away).
  Future<void> togglePinned(String cityName) async {
    final current = [..._ref.read(pinnedCitiesProvider)];
    if (current.contains(cityName)) {
      current.remove(cityName);
    } else {
      current.add(cityName);
    }

    _ref.read(pinnedCitiesProvider.notifier).state = current;
    await _ref.read(storageServiceProvider).setPinnedCities(current);
    await _pushToWidget(current);
  }

  Future<void> _pushToWidget(List<String> pinnedNames) async {
    final cities = _citiesNamed(pinnedNames);

    final payload = cities
        .map((c) => {'name': c.name, 'flag': c.flag, 'zone': c.zone})
        .toList();

    try {
      await _widgetChannel.invokeMethod('updateWorldClockWidget', {
        'citiesJson': jsonEncode(payload),
      });
    } catch (_) {
      // No widget placed, or running on a platform without the channel
      // (iOS, web) — nothing to do.
    }
  }
}
