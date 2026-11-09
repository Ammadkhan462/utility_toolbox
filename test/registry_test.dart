import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:utility_toolbox/core/intents/incoming_intent.dart';
import 'package:utility_toolbox/core/tools/tool_input.dart';
import 'package:utility_toolbox/core/tools/tool_registry.dart';
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';

void main() {
  final en = lookupAppLocalizations(const Locale('en'));

  test('ids and routes are unique', () {
    final ids = ToolRegistry.all.map((t) => t.id).toList();
    final routes = ToolRegistry.all.map((t) => t.route).toList();
    expect(ids.toSet().length, ids.length);
    expect(routes.toSet().length, routes.length);
  });

  test('every tool has localized copy in every supported language', () {
    for (final locale in AppLocalizations.supportedLocales) {
      final l = lookupAppLocalizations(locale);
      for (final t in ToolRegistry.all) {
        expect(t.title(l).trim(), isNotEmpty, reason: '${t.id} title in $locale');
        expect(t.description(l).trim(), isNotEmpty, reason: '${t.id} desc in $locale');
      }
    }
  });

  test('quick actions and legacy ids resolve', () {
    expect(ToolRegistry.quickActions, hasLength(4));
    expect(ToolRegistry.byId('qr_barcode')?.id, 'qr_scanner');
    expect(ToolRegistry.byId('pdf_toolkit')?.id, 'image_to_pdf');
    expect(ToolRegistry.byId('nope'), isNull);
  });

  test('search finds tools by intent words', () {
    List<String> ids(String q) => ToolRegistry.search(q, en).map((t) => t.id).toList();
    expect(ids('compress pdf').first, 'compress_pdf');
    expect(ids('jpg to pdf').first, 'image_to_pdf');
    expect(ids('scan'), contains('doc_scanner'));
    expect(ids('emi'), contains('loan_calculator'));
    expect(ids('passport'), contains('image_resizer'));
    expect(ids('zzzz'), isEmpty);
  });

  test('share targets: every input kind has at least one tool', () {
    for (final kind in InputKind.values) {
      expect(ToolRegistry.accepting(kind), isNotEmpty, reason: '$kind');
    }
    expect(
      ToolRegistry.accepting(InputKind.image, count: 3).map((t) => t.id),
      containsAll(['image_to_pdf', 'image_resizer']),
    );
    expect(ToolRegistry.accepting(InputKind.pdf, count: 2).map((t) => t.id), ['merge_pdf']);
  });

  test('mime/extension mapping for shared files', () {
    expect(IncomingIntent.kindForMime('image/jpeg', 'a.jpg'), InputKind.image);
    expect(IncomingIntent.kindForMime('application/octet-stream', 'x.PDF'), InputKind.pdf);
    expect(
      IncomingIntent.kindForMime(
        'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
        'd',
      ),
      InputKind.docx,
    );
    expect(IncomingIntent.kindForMime('video/mp4', 'v'), InputKind.video);
    expect(IncomingIntent.kindForMime('application/zip', 'a.zip'), isNull);
  });
}
