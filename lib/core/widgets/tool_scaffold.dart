import 'package:flutter/material.dart';
import 'package:utility_toolbox/core/widgets/banner_ad_widget.dart';

/// Standard tool screen layout: AppBar, scrollable body, banner ad at bottom.
class ToolScaffold extends StatelessWidget {
  const ToolScaffold({
    super.key,
    required this.title,
    required this.body,
    this.actions,
    this.floatingActionButton,
    this.bottomBar,
  });

  final String title;
  final Widget body;
  final List<Widget>? actions;
  final Widget? floatingActionButton;
  final Widget? bottomBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), actions: actions),
      floatingActionButton: floatingActionButton,
      body: Column(
        children: [
          Expanded(child: body),
          if (bottomBar != null) bottomBar!,
          const SafeArea(
            top: false,
            child: Center(child: BannerAdWidget()),
          ),
        ],
      ),
    );
  }
}
