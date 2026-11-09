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

final ipInfoProvider = FutureProvider<IpInfo>((ref) async {
  final res = await http
      .get(Uri.parse('https://ipinfo.io/json'))
      .timeout(const Duration(seconds: 10));
  if (res.statusCode == 200) {
    return IpInfo.fromJson(jsonDecode(res.body) as Map<String, dynamic>);
  }
  throw Exception('Failed to fetch IP info');
});

// ── Lookup arbitrary IP/hostname ────────────────────────────────────────────

class LookupState {
  final bool isLoading;
  final IpInfo? info;
  final String? error;
  const LookupState({this.isLoading = false, this.info, this.error});
}

class LookupNotifier extends StateNotifier<LookupState> {
  LookupNotifier() : super(const LookupState());

  Future<void> lookup(String host) async {
    state = const LookupState(isLoading: true);
    try {
      // Resolve hostname to IP if needed
      String ip = host.trim();
      final isHostname = !RegExp(r'^\d{1,3}(\.\d{1,3}){3}$').hasMatch(ip);
      if (isHostname) {
        final addresses = await InternetAddress.lookup(ip)
            .timeout(const Duration(seconds: 5));
        ip = addresses.first.address;
      }
      final res = await http
          .get(Uri.parse('https://ipinfo.io/$ip/json'))
          .timeout(const Duration(seconds: 10));
      if (res.statusCode == 200) {
        state = LookupState(info: IpInfo.fromJson(
            jsonDecode(res.body) as Map<String, dynamic>));
      } else {
        state = const LookupState(error: 'No data for this address.');
      }
    } catch (e) {
      state = LookupState(error: 'Lookup failed: ${e.toString()}');
    }
  }

  void clear() => state = const LookupState();
}

final lookupProvider =
    StateNotifierProvider<LookupNotifier, LookupState>((ref) => LookupNotifier());

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

  const PingState({
    this.isRunning = false,
    this.results = const [],
    this.host = '',
    this.resolvedIp,
  });

  PingState copyWith({
    bool? isRunning,
    List<PingResult>? results,
    String? host,
    String? resolvedIp,
  }) =>
      PingState(
        isRunning:  isRunning  ?? this.isRunning,
        results:    results    ?? this.results,
        host:       host       ?? this.host,
        resolvedIp: resolvedIp ?? this.resolvedIp,
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
  StreamSubscription? _sub;

  Future<void> start(String host) async {
    await stop();
    state = PingState(host: host, isRunning: true);

    String? resolvedIp;
    try {
      final addrs = await InternetAddress.lookup(host)
          .timeout(const Duration(seconds: 5));
      resolvedIp = addrs.first.address;
    } catch (_) {}

    state = state.copyWith(resolvedIp: resolvedIp);

    // HTTP-based ping (ICMP not available in Flutter without root)
    var seq = 0;
    _sub = Stream.periodic(const Duration(milliseconds: 800)).listen((_) async {
      if (seq >= 20) {
        stop();
        return;
      }
      seq++;
      final sw = Stopwatch()..start();
      try {
        await http.head(Uri.parse('https://$host')).timeout(const Duration(seconds: 3));
        sw.stop();
        state = state.copyWith(
          results: [...state.results, PingResult(seq, sw.elapsedMilliseconds.toDouble())],
        );
      } catch (_) {
        state = state.copyWith(
          results: [...state.results, PingResult(seq, null)],
        );
      }
    });
  }

  Future<void> stop() async {
    await _sub?.cancel();
    _sub = null;
    if (state.isRunning) {
      state = state.copyWith(isRunning: false);
    }
  }

  void clear() => state = const PingState();

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }
}

final pingProvider =
    StateNotifierProvider<PingNotifier, PingState>((ref) => PingNotifier());
