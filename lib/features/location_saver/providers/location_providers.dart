import 'dart:async';
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import '../models/saved_location.dart';

// ── Current position ──────────────────────────────────────────────────────────

/// Why a fix couldn't be obtained, so the UI can show a localized message
/// and offer the right settings page.
enum PositionErrorKind {
  servicesDisabled,
  permissionDenied,
  deniedForever,
  timeout,
  other,
}

class PositionState {
  final bool isLoading;
  final Position? position;
  final PositionErrorKind? errorKind;

  const PositionState({
    this.isLoading = false,
    this.position,
    this.errorKind,
  });
}

class PositionNotifier extends StateNotifier<PositionState> {
  PositionNotifier() : super(const PositionState()) {
    fetch();
  }

  Future<void> fetch() async {
    if (state.isLoading) return; // ignore repeated taps on refresh
    final previous = state.position;
    state = PositionState(isLoading: true, position: previous);
    try {
      if (!await Geolocator.isLocationServiceEnabled()) {
        if (!mounted) return;
        state = const PositionState(
          errorKind: PositionErrorKind.servicesDisabled,
        );
        return;
      }
      LocationPermission perm = await Geolocator.checkPermission();
      if (perm == LocationPermission.denied) {
        perm = await Geolocator.requestPermission();
      }
      if (!mounted) return;
      if (perm == LocationPermission.deniedForever) {
        state = const PositionState(
          errorKind: PositionErrorKind.deniedForever,
        );
        return;
      }
      if (perm == LocationPermission.denied) {
        state = const PositionState(
          errorKind: PositionErrorKind.permissionDenied,
        );
        return;
      }
      Position pos;
      try {
        pos = await Geolocator.getCurrentPosition(
          locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.high,
            // Indoors a GPS fix can take forever; don't spin indefinitely.
            timeLimit: Duration(seconds: 20),
          ),
        );
      } on TimeoutException {
        final last = await Geolocator.getLastKnownPosition();
        if (last == null) rethrow;
        pos = last;
      }
      if (!mounted) return;
      state = PositionState(position: pos);
    } on LocationServiceDisabledException {
      if (!mounted) return;
      state = const PositionState(
        errorKind: PositionErrorKind.servicesDisabled,
      );
    } on PermissionDeniedException {
      if (!mounted) return;
      state = const PositionState(
        errorKind: PositionErrorKind.permissionDenied,
      );
    } on TimeoutException {
      // No fix within the time limit and no last known position.
      if (!mounted) return;
      state = const PositionState(errorKind: PositionErrorKind.timeout);
    } catch (_) {
      if (!mounted) return;
      state = const PositionState(errorKind: PositionErrorKind.other);
    }
  }

  /// Called when the app returns to the foreground (e.g. from Settings):
  /// fetches again if the user has since turned location on or granted the
  /// permission. Never re-prompts, so a denied dialog can't loop.
  Future<void> recheck() async {
    final kind = state.errorKind;
    if (state.isLoading || kind == null) return;
    try {
      final fixed = switch (kind) {
        PositionErrorKind.servicesDisabled =>
          await Geolocator.isLocationServiceEnabled(),
        PositionErrorKind.permissionDenied ||
        PositionErrorKind.deniedForever => switch (
              await Geolocator.checkPermission()) {
            LocationPermission.always || LocationPermission.whileInUse => true,
            _ => false,
          },
        _ => false,
      };
      if (fixed && mounted) await fetch();
    } catch (_) {}
  }

  /// Opens the system page that fixes the current error.
  Future<void> openSettings() async {
    try {
      if (state.errorKind == PositionErrorKind.servicesDisabled) {
        await Geolocator.openLocationSettings();
      } else {
        await Geolocator.openAppSettings();
      }
    } catch (_) {}
  }
}

// autoDispose: each visit gets a fresh fix instead of the position from the
// first time the screen was opened (which could be kilometres away by now).
final positionProvider =
    StateNotifierProvider.autoDispose<PositionNotifier, PositionState>(
        (_) => PositionNotifier());

// ── Saved locations ───────────────────────────────────────────────────────────

const _kPrefsKey = 'saved_locations_v1';

class SavedLocationsNotifier extends StateNotifier<List<SavedLocation>> {
  SavedLocationsNotifier() : super([]) {
    _loaded = _load();
  }

  late final Future<void> _loaded;

  Future<void> _load() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString(_kPrefsKey);
      if (raw != null && mounted) {
        final list = <SavedLocation>[];
        for (final e in jsonDecode(raw) as List) {
          try {
            list.add(SavedLocation.fromJson(e as Map<String, dynamic>));
          } catch (_) {} // skip a corrupt entry instead of losing them all
        }
        state = list;
      }
    } catch (_) {}
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _kPrefsKey,
      jsonEncode(state.map((l) => l.toJson()).toList()),
    );
  }

  Future<void> add({
    required String name,
    required double lat,
    required double lng,
    String? address,
    String? note,
  }) async {
    // If the user saves before the list finished loading, the load would
    // otherwise overwrite the new entry.
    await _loaded;
    final loc = SavedLocation(
      id:        const Uuid().v4(),
      name:      name,
      latitude:  lat,
      longitude: lng,
      address:   address,
      savedAt:   DateTime.now(),
      note:      note,
    );
    state = [loc, ...state];
    await _save();
  }

  Future<void> remove(String id) async {
    await _loaded;
    state = state.where((l) => l.id != id).toList();
    await _save();
  }

  /// Puts back a location removed with [remove] (Undo), at its old position.
  Future<void> restore(SavedLocation loc, int index) async {
    await _loaded;
    if (state.any((l) => l.id == loc.id)) return;
    final list = [...state];
    list.insert(index.clamp(0, list.length), loc);
    state = list;
    await _save();
  }
}

final savedLocationsProvider =
    StateNotifierProvider<SavedLocationsNotifier, List<SavedLocation>>(
        (_) => SavedLocationsNotifier());
