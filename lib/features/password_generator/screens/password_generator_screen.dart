import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utility_toolbox/core/theme/app_colors.dart';
import 'package:utility_toolbox/core/widgets/premium_button.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/features/password_generator/providers/password_providers.dart';

class PasswordGeneratorScreen extends ConsumerWidget {
  const PasswordGeneratorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final password = ref.watch(generatedPasswordProvider);
    final strength = ref.watch(passwordStrengthProvider);
    final length   = ref.watch(passwordLengthProvider);

    return ToolScaffold(
      title: 'Password Generator',
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
            'Your password',
            style: theme.textTheme.labelMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 10),
          SelectableText(
            password.isEmpty ? 'Select at least one character type' : password,
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
    final color  = _strengthColor(strength);
    final label  = _strengthLabel(strength);
    final filled = strength.index + 1; // 1-4

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Strength', style: theme.textTheme.labelLarge),
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
                margin: EdgeInsets.only(right: i < 3 ? 6 : 0),
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Length', style: theme.textTheme.labelLarge),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.brand.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '${length.round()} chars',
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
          onChanged: (v) {
            ref.read(passwordLengthProvider.notifier).state = v;
            regeneratePassword(ref);
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('6', style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
            Text('64', style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Include',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(height: 10),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 3.2,
          children: [
            _OptionChip(
              label: 'Uppercase  A–Z',
              provider: includeUpperProvider,
              ref: ref,
            ),
            _OptionChip(
              label: 'Lowercase  a–z',
              provider: includeLowerProvider,
              ref: ref,
            ),
            _OptionChip(
              label: 'Numbers  0–9',
              provider: includeNumbersProvider,
              ref: ref,
            ),
            _OptionChip(
              label: 'Symbols  !@#\$',
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
    required this.provider,
    required this.ref,
  });

  final String label;
  final StateProvider<bool> provider;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context, WidgetRef watchRef) {
    final enabled = watchRef.watch(provider);
    final theme   = Theme.of(context);

    return GestureDetector(
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
        child: Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: enabled ? AppColors.brand : theme.colorScheme.onSurfaceVariant,
            fontWeight: enabled ? FontWeight.w600 : FontWeight.w400,
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
    return Row(
      children: [
        Expanded(
          child: PremiumOutlineButton(
            onPressed: password.isEmpty
                ? null
                : () {
                    Clipboard.setData(ClipboardData(text: password));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Password copied!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
            icon: Icons.copy_rounded,
            label: 'Copy',
            accent: AppColors.brand,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          flex: 2,
          child: PremiumButton(
            onPressed: () => regeneratePassword(ref),
            icon: Icons.refresh_rounded,
            label: 'Generate New',
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

String _strengthLabel(PasswordStrength s) => switch (s) {
      PasswordStrength.weak   => 'Weak',
      PasswordStrength.fair   => 'Fair',
      PasswordStrength.good   => 'Good',
      PasswordStrength.strong => 'Strong',
    };
