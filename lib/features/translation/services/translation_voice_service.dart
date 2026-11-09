import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

/// Wraps on-device speech-to-text (voice input) and text-to-speech
/// (spoken playback + saved audio file) for the Translation tool.
///
/// Both engines are on-device / OS-provided — no network calls, matching
/// the "on-device AI" promise shown elsewhere in the app.
class TranslationVoiceService {
  final stt.SpeechToText _speech = stt.SpeechToText();
  final FlutterTts _tts = FlutterTts();

  bool _speechInitialized = false;

  // The underlying `SpeechToText` engine only accepts its onStatus/onError
  // listeners once, at `initialize()` time. To let each `startListening`
  // call supply its own callbacks (as if they were per-session), we store
  // the "current" callbacks here and have the one-time initialize wiring
  // simply forward into whichever callbacks are currently set.
  void Function(String status)? _onStatusCallback;
  void Function(String error)? _onErrorCallback;

  /// One-time engine bootstrap. Safe to call repeatedly.
  Future<bool> initSpeech() async {
    if (_speechInitialized) return true;
    _speechInitialized = await _speech.initialize(
      onError: (error) => _onErrorCallback?.call(error.errorMsg),
      onStatus: (status) => _onStatusCallback?.call(status),
    );
    return _speechInitialized;
  }

  bool get isListening => _speech.isListening;

  /// Finds the closest device locale ("ur-PK", "en-US", "es-ES"...) for a
  /// language code so speech recognition matches the language selected as
  /// the translation source. Never falls back to null (which would default to English).
  Future<String?> _localeIdFor(String isoCode) async {
    final cleanCode = isoCode.toLowerCase().trim();
    try {
      final locales = await _speech.locales();
      for (final l in locales) {
        final id = l.localeId.toLowerCase().replaceAll('_', '-');
        if (id.startsWith(cleanCode) || id.contains(cleanCode)) {
          return l.localeId;
        }
      }
    } catch (_) {}

    // Explicit locale fallbacks — ensures Urdu, Arabic, Hindi, etc.
    // request the correct speech model instead of falling back to device English.
    return switch (cleanCode) {
      'ur' => 'ur-PK',
      'ar' => 'ar-SA',
      'hi' => 'hi-IN',
      'es' => 'es-ES',
      'fr' => 'fr-FR',
      'de' => 'de-DE',
      'zh' => 'zh-CN',
      'ja' => 'ja-JP',
      'ru' => 'ru-RU',
      'pt' => 'pt-BR',
      'it' => 'it-IT',
      'tr' => 'tr-TR',
      'bn' => 'bn-BD',
      'fa' => 'fa-IR',
      'ko' => 'ko-KR',
      'en' => 'en-US',
      _ => '$cleanCode-$cleanCode',
    };
  }

  /// Starts listening and streams partial + final transcripts via
  /// [onResult]. The session is deliberately long-running (see
  /// `listenFor`/`pauseFor` below) so it keeps capturing speech through
  /// normal pauses instead of cutting off — it only ends when the caller
  /// invokes [stopListening]/[cancelListening], or (rarely) when the OS
  /// speech engine itself ends the session, which is reported via
  /// [onStatus] so the caller can react (close the mic, run translation).
  Future<void> startListening({
    required String isoCode,
    required void Function(String text, bool isFinal) onResult,
    void Function(String status)? onStatus,
    void Function(String error)? onError,
  }) async {
    final ok = await initSpeech();
    if (!ok) {
      onError?.call('Speech recognition is not available on this device.');
      return;
    }

    _onStatusCallback = onStatus;
    _onErrorCallback = onError;

    final localeId = await _localeIdFor(isoCode);

    await _speech.listen(
      onResult: (SpeechRecognitionResult result) {
        onResult(result.recognizedWords, result.finalResult);
      },
      listenOptions: stt.SpeechListenOptions(
        partialResults: true,
        cancelOnError: true,
        listenMode: stt.ListenMode.dictation,
        listenFor: const Duration(minutes: 5),
        pauseFor: const Duration(minutes: 5),
        localeId: localeId,
      ),
    );
  }

  Future<void> stopListening() => _speech.stop();
  Future<void> cancelListening() => _speech.cancel();

  // ── Text-to-speech ─────────────────────────────────────────────────────

  /// Speaks [text] aloud immediately (playback only, nothing saved).
  Future<void> speak(String text, String isoCode) async {
    await _setTtsLanguage(isoCode);
    await _tts.stop();
    await _tts.speak(text);
  }

  Future<void> stopSpeaking() => _tts.stop();

  /// Synthesizes [text] to a local audio file and returns its path, or
  /// null if on-device synthesis-to-file isn't supported on this platform.
  ///
  /// Different flutter_tts versions save the file to different default
  /// locations when no full-path parameter is available, so we check the
  /// common candidate directories after synthesis completes.
  Future<String?> synthesizeToFile(
    String text,
    String isoCode,
    String fileName,
  ) async {
    await _setTtsLanguage(isoCode);
    final wavName = '$fileName.wav';

    try {
      await _tts.awaitSynthCompletion(true);
      await _tts.synthesizeToFile(text, wavName);

      final candidateDirs = <Directory>[
        await getTemporaryDirectory(),
        await getApplicationDocumentsDirectory(),
      ];

      for (final dir in candidateDirs) {
        final file = File('${dir.path}/$wavName');
        if (await file.exists() && await file.length() > 0) {
          return file.path;
        }
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  Future<void> _setTtsLanguage(String isoCode) async {
    final cleanCode = isoCode.toLowerCase().trim();
    try {
      final dynamic languages = await _tts.getLanguages;
      if (languages is List) {
        final match = languages.cast<String>().firstWhere(
          (l) => l.toLowerCase().replaceAll('_', '-').startsWith(cleanCode),
          orElse: () => '',
        );
        if (match.isNotEmpty) {
          await _tts.setLanguage(match);
          return;
        }
      }
    } catch (_) {
      // Fall through to best-effort below.
    }
    final fallback = switch (cleanCode) {
      'ur' => 'ur-PK',
      'ar' => 'ar-SA',
      'hi' => 'hi-IN',
      'es' => 'es-ES',
      'fr' => 'fr-FR',
      'de' => 'de-DE',
      'zh' => 'zh-CN',
      'en' => 'en-US',
      _ => cleanCode,
    };
    try {
      await _tts.setLanguage(fallback);
    } catch (_) {}
  }

  void dispose() {
    _speech.cancel();
    _tts.stop();
  }
}

final translationVoiceServiceProvider = Provider<TranslationVoiceService>((
  ref,
) {
  final service = TranslationVoiceService();
  ref.onDispose(service.dispose);
  return service;
});
