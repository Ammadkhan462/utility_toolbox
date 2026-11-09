import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utility_toolbox/features/text_utilities/services/text_service.dart';

final textServiceProvider = Provider<TextService>((ref) => TextService());

final textInputProvider = StateProvider.autoDispose<String>((ref) => '');

final base64ModeProvider = StateProvider.autoDispose<bool>((ref) => false);

final base64OutputProvider = StateProvider.autoDispose<String>((ref) => '');

final base64ErrorProvider = StateProvider.autoDispose<String?>((ref) => null);

final wordCountProvider = Provider.autoDispose<int>((ref) {
  final text = ref.watch(textInputProvider);
  return ref.watch(textServiceProvider).wordCount(text);
});

final characterCountProvider = Provider.autoDispose<int>((ref) {
  final text = ref.watch(textInputProvider);
  return ref.watch(textServiceProvider).characterCount(text, includeSpaces: true);
});

final characterCountNoSpacesProvider = Provider.autoDispose<int>((ref) {
  final text = ref.watch(textInputProvider);
  return ref.watch(textServiceProvider).characterCount(text, includeSpaces: false);
});
