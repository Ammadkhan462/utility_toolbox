import 'dart:async';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// ── IP Info ────────────────────────────────────────────────────────────────

class IpInfo {
  final String ip;
  final String city;
  final String region;
  final String country;
  final String org;
  final String timezone;
  final String loc; // "lat,lng"

  const IpInfo({
    required this.ip,
    required this.city,
    required this.region,
    required this.country,
    required this.org,
    required this.timezone,
    required this.loc,
  });

  factory IpInfo.fromJson(Map<String, dynamic> j) => IpInfo(
        ip:       j['ip']       ?? '',
        city:     j['city']     ?? '',
        region:   j['region']   ?? '',
        country:  j['country']  ?? '',
        org:      j['org']      ?? '',
        timezone: j['timezone'] ?? '',
        loc:      j['loc']      ?? '',
      );
}

/// Accepts what users actually type ("https://site.com/path", "site.com:8080")
/// and returns just the host part.
String normalizeHost(String input) {
  var h = input.trim();
  final scheme = h.indexOf('://');
  if (scheme >= 0) h = h.substring(scheme + 3);
  final slash = h.indexOf(RegExp(r'[/?#]'));
  if (slash >= 0) h = h.substring(0, slash);
  if (h.startsWith('[') && h.contains(']')) {
    return h.substring(1, h.indexOf(']')); // [IPv6]:port
  }
  // Strip ":port", but leave bare IPv6 literals (several colons) alone.
  if (':'.allMatches(h).length == 1) h = h.substring(0, h.indexOf(':'));
  return h;
}

// autoDispose so a failed load (e.g. offline) is retried on the next visit
// instead of being cached for the whole app session.
final ipInfoProvider = FutureProvider.autoDispose<IpInfo>((ref) async {
  final res = await http
      .get(Uri.parse('https://ipinfo.io/json'))
      .timeout(const Duration(seconds: 10));
  if (res.statusCode == 200) {
    return IpInfo.fromJson(jsonDecode(res.body) as Map<String, dynamic>);
  }
  throw NetError.generic;
});

/// Why a network call failed; the screen maps it to a localized message.
enum NetError { offline, timeout, hostNotFound, noData, generic }

/// Classifies an exception from [ipInfoProvider] or a lookup.
NetError netErrorOf(Object e) {
  if (e is NetError) return e;
  if (e is TimeoutException) return NetError.timeout;
  if (e is SocketException || e is http.ClientException) {
    return NetError.offline;
  }
  return NetError.generic;
}

// ── Lookup arbitrary IP/hostname ────────────────────────────────────────────

class LookupState {
  final bool isLoading;
  final IpInfo? info;
  final NetError? error;
  const LookupState({this.isLoading = false, this.info, this.error});
}

class LookupNotifier extends StateNotifier<LookupState> {
  LookupNotifier() : super(const LookupState());

  int _requestId = 0;

  Future<void> lookup(String host) async {
    final target = normalizeHost(host);
    if (target.isEmpty) return;
    final id = ++_requestId;
    state = const LookupState(isLoading: true);
    try {
      // Resolve hostname to IP if needed
      String ip = target;
      if (InternetAddress.tryParse(ip) == null) {
        final List<InternetAddress> addresses;
        try {
          addresses = await InternetAddress.lookup(ip)
              .timeout(const Duration(seconds: 5));
        } on SocketException {
          throw NetError.hostNotFound; // typo, or no DNS while offline
        }
        if (addresses.isEmpty) throw NetError.hostNotFound;
        ip = addresses.first.address;
      }
      final res = await http
          .get(Uri.parse('https://ipinfo.io/$ip/json'))
          .timeout(const Duration(seconds: 10));
      // A newer lookup was started, or the screen was closed.
      if (!mounted || id != _requestId) return;
      if (res.statusCode == 200) {
        state = LookupState(info: IpInfo.fromJson(
            jsonDecode(res.body) as Map<String, dynamic>));
      } else {
        state = const LookupState(error: NetError.noData);
      }
    } catch (e) {
      if (!mounted || id != _requestId) return;
      state = LookupState(error: netErrorOf(e));
    }
  }

