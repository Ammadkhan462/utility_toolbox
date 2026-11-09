import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utility_toolbox/core/intents/incoming_intent.dart';
import 'package:utility_toolbox/core/platform/system_bridge.dart';
import 'package:utility_toolbox/core/tools/tool_input.dart';
import 'package:utility_toolbox/core/tools/tool_providers.dart';
import 'package:utility_toolbox/core/tools/tool_registry.dart';
import 'package:utility_toolbox/core/widgets/tool_icon.dart';
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';

/// Sits at the root of the home shell and turns share-sheet, open-with,
/// text-selection and shortcut launches into the right tool:
///
///  * deep link → open that tool;
///  * text from the selection menu → Translate, directly;
///  * anything else → straight to the tool if only one fits, otherwise a
///    "What do you want to do?" sheet listing every tool that accepts it.
class IncomingIntentHandler extends ConsumerStatefulWidget {
  const IncomingIntentHandler({super.key, required this.child});

  final Widget child;

  @override
  ConsumerState<IncomingIntentHandler> createState() =>
      _IncomingIntentHandlerState();
}

class _IncomingIntentHandlerState extends ConsumerState<IncomingIntentHandler> {
  StreamSubscription<RawIntent>? _sub;

  @override
  void initState() {
    super.initState();
    _sub = SystemBridge.instance.intents.listen(_handleRaw);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _handleRaw(await SystemBridge.instance.getInitialIntent());
    });
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  Future<void> _handleRaw(RawIntent? raw) async {
    final intent = await IncomingIntent.parse(raw);
    if (intent == null || !mounted) return;
    final l = AppLocalizations.of(context);

    switch (intent) {
      case DeepLinkIntent(:final toolId):
        final tool = ToolRegistry.byId(toolId);
        if (tool != null) openTool(context, ref, tool);
      case TextIntent(:final text, fromSelection: true):
        openTool(
          context,
          ref,
          ToolRegistry.byId('translation')!,
          input: ToolInput(text: text, kind: InputKind.text),
        );
      case TextIntent(:final text):
        _chooseTool(
          kind: InputKind.text,
          input: ToolInput(text: text, kind: InputKind.text),
          subtitle: l.incomingText,
        );
      case FilesIntent(:final kind, :final paths):
        _chooseTool(
          kind: kind,
          input: ToolInput(paths: paths, kind: kind),
          subtitle: switch (kind) {
            InputKind.image => l.incomingImages(paths.length),
            InputKind.pdf => l.incomingPdfs(paths.length),
            InputKind.docx => l.incomingDocument,
            InputKind.video => l.incomingVideo,
            InputKind.text => l.incomingText,
          },
        );
      case UnsupportedIntent():
        _snack(l.incomingUnsupported);
      case FailedIntent():
        _snack(l.incomingFailed);
    }
  }

  void _chooseTool({
    required InputKind kind,
    required ToolInput input,
    required String subtitle,
  }) {
    var tools = ToolRegistry.accepting(kind, count: input.paths.length);
    // Several files but no multi-file tool for this kind: offer the
    // single-file tools with just the first file rather than nothing.
    var effective = input;
    if (tools.isEmpty && input.paths.length > 1) {
      tools = ToolRegistry.accepting(kind);
      effective = ToolInput(paths: [input.paths.first], kind: kind);
    }
    if (tools.isEmpty) {
      _snack(AppLocalizations.of(context).incomingUnsupported);
      return;
    }
    if (tools.length == 1) {
      openTool(context, ref, tools.first, input: effective);
      return;
    }
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (sheetContext) => _ToolChooserSheet(
        tools: tools,
        subtitle: subtitle,
        onPick: (tool) {
          Navigator.of(sheetContext).pop();
          openTool(context, ref, tool, input: effective);
        },
      ),
    );
  }

  void _snack(String message) {
    ScaffoldMessenger.maybeOf(context)
      ?..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

class _ToolChooserSheet extends StatelessWidget {
  const _ToolChooserSheet({
    required this.tools,
    required this.subtitle,
    required this.onPick,
  });

  final List<ToolDefinition> tools;
  final String subtitle;
  final ValueChanged<ToolDefinition> onPick;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return SafeArea(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.sizeOf(context).height * 0.75,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 4),
              child: Text(
                l.incomingSheetTitle,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 12),
              child: Text(
                subtitle,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.only(bottom: 16),
                itemCount: tools.length,
                itemBuilder: (context, i) {
                  final tool = tools[i];
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 2,
                    ),
                    leading: ToolIcon(
                      icon: tool.icon,
                      colors: tool.colors,
                      size: 44,
                    ),
                    title: Text(
                      tool.title(l),
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                    subtitle: Text(tool.description(l)),
                    onTap: () => onPick(tool),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
