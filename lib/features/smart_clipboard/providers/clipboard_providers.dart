import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:utility_toolbox/features/smart_clipboard/models/clip_item.dart';

const _boxName = 'clipboard_items';
const _uuid    = Uuid();

// ── Filter ─────────────────────────────────────────────────────────────────

enum ClipFilter { all, pinned, urls, text, code }

final clipFilterProvider  = StateProvider<ClipFilter>((ref) => ClipFilter.all);
final clipSearchProvider  = StateProvider<String>((ref) => '');

// ── Notifier ───────────────────────────────────────────────────────────────

class ClipboardNotifier extends StateNotifier<List<ClipItem>> {
  ClipboardNotifier(this._box) : super([]) {
    _load();
  }

  final Box<Map> _box;

  // Reload from Hive and sort: pinned first, then newest first.
  void _load() {
    final items = _box.values
        .map(_fromMap)
        .toList()
      ..sort((a, b) {
        if (a.pinned != b.pinned) return a.pinned ? -1 : 1;
        return b.savedAt.compareTo(a.savedAt);
      });
    state = items;
  }

  /// Read from system clipboard and save.
  Future<ClipItem?> addFromClipboard() async {
    final data = await Clipboard.getData(Clipboard.kTextPlain);
    final text = data?.text?.trim();
    if (text == null || text.isEmpty) return null;
    return add(text);
  }

  /// Save an arbitrary string. Deduplicates by content.
  Future<ClipItem> add(String text) async {
    // Deduplication — return existing without re-adding
    final existing = state.cast<ClipItem?>().firstWhere(
      (c) => c?.content == text,
      orElse: () => null,
    );
    if (existing != null) {
      await copyToClipboard(existing);
      return existing;
    }

    final item = ClipItem(
      id:      _uuid.v4(),
      content: text,
      typeStr: ClipItem.detectType(text),
      savedAt: DateTime.now(),
    );

    await _box.put(item.id, _toMap(item));
    _load();
    return item;
  }

  Future<void> togglePin(ClipItem item) async {
    item.pinned = !item.pinned;
    await _box.put(item.id, _toMap(item));
    _load();
  }

  Future<void> updateLabel(ClipItem item, String label) async {
    item.label = label;
    await _box.put(item.id, _toMap(item));
    _load();
  }

  Future<void> delete(ClipItem item) async {
    await _box.delete(item.id);
    _load();
  }

  Future<void> clearAll({bool onlyUnpinned = true}) async {
    final toDelete = state
        .where((c) => !onlyUnpinned || !c.pinned)
        .map((c) => c.id)
        .toList();
    await _box.deleteAll(toDelete);
    _load();
  }

  Future<void> copyToClipboard(ClipItem item) async {
    await Clipboard.setData(ClipboardData(text: item.content));
  }

  // ── Map ↔ ClipItem helpers ─────────────────────────────────────────────

  static ClipItem _fromMap(Map raw) {
    final m = Map<String, dynamic>.from(raw);
    return ClipItem(
      id:      m['id']      as String,
      content: m['content'] as String,
      typeStr: m['type']    as String? ?? 'text',
      savedAt: DateTime.fromMillisecondsSinceEpoch(m['savedAt'] as int),
      pinned:  m['pinned']  as bool?   ?? false,
      label:   m['label']   as String? ?? '',
    );
  }

  static Map<String, dynamic> _toMap(ClipItem i) => {
        'id':      i.id,
        'content': i.content,
        'type':    i.typeStr,
        'savedAt': i.savedAt.millisecondsSinceEpoch,
        'pinned':  i.pinned,
        'label':   i.label,
      };
}

// ── Provider ───────────────────────────────────────────────────────────────

final clipboardNotifierProvider =
    StateNotifierProvider<ClipboardNotifier, List<ClipItem>>((ref) {
  // Box is guaranteed open by StorageService.initHive() in main.dart
  final box = Hive.box<Map>(_boxName);
  return ClipboardNotifier(box);
});

// ── Derived filtered list ──────────────────────────────────────────────────

final filteredClipsProvider = Provider<List<ClipItem>>((ref) {
  final all    = ref.watch(clipboardNotifierProvider);
  final filter = ref.watch(clipFilterProvider);
  final search = ref.watch(clipSearchProvider).toLowerCase();

  Iterable<ClipItem> result = all;

  switch (filter) {
    case ClipFilter.pinned:
      result = result.where((c) => c.pinned);
    case ClipFilter.urls:
      result = result.where((c) => c.clipType == ClipType.url);
    case ClipFilter.text:
      result = result.where((c) =>
          c.clipType == ClipType.text  ||
          c.clipType == ClipType.email ||
          c.clipType == ClipType.phone);
    case ClipFilter.code:
      result = result.where((c) => c.clipType == ClipType.code);
    case ClipFilter.all:
      break;
  }

  if (search.isNotEmpty) {
    result = result.where(
      (c) =>
          c.content.toLowerCase().contains(search) ||
          c.label.toLowerCase().contains(search),
    );
  }

  return result.toList();
});
