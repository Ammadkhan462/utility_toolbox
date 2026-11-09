import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

class SpeedTestClientInfo {
  final String ip;
  final String isp;
  final String city;
  final String country;
  final String serverLocation;

  const SpeedTestClientInfo({
    required this.ip,
    required this.isp,
    required this.city,
    required this.country,
    required this.serverLocation,
  });
}

class WifiSpeedTestService {
  HttpClient? _activeClient;
  bool _cancelled = false;

  void cancel() {
    _cancelled = true;
    _activeClient?.close(force: true);
    _activeClient = null;
  }

  /// Fetches client IP, ISP, and location from CDN edge headers.
  Future<SpeedTestClientInfo> fetchClientInfo() async {
    final client = HttpClient()..connectionTimeout = const Duration(seconds: 5);
    try {
      final req = await client
          .getUrl(Uri.parse('https://speed.cloudflare.com/__down?bytes=0'))
          .timeout(const Duration(seconds: 4));
      final res = await req.close();
      await res.drain();

      final ip = res.headers.value('cf-meta-ip');
      final city = res.headers.value('city');
      final country = res.headers.value('country');
      final asn = res.headers.value('asn');

      if (ip != null && ip.isNotEmpty) {
        final loc = [
          if (city != null && city.isNotEmpty) city,
          if (country != null && country.isNotEmpty) country,
        ].join(', ');

        return SpeedTestClientInfo(
          ip: ip,
          isp: asn != null && asn.isNotEmpty ? 'AS$asn' : 'Broadband',
          city: city ?? '',
          country: country ?? '',
          serverLocation: loc.isNotEmpty ? 'Cloudflare Edge ($loc)' : 'Cloudflare Edge',
        );
      }
    } catch (_) {}

    try {
      final fastReq = await client
          .getUrl(Uri.parse(
              'https://api.fast.com/netflix/speedtest/v2?https=true&token=YXNkZmFzZGxmbnNkYWZoYXNkZmhrYWxm&urlCount=2'))
          .timeout(const Duration(seconds: 4));
      final fastRes = await fastReq.close();
      final body = await utf8.decodeStream(fastRes);
      final json = jsonDecode(body) as Map<String, dynamic>;
      final clientMap = json['client'] as Map<String, dynamic>?;
      if (clientMap != null) {
        final ip = clientMap['ip'] as String? ?? '--';
        final isp = clientMap['isp'] as String? ?? 'Internet';
        final locMap = clientMap['location'] as Map<String, dynamic>?;
        final city = locMap?['city'] as String? ?? '';
        final country = locMap?['country'] as String? ?? '';
        final loc = [if (city.isNotEmpty) city, if (country.isNotEmpty) country].join(', ');

        return SpeedTestClientInfo(
          ip: ip,
          isp: isp,
          city: city,
          country: country,
          serverLocation: loc.isNotEmpty ? '$isp ($loc)' : isp,
        );
      }
    } catch (_) {} finally {
      client.close();
    }

    return const SpeedTestClientInfo(
      ip: '--',
      isp: 'Internet',
      city: '',
      country: '',
      serverLocation: 'Edge Network Server',
    );
  }

