import 'package:flutter/material.dart';
import 'package:utility_toolbox/core/intents/incoming_intent_handler.dart';
import 'package:utility_toolbox/core/widgets/app_background.dart';
import 'package:utility_toolbox/core/widgets/banner_ad_widget.dart';
import 'package:utility_toolbox/features/files/files_tab.dart';
import 'package:utility_toolbox/features/home/tools_tab.dart';
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';

/// App home: Tools | My Files, with the share/open-with/shortcut handler at
/// the root so incoming intents work whichever tab is showing.
class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return IncomingIntentHandler(
      // Back on the My Files tab returns to Tools instead of closing the app.
      child: PopScope(
        canPop: _index == 0,
        onPopInvokedWithResult: (didPop, _) {
          if (!didPop && _index != 0) setState(() => _index = 0);
        },
        child: Scaffold(
          body: AppBackground(
            orbs: false,
            child: SafeArea(
              bottom: false,
              child: IndexedStack(
                index: _index,
                children: const [ToolsTab(), FilesTab()],
              ),
            ),
          ),
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Center(child: BannerAdWidget(placement: 'home')),
              NavigationBar(
                selectedIndex: _index,
                onDestinationSelected: (i) => setState(() => _index = i),
                height: 64,
                destinations: [
                  NavigationDestination(
                    icon: const Icon(Icons.apps_outlined),
                    selectedIcon: const Icon(Icons.apps_rounded),
                    label: l.navTools,
                  ),
                  NavigationDestination(
                    icon: const Icon(Icons.folder_outlined),
                    selectedIcon: const Icon(Icons.folder_rounded),
                    label: l.navFiles,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
