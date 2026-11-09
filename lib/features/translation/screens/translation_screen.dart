import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';
import 'package:share_plus/share_plus.dart';
import 'package:utility_toolbox/core/utils/result.dart';
import 'package:utility_toolbox/core/widgets/error_state.dart';
import 'package:utility_toolbox/core/widgets/feature_badge.dart';
import 'package:utility_toolbox/core/widgets/glass_card.dart';
import 'package:utility_toolbox/core/widgets/gradient_icon_badge.dart';
import 'package:utility_toolbox/core/widgets/loading_indicator.dart';
import 'package:utility_toolbox/core/theme/app_colors.dart';
import 'package:utility_toolbox/core/widgets/premium_button.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/features/translation/providers/translation_providers.dart';

class TranslationScreen extends ConsumerStatefulWidget {
  const TranslationScreen({super.key});

  @override
  ConsumerState<TranslationScreen> createState() => _TranslationScreenState();
}

class _TranslationScreenState extends ConsumerState<TranslationScreen> {
  // FIX: the input TextField previously had no controller at all, so it
  // silently managed its own internal (empty) text buffer — voice results
  // were written into `translationInputProvider` correctly, but nothing
  // ever pushed that text back into the visible field. Translate() still
  // worked because it reads the provider directly, which is why only the
  // *translation* ever appeared, never the transcribed speech. A
  // controller kept here and synced to the provider fixes that.
  late final TextEditingController _inputCtrl;

  @override
  void initState() {
    super.initState();
    _inputCtrl = TextEditingController(
      text: ref.read(translationInputProvider),
    );
  }

