import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

enum PermissionOutcome { granted, denied, permanentlyDenied }

class PermissionService {
  Future<PermissionOutcome> requestCamera() => _request(Permission.camera);

  Future<PermissionOutcome> requestPhotos() async {
    if (await Permission.photos.isGranted ||
        await Permission.storage.isGranted) {
      return PermissionOutcome.granted;
    }

    var status = await Permission.photos.request();
    if (status.isGranted) return PermissionOutcome.granted;
    if (status.isPermanentlyDenied) {
      return PermissionOutcome.permanentlyDenied;
    }

    status = await Permission.storage.request();
    if (status.isGranted) return PermissionOutcome.granted;
    if (status.isPermanentlyDenied) {
      return PermissionOutcome.permanentlyDenied;
    }

    return PermissionOutcome.denied;
  }

  Future<PermissionOutcome> _request(Permission permission) async {
    final status = await permission.request();
    if (status.isGranted) return PermissionOutcome.granted;
    if (status.isPermanentlyDenied) {
      return PermissionOutcome.permanentlyDenied;
    }
    return PermissionOutcome.denied;
  }

  Future<bool> openSettings() => openAppSettings();
}

final permissionServiceProvider = Provider<PermissionService>((ref) {
  return PermissionService();
});
