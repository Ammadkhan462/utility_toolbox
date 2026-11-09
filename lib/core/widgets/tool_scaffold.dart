import 'package:flutter/material.dart';
import 'package:utility_toolbox/core/widgets/app_background.dart';
import 'package:utility_toolbox/core/widgets/banner_ad_widget.dart';

/// Standard tool screen layout — handles keyboard, overflow, and ads.
class ToolScaffold extends StatelessWidget {
  const ToolScaffold({
    super.key,
    required this.title,
    required this.body,
    this.actions,
    this.floatingActionButton,
    this.bottomBar,
    this.accentColor,
    this.leading,
    this.resizeToAvoidBottomInset = true,
  });

  final String title;
  final Widget body;
  final List<Widget>? actions;
  final Widget? floatingActionButton;
  final Widget? bottomBar;
  final Color? accentColor;
  final Widget? leading;

  /// Set false only for screens that must not resize (camera screens).
  final bool resizeToAvoidBottomInset;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accent = accentColor; // local var promotes properly to non-null
    final accented = accent == null
        ? theme
        : theme.copyWith(
            colorScheme: theme.colorScheme.copyWith(primary: accent),
            tabBarTheme: theme.tabBarTheme.copyWith(
              labelColor: accent,
              unselectedLabelColor: theme.colorScheme.onSurfaceVariant,
              indicatorColor: accent,
              indicatorSize: TabBarIndicatorSize.label,
            ),
            // Premium lift: every FilledButton on a tool screen gets a
            // soft accent-tinted glow shadow, matching the gradient CTAs
            // and glowing cards used on the home screen — even screens
            // that haven't been migrated to PremiumButton yet.
            filledButtonTheme: FilledButtonThemeData(
              style: FilledButton.styleFrom(
                backgroundColor: accent,
                foregroundColor: Colors.white,
                elevation: 4,
                shadowColor: accent.withValues(alpha: 0.45),
                padding: const EdgeInsets.symmetric(
                  horizontal: 26,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
            ),
            outlinedButtonTheme: OutlinedButtonThemeData(
              style: OutlinedButton.styleFrom(
                foregroundColor: accent,
                backgroundColor: accent.withValues(alpha: 0.08),
                side: BorderSide(
                  color: accent.withValues(alpha: 0.55),
                  width: 1.4,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 26,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
            ),
          );

    return Scaffold(
      // KEY FIX: lets the body shrink when keyboard appears instead of
      // overflowing. Individual screens that need full-height (camera) can
      // pass resizeToAvoidBottomInset: false.
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      extendBodyBehindAppBar: true,
      appBar: AppBar(leading: leading, title: Text(title), actions: actions),
      floatingActionButton: floatingActionButton == null
          ? null
          : Theme(data: accented, child: floatingActionButton!),
      body: AppBackground(
        child: Theme(
          data: accented,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.paddingOf(context).top + kToolbarHeight,
              ),
              Expanded(child: body),
              if (bottomBar != null) bottomBar!,
              // Banner ad sits OUTSIDE the scroll area so it never overlaps
              // content, and is hidden by keyboard automatically.
              SafeArea(
                top: false,
                child: AnimatedSize(
                  duration: const Duration(milliseconds: 200),
                  child: MediaQuery.of(context).viewInsets.bottom > 0
                      ? const SizedBox.shrink() // hide ad when keyboard up
                      : const Center(child: BannerAdWidget()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
