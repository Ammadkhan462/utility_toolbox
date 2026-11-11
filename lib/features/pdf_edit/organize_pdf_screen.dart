import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/services.dart';
import 'package:utility_toolbox/core/widgets/tool_scaffold.dart';
import 'package:utility_toolbox/features/pdf_edit/logic/organize_model.dart';
import 'package:utility_toolbox/features/pdf_edit/services/pdf_edit_engine.dart';
import 'package:utility_toolbox/features/pdf_edit/services/pdf_thumbnails.dart';
import 'package:utility_toolbox/features/pdf_edit/widgets/pdf_edit_widgets.dart';
import 'package:utility_toolbox/l10n/gen/app_localizations.dart';

const _accent = Color(0xFFFF8642);

/// Reorder (drag), rotate and delete pages, then save a new PDF.
class OrganizePdfScreen extends StatefulWidget {
  const OrganizePdfScreen({super.key, this.initialPath});

  final String? initialPath;

  @override
  State<OrganizePdfScreen> createState() => _OrganizePdfScreenState();
}

class _OrganizePdfScreenState extends State<OrganizePdfScreen> {
  final _engine = const PdfEditEngine();
  final _scroll = ScrollController();
  final _viewportKey = GlobalKey();

  String? _path;
  Uint8List? _bytes;
  PdfDocInfo? _info;
  PdfThumbnailCache? _thumbs;
  bool _loading = false;
  bool _working = false;
  String? _error;
  File? _result;

  List<OrgPage> _pages = const [];
  final Set<int> _selected = {};
  int? _dragging;
  Timer? _autoScroll;
  double _autoScrollSpeed = 0;

  @override
  void initState() {
    super.initState();
    if (widget.initialPath != null) _load(widget.initialPath!);
  }

  @override
  void dispose() {
    _autoScroll?.cancel();
    _scroll.dispose();
    _thumbs?.dispose();
    super.dispose();
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
      _pages = const [];
      _selected.clear();
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
        if (!opened.info.encrypted) {
          _thumbs = PdfThumbnailCache(opened.bytes);
          _pages = initialPages(opened.info.pageCount);
        }
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => _error = AppLocalizations.of(context).pdfEditInvalidPdf);
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  void _toggle(int source) {
    HapticFeedback.selectionClick();
    setState(() {
      if (!_selected.remove(source)) _selected.add(source);
    });
  }

  void _rotate(int by) {
    setState(() => _pages = rotatePages(_pages, _selected, by));
  }

  void _delete() {
    final l = AppLocalizations.of(context);
    if (_selected.length >= _pages.length) {
      setState(() => _error = l.organizePdfKeepOne);
      return;
    }
    final before = _pages;
    final beforeSelection = {..._selected};
    final count = _selected.length;
    setState(() {
      _pages = deletePages(_pages, _selected);
      _selected.clear();
      _error = null;
    });
    final messenger = ScaffoldMessenger.of(context)..hideCurrentSnackBar();
    messenger.showSnackBar(
      SnackBar(
        content: Text(l.organizePdfDeleted(count)),
        action: SnackBarAction(
          label: l.organizePdfUndo,
          onPressed: () {
            if (!mounted) return;
            setState(() {
              _pages = before;
              _selected
                ..clear()
                ..addAll(beforeSelection);
            });
          },
        ),
      ),
    );
  }

  void _move(int from, int to) {
    if (from == to) return;
    setState(() => _pages = movePage(_pages, from, to));
  }

  void _reset() {
    final info = _info;
    if (info == null) return;
    setState(() {
      _pages = initialPages(info.pageCount);
      _selected.clear();
      _error = null;
    });
  }

  // Auto-scroll while dragging near the top/bottom edge of the grid.
  void _onDragUpdate(DragUpdateDetails d) {
    final box = _viewportKey.currentContext?.findRenderObject() as RenderBox?;
    if (box == null || !box.hasSize) return;
    final local = box.globalToLocal(d.globalPosition);
    const edge = 72.0;
    double speed = 0;
    if (local.dy < edge) {
      speed = -(edge - local.dy) / edge * 14;
    } else if (local.dy > box.size.height - edge) {
      speed = (local.dy - (box.size.height - edge)) / edge * 14;
    }
    _autoScrollSpeed = speed;
    if (speed == 0) {
      _autoScroll?.cancel();
      _autoScroll = null;
    } else {
      _autoScroll ??= Timer.periodic(const Duration(milliseconds: 16), (_) {
        if (!_scroll.hasClients) return;
        final pos = _scroll.position;
        final next = (pos.pixels + _autoScrollSpeed).clamp(pos.minScrollExtent, pos.maxScrollExtent);
        if (next != pos.pixels) _scroll.jumpTo(next);
      });
    }
  }

