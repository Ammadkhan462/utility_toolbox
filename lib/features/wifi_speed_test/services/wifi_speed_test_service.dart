import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

class SpeedTestClientInfo {
  final String ip;
  final String isp;
  final String city;
  final String country;
  /// Server/ISP name and place (proper nouns only), or null if unknown.
  final String? serverLocation;

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
    _activeClient = client;
    try {
      try {
        final req = await client
            .getUrl(Uri.parse('https://speed.cloudflare.com/__down?bytes=0'))
            .timeout(const Duration(seconds: 4));
        final res = await req.close().timeout(const Duration(seconds: 5));
        await res.drain<void>().timeout(const Duration(seconds: 5));

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
            isp: asn != null && asn.isNotEmpty ? 'AS$asn' : '',
            city: city ?? '',
            country: country ?? '',
            // Proper nouns only: the screen wraps this in a localized phrase.
            serverLocation: loc.isNotEmpty ? 'Cloudflare ($loc)' : 'Cloudflare',
          );
        }
      } catch (_) {}

      if (_cancelled) throw const SocketException('cancelled');

      try {
        final fastReq = await client
            .getUrl(Uri.parse(
                'https://api.fast.com/netflix/speedtest/v2?https=true&token=YXNkZmFzZGxmbnNkYWZoYXNkZmhrYWxm&urlCount=2'))
            .timeout(const Duration(seconds: 4));
        final fastRes = await fastReq.close().timeout(const Duration(seconds: 5));
        final body =
            await utf8.decodeStream(fastRes).timeout(const Duration(seconds: 5));
        final json = jsonDecode(body) as Map<String, dynamic>;
        final clientMap = json['client'] as Map<String, dynamic>?;
        if (clientMap != null) {
          final ip = clientMap['ip'] as String? ?? '--';
          final isp = clientMap['isp'] as String? ?? '';
          final locMap = clientMap['location'] as Map<String, dynamic>?;
          final city = locMap?['city'] as String? ?? '';
          final country = locMap?['country'] as String? ?? '';
          final loc = [if (city.isNotEmpty) city, if (country.isNotEmpty) country].join(', ');

          return SpeedTestClientInfo(
            ip: ip,
            isp: isp,
            city: city,
            country: country,
            serverLocation: isp.isEmpty
                ? (loc.isEmpty ? null : loc)
                : (loc.isNotEmpty ? '$isp ($loc)' : isp),
          );
        }
      } catch (_) {}
    } finally {
      client.close(force: true);
      if (identical(_activeClient, client)) _activeClient = null;
    }

    return const SpeedTestClientInfo(
      ip: '--',
      isp: '',
      city: '',
      country: '',
      serverLocation: null,
    );
  }

  /// Round-trip latency to the test server in ms (median of a few TCP
  /// handshakes on port 443, like the IP & Ping tool), or null if the server
  /// could not be reached. Cheap: no payload is transferred.
  Future<double?> measureLatency({int samples = 5}) async {
    if (_cancelled) return null;
    InternetAddress address;
    try {
      final addrs = await InternetAddress.lookup('speed.cloudflare.com')
          .timeout(const Duration(seconds: 4));
      if (addrs.isEmpty) return null;
      address = addrs.first;
    } catch (_) {
      return null;
    }
    final results = <double>[];
    for (var i = 0; i < samples; i++) {
      if (_cancelled) return null;
      final sw = Stopwatch()..start();
      try {
        final socket = await Socket.connect(
          address,
          443,
          timeout: const Duration(seconds: 2),
        );
        sw.stop();
        socket.destroy();
        results.add(sw.elapsedMicroseconds / 1000);
      } catch (_) {}
    }
    if (results.isEmpty) return null;
    results.sort();
    return _round1(results[results.length ~/ 2]);
  }

  /// Runs streaming download test, invoking [onProgress] with live speed and normalized progress (0.0 to 1.0).
  /// Returns the final stable download Mbps.
  Future<double> runDownloadTest({
    required void Function(double liveMbps, double progress) onProgress,
  }) async {
    if (_cancelled) return 0.0;
    final client = HttpClient()..connectionTimeout = const Duration(seconds: 6);
    _activeClient = client;

    const stepBytes = 5000000; // 5 MB per step
    const totalSteps = 6; // 30 MB total
    final totalExpectedBytes = stepBytes * totalSteps;

    int totalBytesReceived = 0;
    final speedSamples = <double>[];
    final testSw = Stopwatch()..start();

    try {
      for (int step = 1; step <= totalSteps; step++) {
        if (_cancelled) break;
        // Slow links would need minutes for 30 MB; stop once enough data
        // has been sampled.
        if (step > 1 && testSw.elapsed >= _phaseBudget) break;

        final stepSw = Stopwatch()..start();
        final uri = Uri.parse(
          'https://speed.cloudflare.com/__down?bytes=$stepBytes&_t=${DateTime.now().microsecondsSinceEpoch}_$step',
        );
        final req = await client.getUrl(uri).timeout(_requestTimeout);
        final res = await req.close().timeout(_requestTimeout);
        if (res.statusCode != HttpStatus.ok) {
          await res.drain<void>().catchError((_) {});
          throw HttpException('Download failed (HTTP ${res.statusCode})');
        }

        int stepBytesReceived = 0;
        int lastProgressMs = 0;

        await for (final chunk in res.timeout(_stallTimeout)) {
          if (_cancelled) break;
          totalBytesReceived += chunk.length;
          stepBytesReceived += chunk.length;

          final nowMs = stepSw.elapsedMilliseconds;
          if (nowMs - lastProgressMs >= 80) {
            lastProgressMs = nowMs;
            final sec = nowMs / 1000;
            if (sec > 0.05) {
              final liveSpeed = (stepBytesReceived * 8) / sec / 1000000;
              onProgress(
                _round1(liveSpeed),
                _progress(totalBytesReceived / totalExpectedBytes, testSw),
              );
            }
          }
          if (testSw.elapsed >= _phaseBudget) break;
        }

        stepSw.stop();
        final stepSec = stepSw.elapsedMilliseconds / 1000;
        if (stepSec > 0 && stepBytesReceived > 0) {
          // Use the bytes actually received (a step may end early).
          final stepSpeed = (stepBytesReceived * 8) / stepSec / 1000000;
          // Collect samples after step 1 to ignore initial connection setup
          if (step > 1 && stepSpeed > 0.5) {
            speedSamples.add(stepSpeed);
          }
        }
      }
    } finally {
      testSw.stop();
      client.close(force: true);
      if (identical(_activeClient, client)) _activeClient = null;
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
    if (_cancelled) return 0.0;
    final client = HttpClient()..connectionTimeout = const Duration(seconds: 6);
    _activeClient = client;

    const stepBytes = 1500000; // 1.5 MB per step
    const totalSteps = 6;
    final chunk = Uint8List(stepBytes);

    int totalBytesUploaded = 0;
    final speedSamples = <double>[];
    final testSw = Stopwatch()..start();

    try {
      for (int step = 1; step <= totalSteps; step++) {
        if (_cancelled) break;
        if (step > 1 && testSw.elapsed >= _phaseBudget) break;

        final stepSw = Stopwatch()..start();
        final uri = Uri.parse(
          'https://speed.cloudflare.com/__up?_t=${DateTime.now().microsecondsSinceEpoch}_$step',
        );
        final req = await client.postUrl(uri).timeout(_requestTimeout);
        req.contentLength = stepBytes;
        req.add(chunk);
        final res = await req.close().timeout(_uploadStepTimeout);
        await res.drain<void>().timeout(_requestTimeout);
        stepSw.stop();
        if (res.statusCode < 200 || res.statusCode >= 300) {
          throw HttpException('Upload failed (HTTP ${res.statusCode})');
        }

        totalBytesUploaded += stepBytes;
        final stepSec = stepSw.elapsedMilliseconds / 1000;
        if (stepSec > 0) {
          final stepSpeed = (stepBytes * 8) / stepSec / 1000000;
          if (step > 1 && stepSpeed > 0.5) {
            speedSamples.add(stepSpeed);
          }
          onProgress(_round1(stepSpeed), _progress(step / totalSteps, testSw));
        }
      }
    } finally {
      testSw.stop();
      client.close(force: true);
      if (identical(_activeClient, client)) _activeClient = null;
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

  /// Max time spent sampling each phase (download / upload).
  static const _phaseBudget = Duration(seconds: 12);
  static const _requestTimeout = Duration(seconds: 10);
  static const _uploadStepTimeout = Duration(seconds: 30);

  /// No data for this long during a download means the link stalled.
  static const _stallTimeout = Duration(seconds: 10);

  static double _progress(double byteFraction, Stopwatch sw) {
    final timeFraction =
        sw.elapsedMilliseconds / _phaseBudget.inMilliseconds;
    return (byteFraction > timeFraction ? byteFraction : timeFraction)
        .clamp(0.0, 1.0);
  }

  static double _round1(double v) => double.parse(v.toStringAsFixed(1));
}
