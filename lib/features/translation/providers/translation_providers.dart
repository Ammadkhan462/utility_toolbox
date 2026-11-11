import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';
import 'package:share_plus/share_plus.dart';
import 'package:utility_toolbox/core/constants/app_constants.dart';
import 'package:utility_toolbox/core/services/ads_service.dart';
import 'package:utility_toolbox/core/services/permission_service.dart';
import 'package:utility_toolbox/core/services/storage_service.dart';
import 'package:utility_toolbox/core/utils/result.dart';
import 'package:utility_toolbox/features/translation/services/translation_voice_service.dart';

/// Every language the on-device ML Kit translation model ships with (59 in
/// total, including Urdu) — sourced directly from `TranslateLanguage.values`
/// rather than a hand-picked subset, so the list stays complete even if the
/// package adds more later. Sorted alphabetically by display name so a list
/// this long is easy to scan in the dropdown.
final supportedLanguagesProvider = Provider<List<TranslateLanguage>>((ref) {
  final all = TranslateLanguage.values.toList();
  all.sort(
    (a, b) => translateLanguageDisplayName(a)
        .compareTo(translateLanguageDisplayName(b)),
  );
  return all;
});

/// English display name for a [TranslateLanguage]. The screen shows the
/// localized name (`translateLanguageName(bcpCode)`) and re-sorts by it;
/// this English name only orders the provider's list.
String translateLanguageDisplayName(TranslateLanguage lang) {
  return switch (lang) {
    TranslateLanguage.afrikaans   => 'Afrikaans',
    TranslateLanguage.albanian    => 'Albanian',
    TranslateLanguage.arabic      => 'Arabic',
    TranslateLanguage.belarusian  => 'Belarusian',
    TranslateLanguage.bengali     => 'Bengali',
    TranslateLanguage.bulgarian   => 'Bulgarian',
    TranslateLanguage.catalan     => 'Catalan',
    TranslateLanguage.chinese     => 'Chinese (Simplified)',
    TranslateLanguage.croatian    => 'Croatian',
    TranslateLanguage.czech       => 'Czech',
    TranslateLanguage.danish      => 'Danish',
    TranslateLanguage.dutch       => 'Dutch',
    TranslateLanguage.english     => 'English',
    TranslateLanguage.esperanto   => 'Esperanto',
    TranslateLanguage.estonian    => 'Estonian',
    TranslateLanguage.finnish     => 'Finnish',
    TranslateLanguage.french      => 'French',
    TranslateLanguage.galician    => 'Galician',
    TranslateLanguage.georgian    => 'Georgian',
    TranslateLanguage.german      => 'German',
    TranslateLanguage.greek       => 'Greek',
    TranslateLanguage.gujarati    => 'Gujarati',
    TranslateLanguage.haitian     => 'Haitian Creole',
    TranslateLanguage.hebrew      => 'Hebrew',
    TranslateLanguage.hindi       => 'Hindi',
    TranslateLanguage.hungarian   => 'Hungarian',
    TranslateLanguage.icelandic   => 'Icelandic',
    TranslateLanguage.indonesian  => 'Indonesian',
    TranslateLanguage.irish       => 'Irish',
    TranslateLanguage.italian     => 'Italian',
    TranslateLanguage.japanese    => 'Japanese',
    TranslateLanguage.kannada     => 'Kannada',
    TranslateLanguage.korean      => 'Korean',
    TranslateLanguage.latvian     => 'Latvian',
    TranslateLanguage.lithuanian  => 'Lithuanian',
    TranslateLanguage.macedonian  => 'Macedonian',
    TranslateLanguage.malay       => 'Malay',
    TranslateLanguage.maltese     => 'Maltese',
    TranslateLanguage.marathi     => 'Marathi',
    TranslateLanguage.norwegian   => 'Norwegian',
    TranslateLanguage.persian     => 'Persian (Farsi)',
    TranslateLanguage.polish      => 'Polish',
    TranslateLanguage.portuguese  => 'Portuguese',
    TranslateLanguage.romanian    => 'Romanian',
    TranslateLanguage.russian     => 'Russian',
    TranslateLanguage.slovak      => 'Slovak',
    TranslateLanguage.slovenian   => 'Slovenian',
    TranslateLanguage.spanish     => 'Spanish',
    TranslateLanguage.swahili     => 'Swahili',
    TranslateLanguage.swedish     => 'Swedish',
    TranslateLanguage.tagalog     => 'Tagalog (Filipino)',
    TranslateLanguage.tamil       => 'Tamil',
    TranslateLanguage.telugu      => 'Telugu',
    TranslateLanguage.thai        => 'Thai',
    TranslateLanguage.turkish     => 'Turkish',
    TranslateLanguage.ukrainian   => 'Ukrainian',
    TranslateLanguage.urdu        => 'Urdu',
    TranslateLanguage.vietnamese  => 'Vietnamese',
    TranslateLanguage.welsh       => 'Welsh',
  };
}


final sourceLanguageProvider =
    StateProvider<TranslateLanguage>((ref) => TranslateLanguage.english);

final targetLanguageProvider =
    StateProvider<TranslateLanguage>((ref) => TranslateLanguage.spanish);

