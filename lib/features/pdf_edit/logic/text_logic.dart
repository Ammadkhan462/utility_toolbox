/// Pure helpers for PDF to Text.
library;

final _spaces = RegExp(r'[ \t ]+\n');
final _manyBlankLines = RegExp(r'\n{3,}');
final _words = RegExp(r'\S+');

/// Normalises line endings, trims trailing spaces and collapses runs of
/// blank lines that extractors tend to produce.
String cleanPageText(String raw) => raw
    .replaceAll('\r\n', '\n')
    .replaceAll('\r', '\n')
    .replaceAll(_spaces, '\n')
    .replaceAll(_manyBlankLines, '\n\n')
    .trim();

/// All pages as one plain-text document, pages separated by a blank line.
String joinPages(List<String> pages) =>
    pages.where((t) => t.trim().isNotEmpty).join('\n\n');

int countWords(String text) => _words.allMatches(text).length;

/// True when the file has (almost) no text layer — a scan or photos.
/// Fewer than ~8 visible characters per page on average counts as scanned;
/// stray page numbers or a single header shouldn't hide that.
bool looksScanned(List<String> pages) {
  if (pages.isEmpty) return false;
  var chars = 0;
  for (final t in pages) {
    chars += t.replaceAll(RegExp(r'\s'), '').length;
  }
  return chars < 8 * pages.length;
}
