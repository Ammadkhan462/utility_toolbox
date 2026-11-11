import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:utility_toolbox/features/pdf_edit/logic/organize_model.dart';
import 'package:utility_toolbox/features/pdf_edit/logic/pdf_geometry.dart';
import 'package:utility_toolbox/features/pdf_edit/logic/stamp_logic.dart';
import 'package:utility_toolbox/features/pdf_edit/logic/text_logic.dart';
import 'package:utility_toolbox/features/pdf_edit/services/pdf_edit_engine.dart';

/// Applies "translate, then rotate clockwise (y-down)" the way PDF graphics
/// compose them: the rotation acts on user coordinates first.
Offset applyTransform(Offset v, ({Offset translate, double rotateDegrees}) t) {
  final a = t.rotateDegrees * math.pi / 180;
  final r = Offset(v.dx * math.cos(a) - v.dy * math.sin(a), v.dx * math.sin(a) + v.dy * math.cos(a));
  return r + t.translate;
}

void expectOffset(Offset actual, Offset expected) {
  expect(actual.dx, closeTo(expected.dx, 1e-6));
  expect(actual.dy, closeTo(expected.dy, 1e-6));
}

void main() {
  group('page geometry', () {
    const page = Size(600, 800);

    test('visual size swaps for 90/270', () {
      expect(const PageGeom(600, 800, 1).visualSize, const Size(800, 600));
      expect(const PageGeom(600, 800, 2).visualSize, const Size(600, 800));
      expect(const PageGeom(600, 800, 3).visualAspect, closeTo(800 / 600, 1e-9));
    });

    test('visual corners land on the right page corners', () {
      // /Rotate 90 = page shown turned clockwise: its top-left corner is
      // displayed top-right, so the visual top-left is the page's
      // bottom-left (0, H).
      expectOffset(visualToPagePoint(Offset.zero, page, 1), const Offset(0, 800));
      expectOffset(visualToPagePoint(Offset.zero, page, 2), const Offset(600, 800));
      expectOffset(visualToPagePoint(Offset.zero, page, 3), const Offset(600, 0));
      expectOffset(visualToPagePoint(const Offset(10, 20), page, 0), const Offset(10, 20));
      // Visual bottom-right is the opposite corner.
      expectOffset(visualToPagePoint(const Offset(800, 600), page, 1), const Offset(600, 0));
      expectOffset(visualToPagePoint(const Offset(800, 600), page, 3), const Offset(0, 800));
    });

    test('graphics transform matches the point mapping for every rotation', () {
      for (var turns = 0; turns < 4; turns++) {
        final t = visualTransform(page, turns);
        for (final v in const [Offset(0, 0), Offset(37, 91), Offset(250, 500), Offset(5, 590)]) {
          expectOffset(applyTransform(v, t), visualToPagePoint(v, page, turns));
        }
      }
    });

    test('normalised rects scale to points', () {
      final r = denormalizeRect(const Rect.fromLTWH(0.5, 0.25, 0.2, 0.1), const Size(800, 600));
      expect(r, const Rect.fromLTWH(400, 150, 160, 60));
    });

    test('clampUnitRect keeps boxes on the page', () {
      final a = clampUnitRect(const Rect.fromLTWH(0.9, 0.95, 0.3, 0.1));
      expectOffset(a.topLeft, const Offset(0.7, 0.9));
      expectOffset(a.bottomRight, const Offset(1, 1));
      final b = clampUnitRect(const Rect.fromLTWH(-0.2, -0.1, 0.3, 0.1));
      expectOffset(b.topLeft, Offset.zero);
      expectOffset(b.bottomRight, const Offset(0.3, 0.1));
      final big = clampUnitRect(const Rect.fromLTWH(0, 0, 2, 1));
      expect(big.width, closeTo(1, 1e-9));
      expect(big.height, closeTo(0.5, 1e-9));
    });

    test('signatureRect keeps the ink aspect ratio on the page', () {
      // A4 portrait page, signature 3:1.
      const pageAspect = 595 / 842;
      final r = signatureRect(
        center: const Offset(0.5, 0.5),
        widthFraction: 0.3,
        imageAspect: 3,
        pageAspect: pageAspect,
      );
      final widthPt = r.width * 595;
      final heightPt = r.height * 842;
      expect(widthPt / heightPt, closeTo(3, 1e-9));
      expect(r.center.dx, closeTo(0.5, 1e-9));
    });
  });

  group('organize model', () {
    test('move, rotate, delete', () {
      var pages = initialPages(4);
      pages = movePage(pages, 0, 3);
      expect(pages.map((p) => p.source), [1, 2, 3, 0]);
      pages = movePage(pages, 3, 0);
      expect(pages.map((p) => p.source), [0, 1, 2, 3]);
      pages = rotatePages(pages, {1, 2}, -1);
      expect(pages.map((p) => p.turns), [0, 3, 3, 0]);
      pages = rotatePages(pages, {1}, 1);
      expect(pages[1].turns, 0);
      pages = deletePages(pages, {0, 3});
      expect(pages, const [OrgPage(1, 0), OrgPage(2, 3)]);
    });

    test('change detection', () {
      expect(isUnchanged(initialPages(3), 3), isTrue);
      expect(isUnchanged(rotatePages(initialPages(3), {0}, 4), 3), isTrue);
      expect(isUnchanged(movePage(initialPages(3), 0, 1), 3), isFalse);
      expect(isUnchanged(deletePages(initialPages(3), {2}), 3), isFalse);
      expect(isOrderPreserved([0, 2, 5]), isTrue);
      expect(isOrderPreserved([2, 0]), isFalse);
    });
  });

  group('page numbers', () {
    test('formats', () {
      expect(formatPageNumber(PageNumberStyle.plain, index: 0, pageCount: 10), '1');
      expect(formatPageNumber(PageNumberStyle.word, index: 2, pageCount: 10), 'Page 3');
      expect(
        formatPageNumber(PageNumberStyle.word, index: 2, pageCount: 10, pageWord: (n) => 'Seite $n'),
        'Seite 3',
      );
      expect(formatPageNumber(PageNumberStyle.ofTotal, index: 0, pageCount: 10), '1 / 10');
    });

    test('custom start number shifts both sides of "n / N"', () {
      final labels = pageNumberLabels(PageNumberStyle.ofTotal, pageCount: 3, start: 5);
      expect(labels, ['5 / 7', '6 / 7', '7 / 7']);
    });

    test('standard-font safety', () {
      expect(isStandardFontSafe('CONFIDENTIAL'), isTrue);
      expect(isStandardFontSafe('Página 3 – é ü ß'), isFalse); // en dash isn't Latin-1
      expect(isStandardFontSafe('Página 3 é ü ß'), isTrue);
      expect(isStandardFontSafe('Sayfa 3'), isTrue);
      expect(isStandardFontSafe('GİZLİ'), isFalse);
      expect(isStandardFontSafe('سري'), isFalse);
      expect(isStandardFontSafe('गोपनीय'), isFalse);
      expect(isStandardFontSafe('Страница 1'), isFalse);
    });

    test('positions sit inside the margins', () {
      const page = Size(600, 800);
      const label = Size(40, 12);
      expect(
        pageNumberCenter(page, label, PageNumberPosition.bottomCenter),
        const Offset(300, 800 - pageNumberMargin - 6),
      );
      expect(
        pageNumberCenter(page, label, PageNumberPosition.topRight),
        const Offset(600 - pageNumberMargin - 20, pageNumberMargin + 6),
      );
    });

    test('diagonal angle follows the page shape', () {
      expect(diagonalAngleDegrees(100, 100), closeTo(45, 1e-9));
      expect(diagonalAngleDegrees(595, 842), greaterThan(45));
    });

    test('tiles cover the whole page', () {
      const page = Size(595, 842);
      final tiles = tilePositions(page, const Size(200, 40));
      final half = math.sqrt(595 * 595 + 842 * 842) / 2;
      expect(tiles.any((t) => t.dx <= -half && t.dy <= -half), isTrue);
      expect(tiles.any((t) => t.dx >= half && t.dy >= half), isTrue);
    });
  });

  group('text helpers', () {
    test('cleanPageText normalises whitespace', () {
      expect(cleanPageText('Hello  \r\nworld\r\n\r\n\r\n\r\nEnd  '), 'Hello\nworld\n\nEnd');
    });

    test('joinPages skips empty pages', () {
      expect(joinPages(['a', '  ', 'b']), 'a\n\nb');
    });

    test('word count', () {
      expect(countWords('one two\nthree   four'), 4);
      expect(countWords(''), 0);
    });

    test('scanned detection', () {
      expect(looksScanned(['', ' ', '3']), isTrue);
      expect(looksScanned(['A real paragraph of text on page one.', '', '']), isFalse);
      expect(looksScanned(const []), isFalse);
    });
  });
}
