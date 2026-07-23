import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';
import 'package:utility_toolbox/core/constants/app_constants.dart';
import 'package:utility_toolbox/core/services/ads_service.dart';
import 'package:utility_toolbox/core/services/storage_service.dart';
import 'package:utility_toolbox/core/utils/result.dart';

final supportedLanguagesProvider = Provider<List<TranslateLanguage>>((ref) {
  return [
    TranslateLanguage.english,
    TranslateLanguage.spanish,
    TranslateLanguage.french,
    TranslateLanguage.german,
    TranslateLanguage.italian,
    TranslateLanguage.portuguese,
    TranslateLanguage.arabic,
    TranslateLanguage.hindi,
    TranslateLanguage.chinese,
    TranslateLanguage.japanese,
  ];
});

final sourceLanguageProvider =
    StateProvider<TranslateLanguage>((ref) => TranslateLanguage.english);

final targetLanguageProvider =
    StateProvider<TranslateLanguage>((ref) => TranslateLanguage.spanish);

final translationInputProvider = StateProvider<String>((ref) => '');

final translationResultProvider =
    StateProvider<Result<String>>((ref) => const Idle());

final modelDownloadStateProvider =
    StateProvider<Result<void>>((ref) => const Idle());

final translationActionsProvider = Provider<TranslationActions>((ref) {
  return TranslationActions(ref);
});

class TranslationActions {
  TranslationActions(this._ref);

  final Ref _ref;
  final _modelManager = OnDeviceTranslatorModelManager();

  Future<bool> ensureModelsDownloaded() async {
    final source = _ref.read(sourceLanguageProvider);
    final target = _ref.read(targetLanguageProvider);

    _ref.read(modelDownloadStateProvider.notifier).state = const Loading();

    try {
      final sourceReady =
          await _modelManager.isModelDownloaded(source.bcpCode);
      final targetReady =
          await _modelManager.isModelDownloaded(target.bcpCode);

      if (!sourceReady) {
        await _modelManager.downloadModel(source.bcpCode);
      }
      if (!targetReady) {
        await _modelManager.downloadModel(target.bcpCode);
      }

      _ref.read(modelDownloadStateProvider.notifier).state = const Success(null);
      return true;
    } catch (_) {
      _ref.read(modelDownloadStateProvider.notifier).state = const ErrorResult(
        'Could not download language models. Check your internet connection.',
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

    _ref.read(translationResultProvider.notifier).state = const Loading();

    final ready = await ensureModelsDownloaded();
    if (!ready) {
      _ref.read(translationResultProvider.notifier).state = const ErrorResult(
        'Language models are not available offline yet.',
      );
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
        'Translation failed. Try again.',
      );
    } finally {
      await translator.close();
    }
  }
}
