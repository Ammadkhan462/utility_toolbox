import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:utility_toolbox/core/constants/app_constants.dart';
import 'package:utility_toolbox/core/routing/app_routes.dart';
import 'package:utility_toolbox/core/widgets/banner_ad_widget.dart';
import 'package:utility_toolbox/features/home/widgets/tool_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appName),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => context.push(AppRoutes.settings),
          ),
        ],
      ),
      body: Column(
        children: const [
          Expanded(child: ToolGrid()),
          SafeArea(
            top: false,
            child: Center(child: BannerAdWidget(placement: 'home')),
          ),
        ],
      ),
    );
  }
}
