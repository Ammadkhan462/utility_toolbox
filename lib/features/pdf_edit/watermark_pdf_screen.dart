import 'dart:io';
import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/features/pdf_edit/logic/stamp_logic.dart';
import 'package:utility_toolbox/features/pdf_edit/services/pdf_edit_engine.dart';
import 'package:utility_toolbox/features/pdf_edit/services/pdf_thumbnails.dart';
import 'package:utility_toolbox/features/pdf_edit/services/text_image_renderer.dart';
import 'package:utility_toolbox/features/pdf_edit/widgets/pdf_edit_widgets.dart';
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';

const _accent = Color(0xFF00B4D8);
const _numberColor = Color(0xFF333333);

enum _Mode { text, numbers }

/// Text watermark or page numbers on every page, with a live preview of
/// page 1.
class WatermarkPdfScreen extends StatefulWidget {
  const WatermarkPdfScreen({super.key, this.initialPath});

  final String? initialPath;

  @override
  State<WatermarkPdfScreen> createState() => _WatermarkPdfScreenState();
}

class _WatermarkPdfScreenState extends State<WatermarkPdfScreen> {
  final _engine = const PdfEditEngine();
  final _text = TextEditingController();
  bool _textSeeded = false;

  String? _path;
  Uint8List? _bytes;
  PdfDocInfo? _info;
  ui.Image? _preview;
  bool _loading = false;
  bool _working = false;
  String? _error;
  File? _result;

  _Mode _mode = _Mode.text;
  double _fontSize = 60;
  double _opacity = 0.25;
  WatermarkLayout _layout = WatermarkLayout.diagonal;
  int _colorIndex = 0;

  PageNumberStyle _style = PageNumberStyle.word;
  PageNumberPosition _position = PageNumberPosition.bottomCenter;
  int _start = 1;

  static const _colors = [
    Color(0xFF808080),
    Color(0xFFD32F2F),
    Color(0xFF1565C0),
    Color(0xFF000000),
    Color(0xFF2E7D32),
  ];

