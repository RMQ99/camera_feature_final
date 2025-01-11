import 'package:permission_handler/permission_handler.dart';

class PermissionManager {
  static Future<bool> requestPermissions() async {
    final status = await [
      Permission.camera,
      Permission.microphone,
      Permission.storage,
    ].request();

    return status.values.every((permission) => permission.isGranted);
  }
}