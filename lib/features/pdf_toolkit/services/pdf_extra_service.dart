import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path/path.dart' as p;
import 'package:printing/printing.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart' as sf;

/// Parses page selections like `1-3, 5, 8-` (1-based, inclusive; an open
/// end means "to the last page") into sorted, de-duplicated 0-based
/// indices. Throws [PageRangeException] (a [FormatException]); the UI turns
/// its [PageRangeException.kind] into a message in the app language.
List<int> parsePageRanges(String input, int pageCount) {
  final cleaned = input.replaceAll(' ', '');
  if (cleaned.isEmpty) throw PageRangeException(PageRangeError.empty, pageCount: pageCount);
  final pages = <int>{};
  for (final part in cleaned.split(',')) {
    if (part.isEmpty) continue;
    final match = RegExp(r'^(\d+)(?:-(\d*))?$').firstMatch(part);
    if (match == null) {
      throw PageRangeException(PageRangeError.invalid, part: part, pageCount: pageCount);
    }
    final start = int.parse(match.group(1)!);
    final hasDash = part.contains('-');
    final endText = match.group(2);
    final end = !hasDash
        ? start
        : (endText == null || endText.isEmpty)
        ? pageCount
        : int.parse(endText);
    if (start < 1 || end > pageCount || start > end) {
      throw PageRangeException(PageRangeError.outOfRange, part: part, pageCount: pageCount);
    }
    for (var i = start; i <= end; i++) {
      pages.add(i - 1);
    }
  }
  if (pages.isEmpty) throw PageRangeException(PageRangeError.empty, pageCount: pageCount);
  return pages.toList()..sort();
}

enum PageRangeError { empty, invalid, outOfRange }

/// Why a page selection couldn't be parsed. [message] stays English for
/// logs; screens show a translated text built from [kind], [part] and
/// [pageCount].
class PageRangeException extends FormatException {
  PageRangeException(this.kind, {this.part = '', required this.pageCount})
    : super(switch (kind) {
        PageRangeError.empty => 'Enter at least one page.',
        PageRangeError.invalid => '“$part” isn’t a page or range (e.g. 1-3, 5).',
        PageRangeError.outOfRange => '“$part” is outside 1–$pageCount.',
      });

  final PageRangeError kind;
  final String part;
  final int pageCount;
}

class PdfInfo {
  const PdfInfo({required this.pageCount, required this.isEncrypted});
  final int pageCount;
  final bool isEncrypted;
}

/// Raised when a PDF needs a password (or the one given is wrong).
class PdfPasswordException implements Exception {
  const PdfPasswordException();
}

/// Split/extract, lock/unlock and page rendering. The Syncfusion work is
/// pure Dart and runs in background isolates; rendering pages needs the
/// `printing` platform channel so it stays on the main isolate (the heavy
/// lifting happens natively anyway).
class PdfExtraService {
  // The file is read inside the isolate: reading it here and handing the
  // bytes to compute() kept two full copies of a large PDF in memory.
  Future<PdfInfo> inspect(String path) => compute(_inspect, path);

  /// Writes a PDF that keeps only [keepIndices] (0-based).
  Future<File> keepPages(String path, List<int> keepIndices, {String? password}) async {
    final out = await compute(
      _keepPages,
      (path: path, keep: keepIndices, password: password),
    );
    return _write(out, path, 'pages');
  }

  Future<File> protect(String path, String password) async {
    final out = await compute(_protect, (path: path, password: password));
    return _write(out, path, 'locked');
  }

  Future<File> unlock(String path, String password) async {
    final out = await compute(_unlock, (path: path, password: password));
    return _write(out, path, 'unlocked');
  }

  /// Renders pages to JPEG files; yields each finished file so the UI can
  /// show progress. [dpi] 150 is sharp on phones and keeps files small.
  Stream<File> renderPages(String path, {List<int>? pages, double dpi = 150}) async* {
    final bytes = await File(path).readAsBytes();
    final dir = await Directory.systemTemp.createTemp('pdf_pages_');
    final base = p.basenameWithoutExtension(path);
    var n = 0;
    await for (final raster in Printing.raster(bytes, pages: pages, dpi: dpi)) {
      n++;
      final png = await raster.toPng();
      final jpg = await FlutterImageCompress.compressWithList(
        png,
        quality: 90,
        format: CompressFormat.jpeg,
        minWidth: 10000,
        minHeight: 10000,
      );
      final pageNumber = pages == null ? n : pages[n - 1] + 1;
      final file = File(p.join(dir.path, '${base}_page_$pageNumber.jpg'));
      yield await file.writeAsBytes(jpg);
    }
  }

  Future<File> _write(List<int> bytes, String sourcePath, String suffix) async {
    final name =
        '${p.basenameWithoutExtension(sourcePath)}_${suffix}_${DateTime.now().millisecondsSinceEpoch}.pdf';
    final file = File(p.join(Directory.systemTemp.path, name));
    return file.writeAsBytes(bytes);
  }
}

sf.PdfDocument _open(Uint8List bytes, String? password) {
  try {
    return sf.PdfDocument(inputBytes: bytes, password: password);
  } on ArgumentError catch (e) {
    if ('$e'.toLowerCase().contains('password')) throw const PdfPasswordException();
    rethrow;
  } catch (e) {
    if ('$e'.toLowerCase().contains('password')) throw const PdfPasswordException();
    rethrow;
  }
}

PdfInfo _inspect(String path) {
  final bytes = File(path).readAsBytesSync();
  try {
    final doc = sf.PdfDocument(inputBytes: bytes);
    final info = PdfInfo(pageCount: doc.pages.count, isEncrypted: false);
    doc.dispose();
    return info;
  } catch (e) {
    if ('$e'.toLowerCase().contains('password')) {
      return const PdfInfo(pageCount: 0, isEncrypted: true);
    }
    rethrow;
  }
}

Future<List<int>> _keepPages(
  ({String path, List<int> keep, String? password}) args,
) async {
  final doc = _open(File(args.path).readAsBytesSync(), args.password);
  final keep = args.keep.toSet();
  // Removing (rather than copying templates into a new document) keeps
  // page sizes, rotation, links, bookmarks and fonts intact.
  for (var i = doc.pages.count - 1; i >= 0; i--) {
    if (!keep.contains(i)) doc.pages.removeAt(i);
  }
  final out = await doc.save();
  doc.dispose();
  return out;
}

Future<List<int>> _protect(({String path, String password}) args) async {
  final doc = _open(File(args.path).readAsBytesSync(), null);
  doc.security
    ..algorithm = sf.PdfEncryptionAlgorithm.aesx256Bit
    ..userPassword = args.password
    ..ownerPassword = args.password;
  final out = await doc.save();
  doc.dispose();
  return out;
}

Future<List<int>> _unlock(({String path, String password}) args) async {
  final doc = _open(File(args.path).readAsBytesSync(), args.password);
  doc.security
    ..userPassword = ''
    ..ownerPassword = '';
  final out = await doc.save();
  doc.dispose();
  return out;
}
