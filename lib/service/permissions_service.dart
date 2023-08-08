import 'package:permission_handler/permission_handler.dart';

class PermissionsService {

  // Future<PermissionStatus> requestHealthPermission() async {
  //
  // }

  Future<PermissionStatus> requestPermission(Permission permission) async {
    return permission.request();
  }

}