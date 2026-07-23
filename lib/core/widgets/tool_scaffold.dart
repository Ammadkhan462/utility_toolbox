import 'package:flutter/material.dart';
import 'package:utility_toolbox/core/widgets/app_background.dart';
import 'package:utility_toolbox/core/widgets/banner_ad_widget.dart';

/// Standard tool screen layout with gradient background, AppBar, body, and ad.
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
  });

  final String title;
  final Widget body;
  final List<Widget>? actions;
  final Widget? floatingActionButton;
  final Widget? bottomBar;
  final Color? accentColor;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accented = accentColor == null
        ? theme
        : theme.copyWith(
            colorScheme: theme.colorScheme.copyWith(primary: accentColor),
            tabBarTheme: theme.tabBarTheme.copyWith(
              labelColor: accentColor,
              unselectedLabelColor: theme.colorScheme.onSurfaceVariant,
              indicatorColor: accentColor,
              indicatorSize: TabBarIndicatorSize.label,
            ),
            filledButtonTheme: FilledButtonThemeData(
              style: FilledButton.styleFrom(
                backgroundColor: accentColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: leading,
        title: Text(title),
        actions: actions,
      ),
      floatingActionButton: floatingActionButton == null
          ? null
          : Theme(data: accented, child: floatingActionButton!),
      body: AppBackground(
        child: Theme(
          data: accented,
          child: Column(
            children: [
              SizedBox(height: MediaQuery.paddingOf(context).top + kToolbarHeight),
              Expanded(child: body),
              if (bottomBar != null) bottomBar!,
              const SafeArea(
                top: false,
                child: Center(child: BannerAdWidget()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
