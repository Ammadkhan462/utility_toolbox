import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:utility_toolbox/core/services/storage_service.dart';

/// Tracks successful jobs and asks for a Play rating at a good moment.
///
/// Rating volume and average are the biggest store-conversion factors after
/// the icon and screenshots, so the prompt is shown right after the user
/// got value — never on launch, never mid-task:
///  * only after the [promptAfterSuccesses]-th successful job,
///  * at most once every [minDaysBetweenPrompts] days
///    (Play also enforces its own quota and may silently show nothing).
class EngagementService {
  EngagementService(this._storage, {InAppReview? review})
    : _review = review ?? InAppReview.instance;

  final StorageService _storage;
  final InAppReview _review;

  static const promptAfterSuccesses = 3;
  static const minDaysBetweenPrompts = 120;

  /// Interstitials are held back until the user has finished this many
  /// jobs, so first impressions (and first ratings) aren't ad-led.
  static const adsAfterSuccesses = 2;

  int get successCount => _storage.getSuccessCount();

  bool get adsAllowedYet => successCount >= adsAfterSuccesses;

  Future<void> onSuccess() async {
    final count = await _storage.incrementSuccessCount();
    if (count < promptAfterSuccesses) return;

    final now = DateTime.now();
    final last = DateTime.fromMillisecondsSinceEpoch(
      _storage.getLastReviewPromptAt(),
    );
    if (now.difference(last).inDays < minDaysBetweenPrompts) return;

    try {
      if (await _review.isAvailable()) {
        await _storage.setLastReviewPromptAt(now.millisecondsSinceEpoch);
        await _review.requestReview();
      }
    } catch (e) {
      debugPrint('In-app review unavailable: $e');
    }
  }

  /// Settings → "Rate the app": always goes to the store page.
  Future<void> openStoreListing() => _review.openStoreListing();
}

final engagementServiceProvider = Provider<EngagementService>((ref) {
  return EngagementService(ref.watch(storageServiceProvider));
});
