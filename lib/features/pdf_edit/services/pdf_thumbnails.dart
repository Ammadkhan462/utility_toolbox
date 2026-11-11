import 'dart:async';
import 'dart:collection';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:printing/printing.dart';

/// Renders small page previews on demand, in batches, and keeps a bounded
/// number of them in memory (LRU). Built for 200+ page files on low-end
/// phones: only pages that are actually on screen get rendered, at a low
/// DPI, and old ones are released.
///
/// Images handed out are clones; whoever receives one must dispose it.
class PdfThumbnailCache {
  PdfThumbnailCache(this._bytes, {this.dpi = 36, this.maxEntries = 48, this.batchSize = 8});

  final Uint8List _bytes;
  final double dpi;
  final int maxEntries;
  final int batchSize;

  final LinkedHashMap<int, ui.Image> _images = LinkedHashMap();
  final Map<int, Completer<void>> _waiting = {};
  final List<int> _queue = [];
  bool _running = false;
  bool _disposed = false;

  /// A clone of the cached image for [page], or null if not rendered yet.
  ui.Image? peek(int page) {
    final img = _images.remove(page);
    if (img == null) return null;
    _images[page] = img; // mark as recently used
    return img.clone();
  }

  /// Renders [page] (0-based) if needed and returns a clone, or null if the
  /// cache was disposed or rendering failed.
  Future<ui.Image?> load(int page) async {
    final hit = peek(page);
    if (hit != null) return hit;
    final completer = _waiting.putIfAbsent(page, () {
      _queue.add(page);
      return Completer<void>();
    });
    _pump();
    await completer.future;
    if (_disposed) return null;
    return peek(page);
  }

  /// The widget for [page] went off screen before its turn: skip it.
  void cancel(int page) {
    if (_queue.remove(page)) {
      _waiting.remove(page)?.complete();
    }
  }

  Future<void> _pump() async {
    if (_running || _disposed) return;
    _running = true;
    try {
      while (_queue.isNotEmpty && !_disposed) {
        // Newest requests first: those are the pages the user is looking at.
        final batch = <int>[];
        while (batch.length < batchSize && _queue.isNotEmpty) {
          batch.add(_queue.removeLast());
        }
        batch.sort();
        var i = 0;
        try {
          await for (final raster in Printing.raster(_bytes, pages: batch, dpi: dpi)) {
            final page = batch[i++];
            final image = await raster.toImage();
            if (_disposed) {
              image.dispose();
              break;
            }
            _store(page, image);
            _waiting.remove(page)?.complete();
          }
        } catch (e) {
          debugPrint('Thumbnail render failed: $e');
        }
        // Anything in the batch that didn't come back: let waiters move on.
        for (final page in batch) {
          _waiting.remove(page)?.complete();
        }
      }
    } finally {
      _running = false;
    }
  }

  void _store(int page, ui.Image image) {
    _images.remove(page)?.dispose();
    _images[page] = image;
    while (_images.length > maxEntries) {
      final oldest = _images.keys.first;
      _images.remove(oldest)?.dispose();
    }
  }

  void dispose() {
    _disposed = true;
    _queue.clear();
    for (final c in _waiting.values) {
      if (!c.isCompleted) c.complete();
    }
    _waiting.clear();
    for (final img in _images.values) {
      img.dispose();
    }
    _images.clear();
  }
}

/// A page preview: white paper with the rendered page once ready.
/// [aspect] is the page's displayed width / height; [quarterTurns] rotates
/// the preview (e.g. pages rotated in Organize).
class PdfPageThumb extends StatefulWidget {
  const PdfPageThumb({
    super.key,
    required this.cache,
    required this.page,
    required this.aspect,
    this.quarterTurns = 0,
    this.borderRadius = 6,
    this.overlay,
  });

  final PdfThumbnailCache cache;
  final int page;
  final double aspect;
  final int quarterTurns;
  final double borderRadius;

  /// Painted on top of the page, inside the (unrotated) page box.
  final Widget? overlay;

  @override
  State<PdfPageThumb> createState() => _PdfPageThumbState();
}

class _PdfPageThumbState extends State<PdfPageThumb> {
  ui.Image? _image;

  @override
  void initState() {
    super.initState();
    _fetch();
  }

  @override
  void didUpdateWidget(PdfPageThumb old) {
    super.didUpdateWidget(old);
    if (old.page != widget.page || old.cache != widget.cache) {
      old.cache.cancel(old.page);
      _image?.dispose();
      _image = null;
      _fetch();
    }
  }

  Future<void> _fetch() async {
    final page = widget.page;
    final cache = widget.cache;
    final quick = cache.peek(page);
    if (quick != null) {
      _image = quick;
      return;
    }
    final img = await cache.load(page);
    if (!mounted || page != widget.page || cache != widget.cache) {
      img?.dispose();
      return;
    }
    setState(() => _image = img);
  }

  @override
  void dispose() {
    widget.cache.cancel(widget.page);
    _image?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final turns = widget.quarterTurns % 4;
    final aspect = turns.isOdd ? 1 / widget.aspect : widget.aspect;
    final page = AspectRatio(
      aspectRatio: widget.aspect,
      child: Stack(
        fit: StackFit.expand,
        children: [
          const ColoredBox(color: Colors.white),
          if (_image == null)
            const Center(
              child: SizedBox.square(
                dimension: 18,
                child: CircularProgressIndicator(strokeWidth: 2, color: Colors.black26),
              ),
            )
          else
            RawImage(image: _image, fit: BoxFit.fill, filterQuality: FilterQuality.medium),
          if (widget.overlay != null) widget.overlay!,
        ],
      ),
    );
    return Center(
      child: AspectRatio(
        aspectRatio: aspect,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            boxShadow: const [
              BoxShadow(color: Color(0x33000000), blurRadius: 4, offset: Offset(0, 1)),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            child: RotatedBox(quarterTurns: turns, child: page),
          ),
        ),
      ),
    );
  }
}

/// Renders a single page at a higher DPI for the big previews (sign
/// placement, watermark preview). Returns null on failure.
Future<ui.Image?> renderPagePreview(Uint8List bytes, int page, {double dpi = 96}) async {
  try {
    await for (final raster in Printing.raster(bytes, pages: [page], dpi: dpi)) {
      return await raster.toImage();
    }
  } catch (e) {
    debugPrint('Page preview failed: $e');
  }
  return null;
}
