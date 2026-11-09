/// Kinds of content a tool can be launched with — from the Android share
/// sheet, "Open with", the text-selection menu, or another tool's result.
enum InputKind { image, pdf, text, docx, video }

/// Payload handed to a tool screen through GoRouter's `extra`.
///
/// Files are always local, readable paths (content:// URIs are copied into
/// the app cache natively before they reach Dart — see MainActivity.kt).
class ToolInput {
  const ToolInput({this.paths = const [], this.text, this.kind});

  final List<String> paths;
  final String? text;
  final InputKind? kind;

  bool get hasFiles => paths.isNotEmpty;
  bool get hasText => text != null && text!.trim().isNotEmpty;

  String? get firstPath => paths.isEmpty ? null : paths.first;

  /// Safe cast for route builders: `ToolInput.of(state.extra)`.
  static ToolInput? of(Object? extra) => extra is ToolInput ? extra : null;
}