  /// Runs streaming download test, invoking [onProgress] with live speed and normalized progress (0.0 to 1.0).
  /// Returns the final stable download Mbps.
  Future<double> runDownloadTest({
    required void Function(double liveMbps, double progress) onProgress,
  }) async {
    _cancelled = false;
    _activeClient = HttpClient()..connectionTimeout = const Duration(seconds: 6);

    const stepBytes = 5000000; // 5 MB per step
    const totalSteps = 6; // 30 MB total
    final totalExpectedBytes = stepBytes * totalSteps;

    int totalBytesReceived = 0;
    final speedSamples = <double>[];
    final testSw = Stopwatch()..start();

    try {
      for (int step = 1; step <= totalSteps; step++) {
        if (_cancelled) break;

        final stepSw = Stopwatch()..start();
        final uri = Uri.parse(
          'https://speed.cloudflare.com/__down?bytes=$stepBytes&_t=${DateTime.now().microsecondsSinceEpoch}_$step',
        );
        final req = await _activeClient!.getUrl(uri);
        final res = await req.close();

        int stepBytesReceived = 0;
        int lastProgressMs = 0;

        await for (final chunk in res) {
          if (_cancelled) break;
          chunk.length;
          totalBytesReceived += chunk.length;
          stepBytesReceived += chunk.length;

          final nowMs = stepSw.elapsedMilliseconds;
          if (nowMs - lastProgressMs >= 80) {
            lastProgressMs = nowMs;
            final sec = nowMs / 1000;
            if (sec > 0.05) {
              final liveSpeed = (stepBytesReceived * 8) / sec / 1000000;
              final progress = (totalBytesReceived / totalExpectedBytes).clamp(0.0, 1.0);
              onProgress(_round1(liveSpeed), progress);
            }
          }
        }

        stepSw.stop();
        final stepSec = stepSw.elapsedMilliseconds / 1000;
        if (stepSec > 0) {
          final stepSpeed = (stepBytes * 8) / stepSec / 1000000;
          // Collect samples after step 1 to ignore initial connection setup
          if (step > 1 && stepSpeed > 0.5) {
            speedSamples.add(stepSpeed);
          }
        }
      }
    } finally {
      testSw.stop();
      _activeClient?.close(force: true);
      _activeClient = null;
    }

    if (_cancelled) return 0.0;

    double finalSpeed;
    if (speedSamples.isNotEmpty) {
      speedSamples.sort();
      // 80th percentile for true stable bandwidth
      final idx = (speedSamples.length * 0.8).floor().clamp(0, speedSamples.length - 1);
      finalSpeed = speedSamples[idx];
    } else {
      final totalSec = testSw.elapsedMilliseconds / 1000;
      finalSpeed = totalSec > 0 ? (totalBytesReceived * 8) / totalSec / 1000000 : 0.0;
    }

    final rounded = _round1(finalSpeed);
    onProgress(rounded, 1.0);
    return rounded;
  }

  /// Runs streaming upload test, invoking [onProgress] with live speed and normalized progress (0.0 to 1.0).
  /// Returns the final stable upload Mbps.
  Future<double> runUploadTest({
    required void Function(double liveMbps, double progress) onProgress,
  }) async {
    _cancelled = false;
    _activeClient = HttpClient()..connectionTimeout = const Duration(seconds: 6);

    const stepBytes = 1500000; // 1.5 MB per step
    const totalSteps = 6;
    final chunk = Uint8List(stepBytes);

    int totalBytesUploaded = 0;
    final speedSamples = <double>[];
    final testSw = Stopwatch()..start();

    try {
      for (int step = 1; step <= totalSteps; step++) {
        if (_cancelled) break;

        final stepSw = Stopwatch()..start();
        final uri = Uri.parse(
          'https://speed.cloudflare.com/__up?_t=${DateTime.now().microsecondsSinceEpoch}_$step',
        );
        final req = await _activeClient!.postUrl(uri);
        req.contentLength = stepBytes;
        req.add(chunk);
        final res = await req.close();
        await res.drain();
        stepSw.stop();

        totalBytesUploaded += stepBytes;
        final stepSec = stepSw.elapsedMilliseconds / 1000;
        if (stepSec > 0) {
          final stepSpeed = (stepBytes * 8) / stepSec / 1000000;
          if (step > 1 && stepSpeed > 0.5) {
            speedSamples.add(stepSpeed);
          }
          final progress = (step / totalSteps).clamp(0.0, 1.0);
          onProgress(_round1(stepSpeed), progress);
        }
      }
    } finally {
      testSw.stop();
      _activeClient?.close(force: true);
      _activeClient = null;
    }

    if (_cancelled) return 0.0;

    double finalSpeed;
    if (speedSamples.isNotEmpty) {
      speedSamples.sort();
      final idx = (speedSamples.length * 0.75).floor().clamp(0, speedSamples.length - 1);
      finalSpeed = speedSamples[idx];
    } else {
      final totalSec = testSw.elapsedMilliseconds / 1000;
      finalSpeed = totalSec > 0 ? (totalBytesUploaded * 8) / totalSec / 1000000 : 0.0;
    }

    final rounded = _round1(finalSpeed);
    onProgress(rounded, 1.0);
    return rounded;
  }

  static double _round1(double v) => double.parse(v.toStringAsFixed(1));
}
