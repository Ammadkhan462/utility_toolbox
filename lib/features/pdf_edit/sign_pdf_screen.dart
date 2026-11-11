import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/features/pdf_edit/logic/pdf_geometry.dart';
import 'package:utility_toolbox/features/pdf_edit/services/pdf_edit_engine.dart';
import 'package:utility_toolbox/features/pdf_edit/services/pdf_thumbnails.dart';
import 'package:utility_toolbox/features/pdf_edit/signature/signature_pad.dart';
import 'package:utility_toolbox/features/pdf_edit/widgets/pdf_edit_widgets.dart';
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';

const _accent = Color(0xFF7C6FFF);

/// Draw a signature, place it on one or more pages, save a signed copy.
class SignPdfScreen extends StatefulWidget {
  const SignPdfScreen({super.key, this.initialPath});

  final String? initialPath;

  @override
  State<SignPdfScreen> createState() => _SignPdfScreenState();
}

class _SignPdfScreenState extends State<SignPdfScreen> {
  final _engine = const PdfEditEngine();
  final _store = const SignatureStore();

  String? _path;
  Uint8List? _bytes;
  PdfDocInfo? _info;
  PdfThumbnailCache? _thumbs;
  bool _loading = false;
  bool _working = false;
  String? _error;
  File? _result;

  SignatureImage? _signature;
  SignatureImage? _saved;

  /// Page index → signature box in 0..1 fractions of the displayed page.
  final Map<int, Rect> _placements = {};
  Rect? _lastRect;

  @override
  void initState() {
    super.initState();
    _loadSaved();
    if (widget.initialPath != null) _load(widget.initialPath!);
  }

  @override
  void dispose() {
    _thumbs?.dispose();
    super.dispose();
  }

  Future<void> _loadSaved() async {
    final saved = await _store.load();
    if (!mounted) return;
    setState(() {
      _saved = saved;
      _signature ??= saved;
    });
  }

  Future<void> _pick() async {
    final path = await pickPdfFile();
    if (path != null && mounted) await _load(path);
  }