  @override
  void dispose() {
    _inputCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final languages = ref.watch(supportedLanguagesProvider);
    final source = ref.watch(sourceLanguageProvider);
    final target = ref.watch(targetLanguageProvider);
    final input = ref.watch(translationInputProvider);
    final resultState = ref.watch(translationResultProvider);
    final downloadState = ref.watch(modelDownloadStateProvider);
    final actions = ref.watch(translationActionsProvider);
    final isListening = ref.watch(isListeningProvider);
    final voiceError = ref.watch(voiceInputErrorProvider);
    final isSpeaking = ref.watch(isSpeakingProvider);
    final audioState = ref.watch(generatedAudioProvider);
    final sameLanguage = source.bcpCode == target.bcpCode;
    final theme = Theme.of(context);
    final accent = AppColors.toolAccent('translation');
    final gradient = AppColors.toolGradient('translation');

    // Keep the visible field in sync with the provider (voice results,
    // the clear button, etc). Only touch the controller when the text
    // actually differs from what's already shown, so the user's own
    // typing — which already updates the controller directly — never
    // gets its cursor position reset mid-keystroke.
    if (_inputCtrl.text != input) {
      _inputCtrl.value = TextEditingValue(
        text: input,
        selection: TextSelection.collapsed(offset: input.length),
      );
    }

    return ToolScaffold(
      title: 'Translation',
      accentColor: accent,
      // Let the scaffold shrink for the keyboard — content is scrollable
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        // KEY FIX: padding adapts to keyboard height so nothing is hidden
        padding: EdgeInsets.fromLTRB(
          16,
          12,
          16,
          MediaQuery.viewInsetsOf(context).bottom + 16,
        ),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ── Hero header ────────────────────────────────────────
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GradientIconBadge(
                  icon: Icons.translate_rounded,
                  gradient: gradient,
                  size: 46,
                  iconSize: 22,
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Speak or type to translate',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          FeatureBadge(
                            icon: Icons.offline_bolt_rounded,
                            label: 'On-device AI',
                            accent: accent,
                          ),
                          FeatureBadge(
                            icon: Icons.lock_outline_rounded,
                            label: 'Works offline',
                            accent: accent,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),

            // ── Language selector card ───────────────────────────────
            GlassCard(
              accentColor: accent,
              padding: const EdgeInsets.fromLTRB(14, 14, 14, 6),
              child: Row(
                children: [
                  Expanded(
                    child: _LanguageDropdown(
                      label: 'From',
                      value: source,
                      languages: languages,
                      onChanged: (lang) =>
                          ref.read(sourceLanguageProvider.notifier).state =
                              lang,
                    ),
                  ),
                  const SizedBox(width: 4),
                  // Swap button
                  InkWell(
                    onTap: () {
                      ref.read(sourceLanguageProvider.notifier).state = target;
                      ref.read(targetLanguageProvider.notifier).state = source;
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: const EdgeInsets.all(9),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: gradient,
                        boxShadow: [
                          BoxShadow(
                            color: accent.withValues(alpha: 0.35),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.swap_horiz_rounded,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: _LanguageDropdown(
                      label: 'To',
                      value: target,
                      languages: languages,
                      onChanged: (lang) =>
                          ref.read(targetLanguageProvider.notifier).state =
                              lang,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // ── Input card ─────────────────────────────────────────
            GlassCard(
              accentColor: accent,
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: _inputCtrl,
                    maxLines: 5,
                    minLines: 3,
                    textDirection: _isRtl(source) ? TextDirection.rtl : TextDirection.ltr,
                    textAlign: TextAlign.start,
                    textInputAction: TextInputAction.newline,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.onSurface,
                      height: 1.5,
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: theme.brightness == Brightness.dark
                          ? Colors.white.withValues(alpha: 0.05)
                          : Colors.black.withValues(alpha: 0.02),
                      hintText: isListening
                          ? (_isRtl(source)
                              ? 'سن رہا ہے… بولیں اور روکنے کے لیے مائیک دبائیں'
                              : 'Listening… speak naturally, tap the mic to stop')
                          : (_isRtl(source)
                              ? 'متن درج کریں یا بولنے کے لیے مائیک دبائیں…'
                              : 'Enter text or tap the mic to speak…'),
                      hintStyle: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(
                          color: accent.withValues(alpha: 0.2),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(
                          color: accent.withValues(alpha: 0.2),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(
                          color: accent,
                          width: 1.5,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (input.isNotEmpty)
                            IconButton(
                              icon: const Icon(Icons.clear_rounded, size: 18),
                              onPressed: () {
                                ref
                                        .read(translationInputProvider.notifier)
                                        .state =
                                    '';
                                ref
                                        .read(
                                          translationResultProvider.notifier,
                                        )
                                        .state =
                                    const Idle<String>();
                              },
                            ),
                          _MicButton(
                            isListening: isListening,
                            accent: accent,
                            gradient: gradient,
                            onTap: () {
                              if (isListening) {
                                actions.stopVoiceInput();
                              } else {
                                actions.startVoiceInput();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    onChanged: (v) =>
                        ref.read(translationInputProvider.notifier).state = v,
                  ),

                  if (isListening)
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 14,
                            height: 14,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: accent,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Listening in ${translateLanguageDisplayName(source)}… '
                              'tap the mic to stop and translate.',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: accent,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  if (voiceError != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        voiceError,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.error,
                        ),
                      ),
                    ),

                  if (sameLanguage)
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        'Source and target languages must be different.',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.error,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Translate button
            PremiumButton(
              onPressed:
                  input.trim().isEmpty ||
                      sameLanguage ||
                      resultState is Loading<String>
                  ? null
                  : actions.translateTapped,
              icon: resultState is Loading<String>
                  ? null
                  : Icons.translate_rounded,
              label: resultState is Loading<String>
                  ? 'Translating…'
                  : isListening
                  ? 'Stop & Translate'
                  : 'Translate',
              gradient: gradient,
            ),
            const SizedBox(height: 16),

            // States
            if (downloadState is Loading<void>)
              const LoadingIndicator(message: 'Downloading language model…'),
            if (downloadState is ErrorResult<void>)
              ErrorState(
                message: (downloadState).message,
                onRetry: actions.translate,
              ),
            if (resultState is ErrorResult<String>)
              ErrorState(
                message: (resultState).message,
                onRetry: actions.translate,
              ),

            // Result
            if (resultState is Success<String>) ...[
              GlassCard(
                accentColor: accent,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.auto_awesome_rounded,
                          size: 14,
                          color: accent,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'Translation',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: accent,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.4,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    SelectableText(
                      (resultState).data,
                      textDirection: _isRtl(target) ? TextDirection.rtl : TextDirection.ltr,
                      textAlign: TextAlign.start,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.colorScheme.onSurface,
                        fontSize: 17,
                        height: 1.6,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        Expanded(
                          child: PremiumOutlineButton(
                            accent: accent,
                            dense: true,
                            onPressed: () async {
                              await Clipboard.setData(
                                ClipboardData(text: (resultState).data),
                              );
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Copied!'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              }
                            },
                            icon: Icons.copy_rounded,
                            label: 'Copy',
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: PremiumOutlineButton(
                            accent: accent,
                            dense: true,
                            onPressed: () => Share.share((resultState).data),
                            icon: Icons.share_rounded,
                            label: 'Share',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: PremiumOutlineButton(
                            accent: accent,
                            dense: true,
                            onPressed: isSpeaking
                                ? actions.stopSpeaking
                                : actions.speakTranslation,
                            icon: isSpeaking
                                ? Icons.stop_circle_rounded
                                : Icons.volume_up_rounded,
                            label: isSpeaking ? 'Stop' : 'Play audio',
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: PremiumOutlineButton(
                            accent: accent,
                            dense: true,
                            onPressed: audioState is Loading<String>
                                ? null
                                : () => audioState is Success<String>
                                      ? actions.shareGeneratedAudio()
                                      : actions.generateTranslationAudio(),
                            icon: audioState is Loading<String>
                                ? Icons.hourglass_top_rounded
                                : audioState is Success<String>
                                ? Icons.ios_share_rounded
                                : Icons.graphic_eq_rounded,
                            label: audioState is Loading<String>
                                ? 'Generating…'
                                : audioState is Success<String>
                                ? 'Share audio file'
                                : 'Generate audio file',
                          ),
                        ),
                      ],
                    ),
                    if (audioState is ErrorResult<String>)
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          (audioState).message,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.error,
                          ),
                        ),
                      ),
                    if (audioState is Success<String>)
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          'Audio saved · tap "Share audio file" to send or save it.',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _LanguageDropdown extends StatelessWidget {
  const _LanguageDropdown({
    required this.label,
    required this.value,
    required this.languages,
    required this.onChanged,
  });

  final String label;
  final TranslateLanguage value;
  final List<TranslateLanguage> languages;
  final ValueChanged<TranslateLanguage> onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return DropdownButtonFormField<TranslateLanguage>(
      initialValue: value,
      isExpanded: true, // FIX: prevents overflow in tight row
      menuMaxHeight: 420, // keep the 59-language menu scrollable, not huge
      dropdownColor: isDark ? const Color(0xFF1B2232) : Colors.white,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: theme.colorScheme.onSurfaceVariant,
          fontWeight: FontWeight.w600,
        ),
        filled: true,
        fillColor: Colors.transparent,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
      ),
      items: languages.map((lang) {
        return DropdownMenuItem(
          value: lang,
          child: Text(
            translateLanguageDisplayName(lang),
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 13,
              color: theme.colorScheme.onSurface,
              fontWeight: lang == value ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        );
      }).toList(),
      onChanged: (lang) {
        if (lang != null) onChanged(lang);
      },
    );
  }
}

bool _isRtl(TranslateLanguage lang) {
  return lang == TranslateLanguage.urdu ||
      lang == TranslateLanguage.arabic ||
      lang == TranslateLanguage.hebrew ||
      lang == TranslateLanguage.persian;
}

/// Shared display name for a [TranslateLanguage] lives in
/// translation_providers.dart (translateLanguageDisplayName) so both this
/// dropdown and the provider's alphabetical sort use the same names.

/// Mic toggle shown inside the input field's suffix area. Solid gradient
/// glow + pulsing ring while recording makes it obvious the mic is "live"
/// and will keep capturing until tapped again.
class _MicButton extends StatefulWidget {
  const _MicButton({
    required this.isListening,
    required this.accent,
    required this.gradient,
    required this.onTap,
  });

  final bool isListening;
  final Color accent;
  final Gradient gradient;
  final VoidCallback onTap;

  @override
  State<_MicButton> createState() => _MicButtonState();
}

class _MicButtonState extends State<_MicButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulseCtrl = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 900),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _pulseCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.isListening
          ? 'Stop listening & translate'
          : 'Speak to translate',
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(24),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: widget.isListening
              ? AnimatedBuilder(
                  animation: _pulseCtrl,
                  builder: (context, child) {
                    final scale = 1.0 + (_pulseCtrl.value * 0.14);
                    return Transform.scale(
                      scale: scale,
                      child: Container(
                        width: 34,
                        height: 34,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: widget.gradient,
                          boxShadow: [
                            BoxShadow(
                              color: widget.accent.withValues(
                                alpha: 0.30 + _pulseCtrl.value * 0.25,
                              ),
                              blurRadius: 14,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.mic_rounded,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    );
                  },
                )
              : Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.accent.withValues(alpha: 0.12),
                    border: Border.all(
                      color: widget.accent.withValues(alpha: 0.4),
                    ),
                  ),
                  child: Icon(
                    Icons.mic_none_rounded,
                    color: widget.accent,
                    size: 18,
                  ),
                ),
        ),
      ),
    );
  }
}
