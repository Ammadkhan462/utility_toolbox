import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:utility_toolbox/core/tools/tool_input.dart';

/// Hands a [ToolInput] to screens whose state lives in Riverpod providers
/// (rather than in constructor params). [seed] runs once, right after the
/// first frame — providers can't be modified while the tree is building —
/// by which point the child screen is already watching them.
class SeedInput extends ConsumerStatefulWidget {
  const SeedInput({
    super.key,
    required this.input,
    required this.seed,
    required this.child,
  });

  final ToolInput? input;
  final void Function(WidgetRef ref, ToolInput input) seed;
  final Widget child;

  @override
  ConsumerState<SeedInput> createState() => _SeedInputState();
}

class _SeedInputState extends ConsumerState<SeedInput> {
  @override
  void initState() {
    super.initState();
    final input = widget.input;
    if (input != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) widget.seed(ref, input);
      });
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

extension ToolInputFiles on ToolInput {
  List<File> get files => [for (final p in paths) File(p)];
  File? get firstFile => paths.isEmpty ? null : File(paths.first);
}