  @override
  void initState() {
    super.initState();
    _text.addListener(_onText);
    if (widget.initialPath != null) _load(widget.initialPath!);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_textSeeded) {
      _textSeeded = true;
      _text.text = AppLocalizations.of(context).watermarkPdfDefaultText;
    }
  }

  void _onText() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _text.removeListener(_onText);
    _text.dispose();
    _preview?.dispose();
    super.dispose();
  }

  Future<void> _pick() async {
    final path = await pickPdfFile();
    if (path != null && mounted) await _load(path);
  }

  Future<void> _load(String path) async {
    _preview?.dispose();
    setState(() {
      _path = path;
      _bytes = null;
      _info = null;
      _preview = null;
      _result = null;
      _error = null;
      _loading = true;
    });
    try {
      final opened = await _engine.open(path);
      if (!mounted) return;
      setState(() {
        _bytes = opened.bytes;
        _info = opened.info;
      });
      if (!opened.info.encrypted && opened.info.pageCount > 0) {
        final img = await renderPagePreview(opened.bytes, 0, dpi: 72);
        if (!mounted || _path != path) {
          img?.dispose();
          return;
        }
        setState(() => _preview = img);
      }
    } catch (_) {
      if (!mounted) return;
      setState(() => _error = AppLocalizations.of(context).pdfEditInvalidPdf);
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _apply() async {
    final l = AppLocalizations.of(context);
    final bytes = _bytes;
    final path = _path;
    final info = _info;
    if (bytes == null || path == null || info == null) return;
    final text = _text.text.trim();
    if (_mode == _Mode.text && text.isEmpty) {
      setState(() => _error = l.watermarkPdfTextEmpty);
      return;
    }
    setState(() {
      _working = true;
      _error = null;
    });
    try {
      final StampJob job;
      if (_mode == _Mode.text) {
        final color = _colors[_colorIndex];
        final stamp = await buildTextStamp(
          text,
          fontSizePt: _fontSize,
          color: color,
          opacity: _opacity,
        );
        job = StampJob.watermark(
          pdf: bytes,
          watermark: stamp,
          layout: _layout,
          colorArgb: color.toARGB32(),
          opacity: _opacity,
        );
      } else {
        final labels = pageNumberLabels(
          _style,
          pageCount: info.pageCount,
          start: _start,
          pageWord: l.watermarkPdfPageLabel,
        );
        final stamps = <TextStamp>[];
        for (final label in labels) {
          stamps.add(
            await buildTextStamp(
              label,
              fontSizePt: pageNumberFontSize,
              color: _numberColor,
              bold: false,
            ),
          );
          if (!mounted) return;
        }
        job = StampJob.pageNumbers(
          pdf: bytes,
          pageNumbers: stamps,
          position: _position,
          colorArgb: _numberColor.toARGB32(),
        );
      }
      final file = await _engine.stamp(
        job: job,
        sourcePath: path,
        suffix: _mode == _Mode.text ? 'watermarked' : 'numbered',
      );
      if (!mounted) return;
      setState(() => _result = file);
    } catch (_) {
      if (!mounted) return;
      setState(() => _error = l.watermarkPdfFailed);
    } finally {
      if (mounted) setState(() => _working = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final info = _info;
    final result = _result;
    final ready = info != null && !info.encrypted && info.pageCount > 0;

    return ToolScaffold(
      title: l.toolWatermarkPdfTitle,
      accentColor: _accent,
      bottomBar: ready && result == null
          ? Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
              child: PdfActionButton(
                label: _mode == _Mode.text ? l.watermarkPdfApplyText : l.watermarkPdfApplyNumbers,
                icon: _mode == _Mode.text
                    ? Icons.branding_watermark_rounded
                    : Icons.format_list_numbered_rounded,
                busy: _working,
                onPressed: _apply,
              ),
            )
          : null,
      body: ListView(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 24),
        children: [
          if (result != null)
            PdfEditResultCard(
              file: result,
              toolId: 'watermark_pdf',
              accent: _accent,
              onReset: () => setState(() => _result = null),
            )
          else ...[
            PdfPickCard(
              path: _path,
              pageCount: info?.pageCount,
              loading: _loading,
              locked: info?.encrypted ?? false,
              onPick: _working ? null : _pick,
              accent: _accent,
            ),
            if (info != null && info.encrypted && _path != null) PdfLockedNotice(path: _path!),
            if (ready) ...[
              const SizedBox(height: 16),
              SegmentedButton<_Mode>(
                showSelectedIcon: false,
                segments: [
                  ButtonSegment(
                    value: _Mode.text,
                    icon: const Icon(Icons.text_fields_rounded),
                    label: Text(l.watermarkPdfModeText, overflow: TextOverflow.ellipsis),
                  ),
                  ButtonSegment(
                    value: _Mode.numbers,
                    icon: const Icon(Icons.format_list_numbered_rounded),
                    label: Text(l.watermarkPdfModeNumbers, overflow: TextOverflow.ellipsis),
                  ),
                ],
                selected: {_mode},
                onSelectionChanged: (s) => setState(() {
                  _mode = s.first;
                  _error = null;
                }),
              ),
              const SizedBox(height: 16),
              _previewBox(l, info),
              const SizedBox(height: 16),
              if (_mode == _Mode.text) ..._textOptions(l) else ..._numberOptions(l, info),
            ],
            if (_error != null) PdfInlineError(message: _error!),
          ],
        ],
      ),
    );
  }

  Widget _previewBox(AppLocalizations l, PdfDocInfo info) {
    final geom = info.pages.first;
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(l.watermarkPdfPreview, style: theme.textTheme.labelLarge),
        const SizedBox(height: 8),
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 320),
          child: AspectRatio(
            aspectRatio: geom.visualAspect,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Color(0x33000000), blurRadius: 6, offset: Offset(0, 2))],
              ),
              child: ClipRect(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    if (_preview != null)
                      RawImage(image: _preview, fit: BoxFit.fill)
                    else
                      const Center(child: CircularProgressIndicator(color: _accent)),
                    RepaintBoundary(
                      child: CustomPaint(
                        painter: _StampPreviewPainter(
                          pageSizePt: geom.visualSize,
                          mode: _mode,
                          text: _text.text.trim(),
                          fontSizePt: _fontSize,
                          opacity: _opacity,
                          layout: _layout,
                          color: _colors[_colorIndex],
                          numberLabel: formatPageNumber(
                            _style,
                            index: 0,
                            pageCount: info.pageCount,
                            start: _start,
                            pageWord: l.watermarkPdfPageLabel,
                          ),
                          position: _position,
                          direction: Directionality.of(context),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _textOptions(AppLocalizations l) {
    final theme = Theme.of(context);
    final colorNames = [
      l.watermarkPdfColorGrey,
      l.watermarkPdfColorRed,
      l.watermarkPdfColorBlue,
      l.watermarkPdfColorBlack,
      l.watermarkPdfColorGreen,
    ];
    return [
      TextField(
        controller: _text,
        maxLength: 60,
        textCapitalization: TextCapitalization.characters,
        decoration: InputDecoration(
          labelText: l.watermarkPdfText,
          border: const OutlineInputBorder(),
        ),
      ),
      _SliderRow(
        label: l.watermarkPdfSize,
        value: _fontSize,
        min: 16,
        max: 120,
        display: '${_fontSize.round()}',
        onChanged: (v) => setState(() => _fontSize = v),
      ),
      _SliderRow(
        label: l.watermarkPdfOpacity,
        value: _opacity,
        min: 0.05,
        max: 1,
        display: '${(_opacity * 100).round()}%',
        onChanged: (v) => setState(() => _opacity = v),
      ),
      const SizedBox(height: 8),
      Text(l.watermarkPdfLayout, style: theme.textTheme.labelLarge),
      const SizedBox(height: 6),
      Wrap(
        spacing: 8,
        runSpacing: 4,
        children: [
          for (final (layout, label, icon) in [
            (WatermarkLayout.diagonal, l.watermarkPdfDiagonal, Icons.north_east_rounded),
            (WatermarkLayout.center, l.watermarkPdfCenter, Icons.format_align_center_rounded),
            (WatermarkLayout.tiled, l.watermarkPdfTiled, Icons.grid_view_rounded),
          ])
            ChoiceChip(
              avatar: Icon(icon, size: 18),
              label: Text(label),
              selected: _layout == layout,
              onSelected: (_) => setState(() => _layout = layout),
            ),
        ],
      ),
      const SizedBox(height: 12),
      Text(l.watermarkPdfColor, style: theme.textTheme.labelLarge),
      const SizedBox(height: 6),
      Wrap(
        spacing: 4,
        children: [
          for (var i = 0; i < _colors.length; i++)
            Semantics(
              button: true,
              selected: _colorIndex == i,
              label: colorNames[i],
              child: InkResponse(
                onTap: () => setState(() => _colorIndex = i),
                radius: 26,
                child: SizedBox.square(
                  dimension: 48,
                  child: Center(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: _colors[i],
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: _colorIndex == i ? theme.colorScheme.onSurface : Colors.transparent,
                          width: 3,
                        ),
                      ),
                      child: _colorIndex == i
                          ? const Icon(Icons.check_rounded, color: Colors.white, size: 18)
                          : null,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    ];
  }

  List<Widget> _numberOptions(AppLocalizations l, PdfDocInfo info) {
    final theme = Theme.of(context);
    final last = _start + info.pageCount - 1;
    return [
      Text(l.watermarkPdfFormat, style: theme.textTheme.labelLarge),
      const SizedBox(height: 6),
      Wrap(
        spacing: 8,
        runSpacing: 4,
        children: [
          for (final (style, label) in [
            (PageNumberStyle.plain, '$_start'),
            (PageNumberStyle.word, l.watermarkPdfPageLabel('$_start')),
            (PageNumberStyle.ofTotal, '$_start / $last'),
          ])
            ChoiceChip(
              label: Text(label),
              selected: _style == style,
              onSelected: (_) => setState(() => _style = style),
            ),
        ],
      ),
      const SizedBox(height: 12),
      Text(l.watermarkPdfPosition, style: theme.textTheme.labelLarge),
      const SizedBox(height: 6),
      Wrap(
        spacing: 8,
        runSpacing: 4,
        children: [
          for (final (pos, label, icon) in [
            (PageNumberPosition.bottomCenter, l.watermarkPdfBottomCenter, Icons.vertical_align_bottom_rounded),
            (PageNumberPosition.bottomRight, l.watermarkPdfBottomRight, Icons.south_east_rounded),
            (PageNumberPosition.topRight, l.watermarkPdfTopRight, Icons.north_east_rounded),
          ])
            ChoiceChip(
              avatar: Icon(icon, size: 18),
              label: Text(label),
              selected: _position == pos,
              onSelected: (_) => setState(() => _position = pos),
            ),
        ],
      ),
      const SizedBox(height: 12),
      Row(
        children: [
          Expanded(child: Text(l.watermarkPdfStartAt, style: theme.textTheme.labelLarge)),
          IconButton.filledTonal(
            tooltip: l.watermarkPdfDecrease,
            onPressed: _start > 1 ? () => setState(() => _start--) : null,
            icon: const Icon(Icons.remove_rounded),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 56),
            child: Text(
              '$_start',
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
            ),
          ),
          IconButton.filledTonal(
            tooltip: l.watermarkPdfIncrease,
            onPressed: _start < 9999 ? () => setState(() => _start++) : null,
            icon: const Icon(Icons.add_rounded),
          ),
        ],
      ),
    ];
  }
}

class _SliderRow extends StatelessWidget {
  const _SliderRow({
    required this.label,
    required this.value,
    required this.min,
    required this.max,
    required this.display,
    required this.onChanged,
  });

  final String label;
  final double value;
  final double min;
  final double max;
  final String display;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 3, child: Text(label)),
        Expanded(
          flex: 7,
          child: Slider(
            value: value.clamp(min, max),
            min: min,
            max: max,
            label: display,
            semanticFormatterCallback: (_) => display,
            onChanged: onChanged,
          ),
        ),
        SizedBox(width: 44, child: Text(display, textAlign: TextAlign.end)),
      ],
    );
  }
}

/// Paints the watermark / page number over the page-1 preview, using the
/// same geometry as the PDF writer (sizes in points scaled to the preview).
class _StampPreviewPainter extends CustomPainter {
  _StampPreviewPainter({
    required this.pageSizePt,
    required this.mode,
    required this.text,
    required this.fontSizePt,
    required this.opacity,
    required this.layout,
    required this.color,
    required this.numberLabel,
    required this.position,
    required this.direction,
  });

  final Size pageSizePt;
  final _Mode mode;
  final String text;
  final double fontSizePt;
  final double opacity;
  final WatermarkLayout layout;
  final Color color;
  final String numberLabel;
  final PageNumberPosition position;
  final TextDirection direction;

  @override
  void paint(Canvas canvas, Size size) {
    if (pageSizePt.width <= 0) return;
    final s = size.width / pageSizePt.width;
    if (mode == _Mode.numbers) {
      final tp = _tp(numberLabel, pageNumberFontSize * s, _numberColor, false);
      final labelPt = Size(tp.width / s, tp.height / s);
      final c = pageNumberCenter(pageSizePt, labelPt, position) * s;
      tp.paint(canvas, c - Offset(tp.width / 2, tp.height / 2));
      tp.dispose();
      return;
    }
    if (text.isEmpty) return;
    final tp = _tp(text, fontSizePt * s, color.withValues(alpha: opacity), true);
    final centre = Offset(size.width / 2, size.height / 2);
    void stampAt(Offset c) => tp.paint(canvas, c - Offset(tp.width / 2, tp.height / 2));
    switch (layout) {
      case WatermarkLayout.center:
        stampAt(centre);
      case WatermarkLayout.diagonal:
        canvas.save();
        canvas.translate(centre.dx, centre.dy);
        canvas.rotate(-diagonalAngleDegrees(pageSizePt.width, pageSizePt.height) * math.pi / 180);
        stampAt(Offset.zero);
        canvas.restore();
      case WatermarkLayout.tiled:
        canvas.save();
        canvas.translate(centre.dx, centre.dy);
        canvas.rotate(-tiledAngleDegrees * math.pi / 180);
        final stampPt = Size(tp.width / s, tp.height / s);
        for (final c in tilePositions(pageSizePt, stampPt)) {
          stampAt(c * s);
        }
        canvas.restore();
    }
    tp.dispose();
  }

  TextPainter _tp(String t, double size, Color c, bool bold) => TextPainter(
    text: TextSpan(
      text: t,
      style: TextStyle(
        fontSize: size,
        color: c,
        fontWeight: bold ? FontWeight.w700 : FontWeight.w400,
        height: 1.15,
      ),
    ),
    textDirection: direction,
    maxLines: 1,
  )..layout();

  @override
  bool shouldRepaint(_StampPreviewPainter o) =>
      o.pageSizePt != pageSizePt ||
      o.mode != mode ||
      o.text != text ||
      o.fontSizePt != fontSizePt ||
      o.opacity != opacity ||
      o.layout != layout ||
      o.color != color ||
      o.numberLabel != numberLabel ||
      o.position != position ||
      o.direction != direction;
}