  void clear() {
    _requestId++;
    state = const LookupState();
  }
}

final lookupProvider = StateNotifierProvider.autoDispose<LookupNotifier, LookupState>(
    (ref) => LookupNotifier());

// ── Ping ────────────────────────────────────────────────────────────────────

class PingResult {
  final int seq;
  final double? ms; // null = timeout
  PingResult(this.seq, this.ms);
}

class PingState {
  final bool isRunning;
  final List<PingResult> results;
  final String host;
  final String? resolvedIp;
  /// DNS lookup failed (typo, or offline), so nothing was pinged.
  final bool hostNotFound;

  const PingState({
    this.isRunning = false,
    this.results = const [],
    this.host = '',
    this.resolvedIp,
    this.hostNotFound = false,
  });

  PingState copyWith({
    bool? isRunning,
    List<PingResult>? results,
    String? host,
    String? resolvedIp,
    bool? hostNotFound,
  }) =>
      PingState(
        isRunning:    isRunning    ?? this.isRunning,
        results:      results      ?? this.results,
        host:         host         ?? this.host,
        resolvedIp:   resolvedIp   ?? this.resolvedIp,
        hostNotFound: hostNotFound ?? this.hostNotFound,
      );

  double get avgMs {
    final valid = results.where((r) => r.ms != null).map((r) => r.ms!).toList();
    if (valid.isEmpty) return 0;
    return valid.reduce((a, b) => a + b) / valid.length;
  }

  int get packetLoss {
    if (results.isEmpty) return 0;
    final lost = results.where((r) => r.ms == null).length;
    return ((lost / results.length) * 100).round();
  }
}

class PingNotifier extends StateNotifier<PingState> {
  PingNotifier() : super(const PingState());

  static const _count = 20;
  static const _interval = Duration(milliseconds: 800);
  static const _timeout = Duration(seconds: 3);

  /// Bumped on every start/stop so an in-flight ping loop knows it is stale.
  int _runId = 0;

  Future<void> start(String input) async {
    final host = normalizeHost(input);
    if (host.isEmpty) return;
    final runId = ++_runId;
    state = PingState(host: host, isRunning: true);
    bool stale() => !mounted || runId != _runId;

    InternetAddress? address = InternetAddress.tryParse(host);
    if (address == null) {
      try {
        final addrs = await InternetAddress.lookup(host).timeout(_timeout);
        if (addrs.isNotEmpty) address = addrs.first;
      } catch (_) {}
    }
    if (stale()) return;

    if (address == null) {
      // DNS failed (offline / typo): say so instead of pretending to ping
      // 20 times.
      state = state.copyWith(isRunning: false, hostNotFound: true);
      return;
    }
    state = state.copyWith(resolvedIp: address.address);

    // TCP-connect "ping" on port 443 (ICMP needs root). The TCP handshake
    // takes one round trip, so this is much closer to real ping than timing
    // a full HTTPS request. Pings run one after another so they never overlap.
    for (var seq = 1; seq <= _count; seq++) {
      final sw = Stopwatch()..start();
      double? ms;
      try {
        final socket = await Socket.connect(address, 443, timeout: _timeout);
        sw.stop();
        socket.destroy();
        ms = sw.elapsedMicroseconds / 1000;
      } catch (_) {
        ms = null;
      }
      if (stale()) return;
      state = state.copyWith(results: [...state.results, PingResult(seq, ms)]);

      if (seq < _count) {
        final wait = _interval - sw.elapsed;
        if (wait > Duration.zero) await Future<void>.delayed(wait);
        if (stale()) return;
      }
    }
    state = state.copyWith(isRunning: false);
  }

  Future<void> stop() async {
    _runId++;
    if (state.isRunning) {
      state = state.copyWith(isRunning: false);
    }
  }

  void clear() {
    _runId++;
    state = const PingState();
  }

  @override
  void dispose() {
    _runId++;
    super.dispose();
  }
}

// autoDispose: leaving the screen stops the ping loop.
final pingProvider = StateNotifierProvider.autoDispose<PingNotifier, PingState>(
    (ref) => PingNotifier());