final translationInputProvider = StateProvider<String>((ref) => '');

final translationResultProvider =
    StateProvider<Result<String>>((ref) => const Idle());

final modelDownloadStateProvider =
    StateProvider<Result<void>>((ref) => const Idle());

// ── Voice input (speech → text) ───────────────────────────────────────────

/// True while the mic is actively listening.
final isListeningProvider = StateProvider<bool>((ref) => false);

/// Set when speech recognition can't start (no mic permission, unsupported
/// device, etc). Holds a [TranslateErrorCode] or a speech-engine `error_*`
/// code, which the screen localizes. Cleared on the next successful listen.
final voiceInputErrorProvider = StateProvider<String?>((ref) => null);

// ── Voice output (text → speech) ──────────────────────────────────────────

/// True while the translation is being read aloud.
final isSpeakingProvider = StateProvider<bool>((ref) => false);

/// Local file path of the most recently generated translation audio clip.
final generatedAudioProvider = StateProvider<Result<String>>((ref) => const Idle());

final translationActionsProvider = Provider<TranslationActions>((ref) {
  return TranslationActions(ref);
});

class TranslationActions {
  TranslationActions(this._ref);

  final Ref _ref;
  final _modelManager = OnDeviceTranslatorModelManager();

  // Guards against the "stop" flow running twice for a single listening
  // session — both an explicit stopVoiceInput() call and the engine's own
  // onStatus callback ('done'/'notListening') can report the same stop.
  bool _stopHandled = true;

  // ── Voice input ───────────────────────────────────────────────────────

  /// Starts listening in the currently selected source language and
  /// streams live transcript text straight into [translationInputProvider].
  ///
  /// The mic stays open and keeps capturing speech — through normal
  /// pauses — until the user explicitly taps the mic again (or the OS
  /// ends the session on its own). Either way, stopping the mic
  /// automatically closes the audio session and, if there's something to
  /// translate, immediately starts translation.
  Future<void> startVoiceInput() async {
    final permission =
        await _ref.read(permissionServiceProvider).requestMicrophone();
    if (permission != PermissionOutcome.granted) {
      _ref.read(voiceInputErrorProvider.notifier).state =
          permission == PermissionOutcome.permanentlyDenied
              ? TranslateErrorCode.micBlocked
              : TranslateErrorCode.micNeeded;
      return;
    }

    _ref.read(voiceInputErrorProvider.notifier).state = null;
    final source = _ref.read(sourceLanguageProvider);
    final voice = _ref.read(translationVoiceServiceProvider);

    _stopHandled = false;
    _ref.read(isListeningProvider.notifier).state = true;

    try {
      await _startListening(voice, source);
    } catch (_) {
      // initialize()/listen() throw PlatformException / ListenFailedException
      // on devices with no recognizer or a busy mic — don't leave the mic
      // stuck in "listening".
      _handleListeningStopped(autoTranslate: false);
      _ref.read(voiceInputErrorProvider.notifier).state =
          TranslateErrorCode.speechUnavailable;
    }
  }

  Future<void> _startListening(
    TranslationVoiceService voice,
    TranslateLanguage source,
  ) async {
    await voice.startListening(
      isoCode: source.bcpCode,
      onResult: (text, isFinal) {
        // Stream every partial AND final transcript straight into the
        // input field. We deliberately do NOT stop listening here just
        // because a "final" chunk came in — with continuous dictation the
        // engine can emit several final segments during one long session
        // (e.g. after each sentence-ending pause), and stopping on the
        // first one is exactly what made the mic look like it "turned
        // itself off". Only an explicit stop (user tap) or the engine's
        // own status callback ends the session.
        _ref.read(translationInputProvider.notifier).state = text;
      },
      onStatus: (status) {
        if (status == 'done' || status == 'notListening') {
          _handleListeningStopped();
        }
      },
      onError: (error) {
        _handleListeningStopped(autoTranslate: false);
        _ref.read(voiceInputErrorProvider.notifier).state = error;
      },
    );
  }

  /// User-initiated stop: ends the recording, closes the mic/audio
  /// session, and — if there's captured text — automatically runs
  /// translation for the currently selected languages.
  Future<void> stopVoiceInput() async {
    await _ref.read(translationVoiceServiceProvider).stopListening();
    _handleListeningStopped();
  }

  /// Ends the recording and discards it without translating.
  Future<void> cancelVoiceInput() async {
    await _ref.read(translationVoiceServiceProvider).cancelListening();
    _handleListeningStopped(autoTranslate: false);
  }

  void _handleListeningStopped({bool autoTranslate = true}) {
    if (_stopHandled) return;
    _stopHandled = true;

    if (_ref.read(isListeningProvider)) {
      _ref.read(isListeningProvider.notifier).state = false;
    }

    if (!autoTranslate) return;

    final input = _ref.read(translationInputProvider).trim();
    final source = _ref.read(sourceLanguageProvider);
    final target = _ref.read(targetLanguageProvider);
    if (input.isNotEmpty && source.bcpCode != target.bcpCode) {
      translate();
    }
  }