  Future<void> _load(String path) async {
    _thumbs?.dispose();
    setState(() {
      _path = path;
      _bytes = null;
      _info = null;
      _thumbs = null;
      _result = null;
      _error = null;
      _placements.clear();
      _lastRect = null;
      _loading = true;
    });
    try {
      final opened = await _engine.open(path);
      if (!mounted) return;
      setState(() {
        _bytes = opened.bytes;
        _info = opened.info;
        if (!opened.info.encrypted) _thumbs = PdfThumbnailCache(opened.bytes);
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => _error = AppLocalizations.of(context).pdfEditInvalidPdf);
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<SignatureImage?> _draw() async {
    final sig = await Navigator.of(context).push<SignatureImage>(
      MaterialPageRoute(fullscreenDialog: true, builder: (_) => const _SignatureDrawPage()),
    );
    if (sig == null || !mounted) return null;
    _setSignature(sig);
    // The draw page saved it if the user asked; refresh what's stored.
    final saved = await _store.load();
    if (!mounted) return sig;
    setState(() {
      // Same ink as what was just drawn → treat it as the same signature.
      _saved = saved != null && listEquals(saved.png, sig.png) ? sig : saved;
    });
    return sig;
  }

  void _setSignature(SignatureImage sig) {
    final info = _info;
    setState(() {
      _signature = sig;
      if (info == null) return;
      // Keep each box's centre and width; the height follows the new ink.
      for (final e in _placements.entries.toList()) {
        _placements[e.key] = signatureRect(
          center: e.value.center,
          widthFraction: e.value.width,
          imageAspect: sig.aspect,
          pageAspect: info.pages[e.key].visualAspect,
        );
      }
    });
  }

  Future<void> _deleteSaved() async {
    final l = AppLocalizations.of(context);
    final messenger = ScaffoldMessenger.of(context);
    await _store.delete();
    if (!mounted) return;
    setState(() {
      if (identical(_signature, _saved)) _signature = null;
      _saved = null;
    });
    messenger.showSnackBar(SnackBar(content: Text(l.signPdfSavedDeleted)));
  }

  Future<void> _openPage(int page) async {
    final info = _info;
    final bytes = _bytes;
    if (info == null || bytes == null) return;
    final sig = _signature ?? await _draw();
    if (sig == null || !mounted) return;
    final geom = info.pages[page];
    final start = _placements[page] ??
        (_lastRect == null
            ? signatureRect(
                center: const Offset(0.68, 0.84),
                widthFraction: 0.32,
                imageAspect: sig.aspect,
                pageAspect: geom.visualAspect,
              )
            : signatureRect(
                center: _lastRect!.center,
                widthFraction: _lastRect!.width,
                imageAspect: sig.aspect,
                pageAspect: geom.visualAspect,
              ));
    final outcome = await Navigator.of(context).push<_PlacementOutcome>(
      MaterialPageRoute(
        builder: (_) => _PlacementPage(
          bytes: bytes,
          page: page,
          geom: geom,
          signature: sig,
          initial: start,
          canRemove: _placements.containsKey(page),
        ),
      ),
    );
    if (outcome == null || !mounted) return;
    setState(() {
      if (outcome.rect == null) {
        _placements.remove(page);
      } else {
        _placements[page] = outcome.rect!;
        _lastRect = outcome.rect;
      }
      _error = null;
    });
  }

  void _applyToAll() {
    final info = _info;
    final sig = _signature;
    final ref = _lastRect;
    if (info == null || sig == null || ref == null) return;
    setState(() {
      for (var i = 0; i < info.pageCount; i++) {
        _placements[i] = signatureRect(
          center: ref.center,
          widthFraction: ref.width,
          imageAspect: sig.aspect,
          pageAspect: info.pages[i].visualAspect,
        );
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(AppLocalizations.of(context).signPdfAllPagesDone(info.pageCount))),
    );
  }

  Future<void> _save() async {
    final l = AppLocalizations.of(context);
    final bytes = _bytes;
    final sig = _signature;
    final path = _path;
    if (bytes == null || sig == null || path == null) return;
    if (_placements.isEmpty) {
      setState(() => _error = l.signPdfNoPlacement);
      return;
    }
    setState(() {
      _working = true;
      _error = null;
    });
    try {
      final file = await _engine.sign(
        pdf: bytes,
        signaturePng: sig.png,
        placements: [
          for (final e in _placements.entries) SignPlacement(e.key, e.value),
        ],
        sourcePath: path,
      );
      if (!mounted) return;
      setState(() => _result = file);
    } catch (_) {
      if (!mounted) return;
      setState(() => _error = l.signPdfFailed);
    } finally {
      if (mounted) setState(() => _working = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final info = _info;
    final ready = info != null && !info.encrypted && _thumbs != null;
    final result = _result;

    final header = <Widget>[
      if (result != null)
        PdfEditResultCard(
          file: result,
          toolId: 'sign_pdf',
          accent: _accent,
          headline: l.signPdfResult,
          onReset: () => setState(() {
            _result = null;
            _placements.clear();
            _lastRect = null;
          }),
        )
      else ...[
        PdfStepHeader(step: 1, title: l.signPdfStepPdf, accent: _accent),
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
          PdfStepHeader(step: 2, title: l.signPdfStepSignature, accent: _accent),
          _signatureCard(l),
          PdfStepHeader(step: 3, title: l.signPdfStepPlace, accent: _accent),
          _placementSummary(l, info),
        ],
        if (_error != null) PdfInlineError(message: _error!),
      ],
    ];

    return ToolScaffold(
      title: l.toolSignPdfTitle,
      accentColor: _accent,
      bottomBar: ready && result == null
          ? Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
              child: PdfActionButton(
                label: l.signPdfSave,
                icon: Icons.draw_rounded,
                busy: _working,
                onPressed: _save,
              ),
            )
          : null,
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
            sliver: SliverList(delegate: SliverChildListDelegate(header)),
          ),
          if (ready && result == null)
            SliverPadding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 24),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 130,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.66,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, i) => _pageTile(l, info, i),
                  childCount: info.pageCount,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _signatureCard(AppLocalizations l) {
    final sig = _signature;
    final saved = _saved;
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (sig != null)
              Semantics(
                image: true,
                label: l.signPdfSignatureLabel,
                child: Container(
                  height: 96,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: theme.colorScheme.outlineVariant),
                  ),
                  child: Image.memory(sig.png, fit: BoxFit.contain, gaplessPlayback: true),
                ),
              ),
            if (sig != null) const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: [
                if (sig == null)
                  FilledButton.icon(
                    onPressed: _draw,
                    icon: const Icon(Icons.gesture_rounded),
                    label: Text(l.signPdfDraw),
                  )
                else
                  OutlinedButton.icon(
                    onPressed: _draw,
                    icon: const Icon(Icons.gesture_rounded),
                    label: Text(l.signPdfDrawAgain),
                  ),
                if (saved != null && !identical(sig, saved))
                  OutlinedButton.icon(
                    onPressed: () => _setSignature(saved),
                    icon: const Icon(Icons.history_rounded),
                    label: Text(l.signPdfUseSaved),
                  ),
                if (saved != null)
                  IconButton(
                    tooltip: l.signPdfDeleteSaved,
                    constraints: const BoxConstraints(minWidth: 48, minHeight: 48),
                    onPressed: _deleteSaved,
                    icon: const Icon(Icons.delete_outline_rounded),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _placementSummary(AppLocalizations l, PdfDocInfo info) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          l.signPdfPlacedCount(_placements.length),
          style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        ),
        if (_lastRect != null && info.pageCount > 1) ...[
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              OutlinedButton.icon(
                onPressed: _applyToAll,
                icon: const Icon(Icons.copy_all_rounded),
                label: Text(l.signPdfAllPages),
              ),
              if (_placements.isNotEmpty)
                TextButton.icon(
                  style: TextButton.styleFrom(minimumSize: const Size(64, 48)),
                  onPressed: () => setState(() {
                    _placements.clear();
                    _lastRect = null;
                  }),
                  icon: const Icon(Icons.layers_clear_rounded),
                  label: Text(l.signPdfClearAll),
                ),
            ],
          ),
        ],
      ],
    );
  }

  Widget _pageTile(AppLocalizations l, PdfDocInfo info, int i) {
    final rect = _placements[i];
    final sig = _signature;
    final theme = Theme.of(context);
    final highlighted = rect != null;
    return Semantics(
      button: true,
      selected: highlighted,
      label: l.pdfEditPageN(i + 1),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => _openPage(i),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: PdfPageThumb(
                        cache: _thumbs!,
                        page: i,
                        aspect: info.pages[i].visualAspect,
                        overlay: rect != null && sig != null
                            ? LayoutBuilder(
                                builder: (_, c) {
                                  final r = denormalizeRect(rect, c.biggest);
                                  return Stack(
                                    children: [
                                      Positioned.fromRect(
                                        rect: r,
                                        child: Image.memory(
                                          sig.png,
                                          fit: BoxFit.fill,
                                          gaplessPlayback: true,
                                          cacheWidth: 240,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              )
                            : null,
                      ),
                    ),
                  ),
                  if (highlighted)
                    PositionedDirectional(
                      top: 0,
                      end: 0,
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: _accent,
                        child: const Icon(Icons.check_rounded, size: 16, color: Colors.white),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${i + 1}',
              style: theme.textTheme.labelMedium?.copyWith(
                fontWeight: highlighted ? FontWeight.w800 : FontWeight.w500,
                color: highlighted ? _accent : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Drawing page ─────────────────────────────────────────────────────────

class _SignatureDrawPage extends StatefulWidget {
  const _SignatureDrawPage();

  @override
  State<_SignatureDrawPage> createState() => _SignatureDrawPageState();
}

class _SignatureDrawPageState extends State<_SignatureDrawPage> {
  static const _black = Color(0xFF111111);
  static const _blue = Color(0xFF1A3FB8);

  final _controller = SignatureController();
  bool _remember = true;
  bool _busy = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _done() async {
    final l = AppLocalizations.of(context);
    if (_controller.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l.signPdfEmpty)));
      return;
    }
    setState(() => _busy = true);
    final sig = await _controller.toPng();
    if (sig != null && _remember) {
      try {
        await const SignatureStore().save(sig);
      } catch (_) {}
    }
    if (!mounted) return;
    setState(() => _busy = false);
    if (sig != null) Navigator.of(context).pop(sig);
  }

  void _setColor(Color c) {
    setState(() => _controller.color = c);
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final theme = Theme.of(context).copyWith(
      colorScheme: Theme.of(context).colorScheme.copyWith(primary: _accent),
    );
    return Theme(
      data: theme,
      child: Scaffold(
        appBar: AppBar(
          title: Text(l.signPdfDrawTitle),
          actions: [
            ListenableBuilder(
              listenable: _controller,
              builder: (_, _) => IconButton(
                tooltip: l.signPdfUndo,
                onPressed: _controller.isEmpty ? null : _controller.undo,
                icon: const Icon(Icons.undo_rounded),
              ),
            ),
            ListenableBuilder(
              listenable: _controller,
              builder: (_, _) => IconButton(
                tooltip: l.commonClear,
                onPressed: _controller.isEmpty ? null : _controller.clear,
                icon: const Icon(Icons.delete_sweep_rounded),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: _accent.withValues(alpha: 0.5), width: 1.5),
                    ),
                    child: SignaturePad(controller: _controller, hint: l.signPdfDrawHint),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _InkChoice(
                      color: _black,
                      label: l.signPdfInkBlack,
                      selected: _controller.color == _black,
                      onTap: () => _setColor(_black),
                    ),
                    const SizedBox(width: 8),
                    _InkChoice(
                      color: _blue,
                      label: l.signPdfInkBlue,
                      selected: _controller.color == _blue,
                      onTap: () => _setColor(_blue),
                    ),
                  ],
                ),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(l.signPdfRemember),
                  value: _remember,
                  onChanged: (v) => setState(() => _remember = v),
                ),
                PdfActionButton(
                  label: l.signPdfDone,
                  icon: Icons.check_rounded,
                  busy: _busy,
                  onPressed: _done,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _InkChoice extends StatelessWidget {
  const _InkChoice({
    required this.color,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final Color color;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      avatar: CircleAvatar(backgroundColor: color, radius: 9),
      label: Text(label),
      selected: selected,
      onSelected: (_) => onTap(),
      materialTapTargetSize: MaterialTapTargetSize.padded,
    );
  }
}

// ── Placement page ───────────────────────────────────────────────────────

/// What the placement page hands back: a box, or null rect = remove.
class _PlacementOutcome {
  const _PlacementOutcome(this.rect);

  final Rect? rect;
}

class _PlacementPage extends StatefulWidget {
  const _PlacementPage({
    required this.bytes,
    required this.page,
    required this.geom,
    required this.signature,
    required this.initial,
    required this.canRemove,
  });

  final Uint8List bytes;
  final int page;
  final PageGeom geom;
  final SignatureImage signature;
  final Rect initial;
  final bool canRemove;

  @override
  State<_PlacementPage> createState() => _PlacementPageState();
}

class _PlacementPageState extends State<_PlacementPage> {
  static const _minWidth = 0.06;
  static const _maxWidth = 0.95;

  ui.Image? _preview;
  bool _failed = false;
  late Rect _rect = widget.initial;
  double _scaleStartWidth = 0;

  double get _pageAspect => widget.geom.visualAspect;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_preview == null && !_failed) _render();
  }

  bool _rendering = false;

  Future<void> _render() async {
    if (_rendering) return;
    _rendering = true;
    final mq = MediaQuery.of(context);
    // Sharp on this screen, but never huge: ≤ 1400 px wide.
    final targetPx = (mq.size.width * mq.devicePixelRatio).clamp(600.0, 1400.0);
    final widthPt = widget.geom.visualSize.width;
    final dpi = (targetPx / (widthPt <= 0 ? 595 : widthPt) * 72).clamp(36.0, 200.0);
    final img = await renderPagePreview(widget.bytes, widget.page, dpi: dpi);
    if (!mounted) {
      img?.dispose();
      return;
    }
    setState(() {
      _preview = img;
      _failed = img == null;
    });
  }

  @override
  void dispose() {
    _preview?.dispose();
    super.dispose();
  }

  void _resizeTo(double width) {
    setState(() {
      _rect = signatureRect(
        center: _rect.center,
        widthFraction: width.clamp(_minWidth, _maxWidth),
        imageAspect: widget.signature.aspect,
        pageAspect: _pageAspect,
      );
    });
  }

  void _moveCenterTo(Offset fraction) {
    setState(() {
      _rect = clampUnitRect(_rect.shift(fraction - _rect.center));
    });
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final theme = Theme.of(context).copyWith(
      colorScheme: Theme.of(context).colorScheme.copyWith(primary: _accent),
    );
    return Theme(
      data: theme,
      child: Scaffold(
        appBar: AppBar(
          title: Text(l.pdfEditPageN(widget.page + 1)),
          actions: [
            if (widget.canRemove)
              IconButton(
                tooltip: l.signPdfRemoveFromPage,
                onPressed: () => Navigator.of(context).pop(const _PlacementOutcome(null)),
                icon: const Icon(Icons.delete_outline_rounded),
              ),
          ],
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                child: Text(
                  l.signPdfPlaceHint,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodySmall,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Center(
                    child: AspectRatio(
                      aspectRatio: _pageAspect,
                      child: LayoutBuilder(builder: (context, c) => _pageCanvas(l, c.biggest)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                child: Row(
                  children: [
                    const Icon(Icons.photo_size_select_small_rounded),
                    const SizedBox(width: 8),
                    Text(l.signPdfSize),
                    Expanded(
                      child: Slider(
                        value: _rect.width.clamp(_minWidth, _maxWidth),
                        min: _minWidth,
                        max: _maxWidth,
                        label: l.signPdfSize,
                        onChanged: _resizeTo,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 16),
                child: PdfActionButton(
                  label: l.signPdfPlaceConfirm,
                  icon: Icons.check_rounded,
                  onPressed: () {
                    HapticFeedback.selectionClick();
                    Navigator.of(context).pop(_PlacementOutcome(_rect));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _pageCanvas(AppLocalizations l, Size size) {
    final box = denormalizeRect(_rect, size);
    // The whole page takes the gestures, so even a small signature is easy
    // to move (one finger) or resize (two fingers); a tap moves it there.
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapUp: (d) => _moveCenterTo(
        Offset(d.localPosition.dx / size.width, d.localPosition.dy / size.height),
      ),
      onScaleStart: (_) => _scaleStartWidth = _rect.width,
      onScaleUpdate: (d) {
        final delta = Offset(
          d.focalPointDelta.dx / size.width,
          d.focalPointDelta.dy / size.height,
        );
        setState(() {
          var next = _rect.shift(delta);
          if (d.pointerCount > 1) {
            next = signatureRect(
              center: next.center,
              widthFraction: (_scaleStartWidth * d.scale).clamp(_minWidth, _maxWidth),
              imageAspect: widget.signature.aspect,
              pageAspect: _pageAspect,
            );
          }
          _rect = clampUnitRect(next);
        });
      },
      child: Stack(
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Color(0x44000000), blurRadius: 8)],
              ),
              child: _preview != null
                  ? RawImage(image: _preview, fit: BoxFit.fill)
                  : _failed
                  ? Center(
                      child: Text(
                        l.pdfEditPreviewFailed,
                        style: const TextStyle(color: Colors.black54),
                      ),
                    )
                  : const Center(child: CircularProgressIndicator(color: _accent)),
            ),
          ),
          Positioned.fromRect(
            rect: box,
            child: Semantics(
              label: l.signPdfSignatureLabel,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(color: _accent, width: 1.5),
                  color: _accent.withValues(alpha: 0.06),
                ),
                child: Image.memory(widget.signature.png, fit: BoxFit.fill, gaplessPlayback: true),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
