import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart' show NumberFormat;
import 'package:utility_toolbox/core/theme/app_colors.dart';
import 'package:utility_toolbox/core/widgets/premium_button.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/features/password_generator/providers/password_providers.dart';
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';

class PasswordGeneratorScreen extends ConsumerWidget {
  const PasswordGeneratorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final password = ref.watch(generatedPasswordProvider);
    final strength = ref.watch(passwordStrengthProvider);
    final length   = ref.watch(passwordLengthProvider);

    return ToolScaffold(
      title: AppLocalizations.of(context).toolPasswordGeneratorTitle,
      accentColor: const Color(0xFF6366F1),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _PasswordDisplay(password: password, strength: strength),
            const SizedBox(height: 24),
            _StrengthBar(strength: strength),
            const SizedBox(height: 28),
            _LengthSlider(length: length, ref: ref),
            const SizedBox(height: 20),
            _OptionsGrid(ref: ref),
            const SizedBox(height: 28),
            _ActionRow(ref: ref, password: password),
          ],
        ),
      ),
    );
  }
}

// ── Password display card ──────────────────────────────────────────────────

class _PasswordDisplay extends StatelessWidget {
  const _PasswordDisplay({required this.password, required this.strength});

  final String password;
  final PasswordStrength strength;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = _strengthColor(strength);
    final l = AppLocalizations.of(context);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: color.withValues(alpha: 0.4),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.1),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l.passwordYours,
            style: theme.textTheme.labelMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 10),
          SelectableText(
            password.isEmpty ? l.passwordSelectType : password,
            // Passwords are Latin characters; keep them LTR in Arabic/Urdu.
            textDirection: password.isEmpty ? null : TextDirection.ltr,
            style: theme.textTheme.titleMedium?.copyWith(
              fontFamily: 'monospace',
              letterSpacing: 1.5,
              fontWeight: FontWeight.w600,
              color: password.isEmpty
                  ? theme.colorScheme.onSurfaceVariant
                  : theme.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Strength bar ───────────────────────────────────────────────────────────

class _StrengthBar extends StatelessWidget {
  const _StrengthBar({required this.strength});

  final PasswordStrength strength;

  @override
  Widget build(BuildContext context) {
    final theme  = Theme.of(context);
    final l      = AppLocalizations.of(context);
    final color  = _strengthColor(strength);
    final label  = _strengthLabel(l, strength);
    final filled = strength.index + 1; // 1-4

    return MergeSemantics(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(l.passwordStrength, style: theme.textTheme.labelLarge),
              Text(
                label,
                style: theme.textTheme.labelLarge?.copyWith(
                  color: color,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: List.generate(4, (i) {
              final active = i < filled;
              return Expanded(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 6,
                  margin: EdgeInsetsDirectional.only(end: i < 3 ? 6 : 0),
                  decoration: BoxDecoration(
                    color: active
                        ? color
                        : theme.colorScheme.outline.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

// ── Length slider ──────────────────────────────────────────────────────────

class _LengthSlider extends StatelessWidget {
  const _LengthSlider({required this.length, required this.ref});

  final double length;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l = AppLocalizations.of(context);
    final n = NumberFormat.decimalPattern(l.localeName);
    final count = length.round();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(l.passwordLength, style: theme.textTheme.labelLarge),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.brand.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                l.passwordChars(count),
                style: theme.textTheme.labelMedium?.copyWith(
                  color: AppColors.brand,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        Slider(
          value: length,
          min: 6,
          max: 64,
          divisions: 58,
          label: n.format(count),
          semanticFormatterCallback: (v) => l.passwordChars(v.round()),
          onChanged: (v) {
            ref.read(passwordLengthProvider.notifier).state = v;
            regeneratePassword(ref);
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(n.format(6), style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
            Text(n.format(64), style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
          ],
        ),
      ],
    );
  }
}

// ── Options grid ───────────────────────────────────────────────────────────

class _OptionsGrid extends StatelessWidget {
  const _OptionsGrid({required this.ref});

  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l.passwordInclude,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(height: 10),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          // Two lines (name + sample) so long names (German, Russian) fit.
          childAspectRatio: 2.6,
          children: [
            _OptionChip(
              label: l.passwordUppercase,
              sample: 'A–Z',
              provider: includeUpperProvider,
              ref: ref,
            ),
            _OptionChip(
              label: l.passwordLowercase,
              sample: 'a–z',
              provider: includeLowerProvider,
              ref: ref,
            ),
            _OptionChip(
              label: l.passwordNumbers,
              sample: '0–9',
              provider: includeNumbersProvider,
              ref: ref,
            ),
            _OptionChip(
              label: l.passwordSymbols,
              sample: '!@#\$',
              provider: includeSymbolsProvider,
              ref: ref,
            ),
          ],
        ),
      ],
    );
  }
}

class _OptionChip extends ConsumerWidget {
  const _OptionChip({
    required this.label,
    required this.sample,
    required this.provider,
    required this.ref,
  });

  final String label;
  final String sample;
  final StateProvider<bool> provider;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context, WidgetRef watchRef) {
    final enabled = watchRef.watch(provider);
    final theme   = Theme.of(context);

    final color =
        enabled ? AppColors.brand : theme.colorScheme.onSurfaceVariant;
    return Semantics(
      button: true,
      toggled: enabled,
      label: label,
      excludeSemantics: true,
      child: GestureDetector(
        onTap: () {
          watchRef.read(provider.notifier).state = !enabled;
          regeneratePassword(watchRef);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: enabled
                ? AppColors.brand.withValues(alpha: 0.12)
                : theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: enabled
                  ? AppColors.brand.withValues(alpha: 0.5)
                  : theme.colorScheme.outline.withValues(alpha: 0.4),
            ),
          ),
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: color,
                  fontWeight: enabled ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
              Text(
                sample,
                textDirection: TextDirection.ltr,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: color,
                  fontFamily: 'monospace',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Action row ─────────────────────────────────────────────────────────────

class _ActionRow extends StatelessWidget {
  const _ActionRow({required this.ref, required this.password});

  final WidgetRef ref;
  final String password;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Row(
      children: [
        Expanded(
          child: PremiumOutlineButton(
            onPressed: password.isEmpty
                ? null
                : () {
                    Clipboard.setData(ClipboardData(text: password));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(l.passwordCopied),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
            icon: Icons.copy_rounded,
            label: l.commonCopy,
            accent: AppColors.brand,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          flex: 2,
          child: PremiumButton(
            onPressed: () => regeneratePassword(ref),
            icon: Icons.refresh_rounded,
            label: l.passwordGenerate,
            accent: AppColors.brand,
          ),
        ),
      ],
    );
  }
}

// ── Helpers ────────────────────────────────────────────────────────────────

Color _strengthColor(PasswordStrength s) => switch (s) {
      PasswordStrength.weak   => const Color(0xFFEF4444),
      PasswordStrength.fair   => const Color(0xFFF59E0B),
      PasswordStrength.good   => const Color(0xFF3B82F6),
      PasswordStrength.strong => const Color(0xFF22C55E),
    };

String _strengthLabel(AppLocalizations l, PasswordStrength s) => switch (s) {
      PasswordStrength.weak   => l.passwordWeak,
      PasswordStrength.fair   => l.passwordFair,
      PasswordStrength.good   => l.passwordGood,
      PasswordStrength.strong => l.passwordStrong,
    };
