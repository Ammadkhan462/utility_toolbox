import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import '../models/saved_location.dart';

// ── Current position ──────────────────────────────────────────────────────────

class PositionState {
  final bool isLoading;
  final Position? position;
  final String? error;

  const PositionState({
    this.isLoading = false,
    this.position,
    this.error,
  });
}

class PositionNotifier extends StateNotifier<PositionState> {
  PositionNotifier() : super(const PositionState()) {
    fetch();
  }

  Future<void> fetch() async {
    state = const PositionState(isLoading: true);
    try {
      LocationPermission perm = await Geolocator.checkPermission();
      if (perm == LocationPermission.denied) {
        perm = await Geolocator.requestPermission();
      }
      if (perm == LocationPermission.deniedForever) {
        state = const PositionState(error: 'Location permission denied. Enable in settings.');
        return;
      }
      final pos = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
      );
      state = PositionState(position: pos);
    } catch (e) {
      state = PositionState(error: e.toString());
    }
  }
}

final positionProvider =
    StateNotifierProvider<PositionNotifier, PositionState>(
        (_) => PositionNotifier());

// ── Saved locations ───────────────────────────────────────────────────────────

const _kPrefsKey = 'saved_locations_v1';

class SavedLocationsNotifier extends StateNotifier<List<SavedLocation>> {
  SavedLocationsNotifier() : super([]) {
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_kPrefsKey);
    if (raw != null) {
      final list = (jsonDecode(raw) as List)
          .map((e) => SavedLocation.fromJson(e as Map<String, dynamic>))
          .toList();
      state = list;
    }
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
    state = state.where((l) => l.id != id).toList();
    await _save();
  }
}

final savedLocationsProvider =
    StateNotifierProvider<SavedLocationsNotifier, List<SavedLocation>>(
        (_) => SavedLocationsNotifier());
