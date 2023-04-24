import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

class PermissionsService {
  PermissionsService._privateConstructor();
  static final PermissionsService instance = PermissionsService._privateConstructor();

  Future<bool> checkStoragePermission() async {
    if (Platform.isAndroid) {
      PermissionStatus manageExternalStorageStatus = await Permission.manageExternalStorage.request();
      PermissionStatus? storageStatus = await Permission.storage.request();

      // check if the user selected previously to never ask again for permissions and redirect to app settings to ask again
      bool appIsPermanentlyDenied = manageExternalStorageStatus == PermissionStatus.permanentlyDenied ||
          storageStatus == PermissionStatus.permanentlyDenied;
      if (appIsPermanentlyDenied) {
        openAppSettings();
        return false;
      }

      // check if the user give access for both storages
      bool permissionsGranted =
          manageExternalStorageStatus == PermissionStatus.granted && storageStatus == PermissionStatus.granted;

      return permissionsGranted;
    } else if (Platform.isIOS) {
      return false;
    } else {
      return false;
    }
  }

  Future<bool> checkImagePickerPermissions() async {
    Map<Permission, PermissionStatus> permissionStatuses = await [Permission.camera, Permission.storage].request();
    PermissionStatus? cameraStatus = permissionStatuses[Permission.camera];
    PermissionStatus? storageStatus = permissionStatuses[Permission.storage];

    // check if the user selected previously to never ask again for permissions and redirect to app settings to ask again
    bool appIsPermanentlyDenied =
        cameraStatus == PermissionStatus.permanentlyDenied || storageStatus == PermissionStatus.permanentlyDenied;
    if (appIsPermanentlyDenied) {
      openAppSettings();
      return false;
    }

    // check if the user give access to both the camera and storage
    bool permissionsGranted = cameraStatus == PermissionStatus.granted && storageStatus == PermissionStatus.granted;
    return permissionsGranted;
  }
}