  void _endDragIfActive() {
    if (_dragging != null || _autoScroll != null) _endDrag();
  }

  void _endDrag() {
    _autoScroll?.cancel();
    _autoScroll = null;
    if (mounted) setState(() => _dragging = null);
  }

  Future<void> _save() async {
    final l = AppLocalizations.of(context);
    final bytes = _bytes;
    final path = _path;
    final info = _info;
    if (bytes == null || path == null || info == null) return;
    if (isUnchanged(_pages, info.pageCount)) {
      setState(() => _error = l.organizePdfNoChanges);
      return;
    }
    setState(() {
      _working = true;
      _error = null;
    });
    try {
      final file = await _engine.organize(pdf: bytes, pages: _pages, sourcePath: path);
      if (!mounted) return;
      setState(() => _result = file);
    } catch (_) {
      if (!mounted) return;
      setState(() => _error = l.organizePdfFailed);
    } finally {
      if (mounted) setState(() => _working = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final info = _info;
    final result = _result;
    final ready = info != null && !info.encrypted && _thumbs != null && result == null;
    final allSelected = _pages.isNotEmpty && _selected.length == _pages.length;

    final header = <Widget>[
      if (result != null)
        PdfEditResultCard(
          file: result,
          toolId: 'organize_pdf',
          accent: _accent,
          headline: l.organizePdfResult,
          onReset: () => setState(() => _result = null),
        )
      else ...[
        const SizedBox(height: 8),
        PdfPickCard(
          path: _path,
          pageCount: info == null || info.encrypted ? null : _pages.length,
          loading: _loading,
          locked: info?.encrypted ?? false,
          onPick: _working ? null : _pick,
          accent: _accent,
        ),
        if (info != null && info.encrypted && _path != null) PdfLockedNotice(path: _path!),
        if (ready) ...[
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(Icons.touch_app_rounded, size: 20, color: theme.colorScheme.onSurfaceVariant),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  l.organizePdfHint,
                  style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                ),
              ),
            ],
          ),
        ],
        if (_error != null) PdfInlineError(message: _error!),
        const SizedBox(height: 12),
      ],
    ];

    return ToolScaffold(
      title: l.toolOrganizePdfTitle,
      accentColor: _accent,
      actions: [
        if (ready && !isUnchanged(_pages, info.pageCount))
          IconButton(
            tooltip: l.organizePdfReset,
            onPressed: _working ? null : _reset,
            icon: const Icon(Icons.restart_alt_rounded),
          ),
        if (ready)
          IconButton(
            tooltip: allSelected ? l.organizePdfClearSelection : l.organizePdfSelectAll,
            onPressed: () => setState(() {
              if (allSelected) {
                _selected.clear();
              } else {
                _selected.addAll(_pages.map((p) => p.source));
              }
            }),
            icon: Icon(allSelected ? Icons.deselect_rounded : Icons.select_all_rounded),
          ),
      ],
      bottomBar: ready ? _bottomBar(l) : null,
      // A drag can outlive its tile (scrolled away and disposed), so stop
      // auto-scrolling on any finger lift too.
      body: Listener(
        onPointerUp: (_) => _endDragIfActive(),
        onPointerCancel: (_) => _endDragIfActive(),
        child: CustomScrollView(
          key: _viewportKey,
          controller: _scroll,
          slivers: [
            SliverPadding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
              sliver: SliverList(delegate: SliverChildListDelegate(header)),
            ),
            if (ready)
              SliverPadding(
                padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 24),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 128,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.68,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, i) => _tile(l, info, i),
                    childCount: _pages.length,
                    findChildIndexCallback: (key) {
                      if (key is! ValueKey<int>) return null;
                      final idx = _pages.indexWhere((p) => p.source == key.value);
                      return idx < 0 ? null : idx;
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _bottomBar(AppLocalizations l) {
    final theme = Theme.of(context);
    final hasSelection = _selected.isNotEmpty;
    return Material(
      color: theme.colorScheme.surface.withValues(alpha: 0.96),
      elevation: 6,
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(12, 6, 12, 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AnimatedSize(
              duration: const Duration(milliseconds: 180),
              child: hasSelection
                  ? Row(
                      children: [
                        Expanded(
                          child: Text(
                            l.organizePdfSelected(_selected.length),
                            style: theme.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700),
                          ),
                        ),
                        _BarAction(
                          icon: Icons.rotate_left_rounded,
                          label: l.organizePdfRotateLeft,
                          onTap: () => _rotate(-1),
                        ),
                        _BarAction(
                          icon: Icons.rotate_right_rounded,
                          label: l.organizePdfRotateRight,
                          onTap: () => _rotate(1),
                        ),
                        _BarAction(
                          icon: Icons.delete_outline_rounded,
                          label: l.organizePdfDelete,
                          color: theme.colorScheme.error,
                          onTap: _delete,
                        ),
                        _BarAction(
                          icon: Icons.close_rounded,
                          label: l.organizePdfClearSelection,
                          onTap: () => setState(_selected.clear),
                        ),
                      ],
                    )
                  : const SizedBox(width: double.infinity),
            ),
            const SizedBox(height: 6),
            PdfActionButton(
              label: l.organizePdfSave,
              icon: Icons.save_rounded,
              busy: _working,
              onPressed: _save,
            ),
          ],
        ),
      ),
    );
  }

  Widget _tile(AppLocalizations l, PdfDocInfo info, int index) {
    final page = _pages[index];
    final source = page.source;
    final selected = _selected.contains(source);
    final geom = info.pages[source];
    final theme = Theme.of(context);

    Widget content() => Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              Positioned.fill(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: selected ? _accent : Colors.transparent,
                      width: 3,
                    ),
                    color: selected ? _accent.withValues(alpha: 0.12) : null,
                  ),
                  child: PdfPageThumb(
                    cache: _thumbs!,
                    page: source,
                    aspect: geom.visualAspect,
                    quarterTurns: page.turns,
                  ),
                ),
              ),
              if (selected)
                const PositionedDirectional(
                  top: 2,
                  end: 2,
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor: _accent,
                    child: Icon(Icons.check_rounded, size: 16, color: Colors.white),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 2),
        Text(
          '${index + 1}',
          style: theme.textTheme.labelMedium?.copyWith(
            fontWeight: selected ? FontWeight.w800 : FontWeight.w500,
            color: selected ? _accent : null,
          ),
        ),
      ],
    );

    return KeyedSubtree(
      key: ValueKey<int>(source),
      child: LayoutBuilder(
        builder: (context, constraints) => DragTarget<int>(
          onWillAcceptWithDetails: (d) {
            if (d.data == source) return false;
            final from = _pages.indexWhere((p) => p.source == d.data);
            final to = _pages.indexWhere((p) => p.source == source);
            if (from >= 0 && to >= 0) _move(from, to);
            return true;
          },
          onAcceptWithDetails: (_) => HapticFeedback.lightImpact(),
          builder: (context, _, _) => Semantics(
            button: true,
            selected: selected,
            label: l.pdfEditPageN(index + 1),
            customSemanticsActions: {
              if (index > 0)
                CustomSemanticsAction(label: l.organizePdfMoveEarlier): () =>
                    _move(index, index - 1),
              if (index < _pages.length - 1)
                CustomSemanticsAction(label: l.organizePdfMoveLater): () =>
                    _move(index, index + 1),
            },
            child: LongPressDraggable<int>(
              data: source,
              hapticFeedbackOnStart: true,
              onDragStarted: () => setState(() => _dragging = source),
              onDragUpdate: _onDragUpdate,
              onDragEnd: (_) => _endDrag(),
              onDraggableCanceled: (_, _) => _endDrag(),
              feedback: SizedBox(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                child: Material(
                  type: MaterialType.transparency,
                  child: Transform.scale(scale: 1.06, child: content()),
                ),
              ),
              childWhenDragging: Opacity(opacity: 0.25, child: content()),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () => _toggle(source),
                child: Opacity(opacity: _dragging == source ? 0.25 : 1, child: content()),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BarAction extends StatelessWidget {
  const _BarAction({required this.icon, required this.label, required this.onTap, this.color});

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: label,
      onPressed: onTap,
      color: color,
      constraints: const BoxConstraints(minWidth: 48, minHeight: 48),
      icon: Icon(icon),
    );
  }
}