  /// Handles a tap on the main "Translate" button. If the mic is still
  /// listening, closes it first (which itself triggers translation once
  /// the audio session has ended) instead of translating over a live
  /// recording.
  Future<void> translateTapped() async {
    if (_ref.read(isListeningProvider)) {
      await stopVoiceInput();
      return;
    }
    await translate();
  }

  // ── Voice output ──────────────────────────────────────────────────────

  /// Reads the current translation result aloud in the target language.
  Future<void> speakTranslation() async {
    final result = _ref.read(translationResultProvider);
    if (result is! Success<String>) return;

    final target = _ref.read(targetLanguageProvider);
    final voice = _ref.read(translationVoiceServiceProvider);

    _ref.read(isSpeakingProvider.notifier).state = true;
    try {
      await voice.speak(result.data, target.bcpCode);
    } catch (_) {
      // No TTS engine / voice — just reset the button below.
    } finally {
      _ref.read(isSpeakingProvider.notifier).state = false;
    }
  }

  Future<void> stopSpeaking() async {
    await _ref.read(translationVoiceServiceProvider).stopSpeaking();
    _ref.read(isSpeakingProvider.notifier).state = false;
  }

  /// Synthesizes the current translation to an audio file so it can be
  /// shared or saved, separate from the immediate "Play" preview.
  Future<void> generateTranslationAudio() async {
    final result = _ref.read(translationResultProvider);
    if (result is! Success<String>) return;

    final target = _ref.read(targetLanguageProvider);
    final voice = _ref.read(translationVoiceServiceProvider);

    _ref.read(generatedAudioProvider.notifier).state = const Loading();

    final path = await voice.synthesizeToFile(
      result.data,
      target.bcpCode,
      'translation_${DateTime.now().millisecondsSinceEpoch}',
    );

    if (path == null) {
      _ref.read(generatedAudioProvider.notifier).state = const ErrorResult(
        TranslateErrorCode.audioFailed,
      );
      return;
    }

    _ref.read(generatedAudioProvider.notifier).state = Success(path);
  }

  Future<void> shareGeneratedAudio() async {
    final result = _ref.read(generatedAudioProvider);
    if (result is! Success<String>) return;
    await Share.shareXFiles([XFile(result.data)]);
  }

  void resetGeneratedAudio() {
    _ref.read(generatedAudioProvider.notifier).state = const Idle();
  }

  Future<bool> ensureModelsDownloaded() async {
    final source = _ref.read(sourceLanguageProvider);
    final target = _ref.read(targetLanguageProvider);

    try {
      final sourceReady =
          await _modelManager.isModelDownloaded(source.bcpCode);
      final targetReady =
          await _modelManager.isModelDownloaded(target.bcpCode);

      // Only show "Downloading…" when something actually has to download,
      // so already-installed models don't flash a progress card.
      if (!sourceReady || !targetReady) {
        _ref.read(modelDownloadStateProvider.notifier).state = const Loading();
      }

      // isWifiRequired defaults to true in ML Kit: on mobile data the
      // download would wait for Wi-Fi forever and the spinner never ends.
      // downloadModel also reports failure via `false`, not only by throwing.
      if (!sourceReady &&
          !await _modelManager.downloadModel(
            source.bcpCode,
            isWifiRequired: false,
          )) {
        throw StateError('download failed');
      }
      if (!targetReady &&
          !await _modelManager.downloadModel(
            target.bcpCode,
            isWifiRequired: false,
          )) {
        throw StateError('download failed');
      }

      _ref.read(modelDownloadStateProvider.notifier).state = const Success(null);
      return true;
    } catch (_) {
      _ref.read(modelDownloadStateProvider.notifier).state = const ErrorResult(
        TranslateErrorCode.downloadFailed,
      );
      return false;
    }
  }

  Future<void> translate() async {
    final input = _ref.read(translationInputProvider).trim();
    if (input.isEmpty) return;

    final source = _ref.read(sourceLanguageProvider);
    final target = _ref.read(targetLanguageProvider);
    if (source.bcpCode == target.bcpCode) return;

    resetGeneratedAudio();
    _ref.read(translationResultProvider.notifier).state = const Loading();

    final ready = await ensureModelsDownloaded();
    if (!ready) {
      // The download error card (with its own Retry) already explains this;
      // a second error card underneath would just repeat it.
      _ref.read(translationResultProvider.notifier).state = const Idle();
      return;
    }

    final translator = OnDeviceTranslator(
      sourceLanguage: source,
      targetLanguage: target,
    );

    try {
      final translated = await translator.translateText(input);
      _ref.read(translationResultProvider.notifier).state = Success(translated);

      final storage = _ref.read(storageServiceProvider);
      await storage.incrementTranslationCount();
      final count = storage.getTranslationCount();
      if (count >= AppConstants.translationsBeforeInterstitial) {
        await storage.resetTranslationCount();
        await _ref.read(adsServiceProvider).showInterstitialIfAllowed();
      }
    } catch (_) {
      _ref.read(translationResultProvider.notifier).state = const ErrorResult(
        TranslateErrorCode.translateFailed,
      );
    } finally {
      await translator.close();
    }
  }
}
