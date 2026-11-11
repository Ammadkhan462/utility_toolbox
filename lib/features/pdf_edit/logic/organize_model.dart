import 'package:utility_toolbox/features/pdf_edit/logic/pdf_geometry.dart';

/// One page in the Organize grid: which page of the original file it is and
/// how many extra clockwise quarter turns the user gave it.
class OrgPage {
  const OrgPage(this.source, [this.turns = 0]);

  /// 0-based index in the original PDF. Unique within a list, so it doubles
  /// as the page's identity (keys, selection).
  final int source;

  /// Extra clockwise quarter turns, 0..3.
  final int turns;

  OrgPage rotated(int by) => OrgPage(source, normalizeTurns(turns + by));

  @override
  bool operator ==(Object other) =>
      other is OrgPage && other.source == source && other.turns == turns;

  @override
  int get hashCode => Object.hash(source, turns);

  @override
  String toString() => 'OrgPage($source, $turns)';
}

List<OrgPage> initialPages(int count) => [for (var i = 0; i < count; i++) OrgPage(i)];

/// Moves the item at [from] so it ends up at index [to] of the result.
List<OrgPage> movePage(List<OrgPage> pages, int from, int to) {
  if (from == to || from < 0 || from >= pages.length) return pages;
  final list = [...pages];
  final item = list.removeAt(from);
  list.insert(to.clamp(0, list.length), item);
  return list;
}

/// Rotates every page whose source is in [sources] by [by] quarter turns.
List<OrgPage> rotatePages(List<OrgPage> pages, Set<int> sources, int by) => [
  for (final p in pages) sources.contains(p.source) ? p.rotated(by) : p,
];

/// Removes every page whose source is in [sources].
List<OrgPage> deletePages(List<OrgPage> pages, Set<int> sources) => [
  for (final p in pages)
    if (!sources.contains(p.source)) p,
];

/// True if the list is still the untouched original document.
bool isUnchanged(List<OrgPage> pages, int originalCount) {
  if (pages.length != originalCount) return false;
  for (var i = 0; i < pages.length; i++) {
    if (pages[i].source != i || pages[i].turns != 0) return false;
  }
  return true;
}

/// True when pages only got removed/rotated, never reordered — the output
/// can then be produced by editing the original in place, which keeps
/// links, form fields and annotations.
bool isOrderPreserved(List<int> sources) {
  for (var i = 1; i < sources.length; i++) {
    if (sources[i] <= sources[i - 1]) return false;
  }
  return true;
}
