import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'permissions_provider.g.dart';

@Riverpod(keepAlive: true)
class PermissionsState extends _$PermissionsState {
  final PermissionStatus camera;
  final PermissionStatus photoLibrary;
  final PermissionStatus sensors;
  final PermissionStatus location;
  final PermissionStatus locationAlways;
  final PermissionStatus locationWhenInUse;

  PermissionsState(
      {this.camera = PermissionStatus.denied,
      this.photoLibrary = PermissionStatus.denied,
      this.sensors = PermissionStatus.denied,
      this.location = PermissionStatus.denied,
      this.locationAlways = PermissionStatus.denied,
      this.locationWhenInUse = PermissionStatus.denied});

  bool get cameraGranted {
    return camera == PermissionStatus.granted;
  }

  bool get photoLibraryGranted {
    return photoLibrary == PermissionStatus.granted;
  }

  bool get sensorsGranted {
    return sensors == PermissionStatus.granted;
  }

  bool get locationGranted {
    return location == PermissionStatus.granted;
  }

  bool get locationAlwaysGranted {
    return locationAlways == PermissionStatus.granted;
  }

  bool get locationWhenInUseGranted {
    return locationWhenInUse == PermissionStatus.granted;
  }

  PermissionsState copyWith({
    PermissionStatus? camera,
    PermissionStatus? photoLibrary,
    PermissionStatus? sensors,
    PermissionStatus? location,
    PermissionStatus? locationAlways,
    PermissionStatus? locationWhenInUse,
  }) =>
      PermissionsState(
          camera: camera ?? this.camera,
          photoLibrary: photoLibrary ?? this.photoLibrary,
          sensors: sensors ?? this.sensors,
          location: location ?? this.location,
          locationAlways: locationAlways ?? this.locationAlways,
          locationWhenInUse: locationWhenInUse ?? this.locationWhenInUse);

  @override
  PermissionsState build() {
    checkPermissions();
    return copyWith();
  }

  Future<void> checkPermissions() async {
    final permissionsArray = await Future.wait([
      Permission.camera.status,
      Permission.photos.status,
      Permission.sensors.status,
      Permission.location.status,
      Permission.locationAlways.status,
      Permission.locationWhenInUse.status,
    ]);

    state = state.copyWith(
      camera: permissionsArray[0],
      photoLibrary: permissionsArray[1],
      sensors: permissionsArray[2],
      location: permissionsArray[3],
      locationAlways: permissionsArray[4],
      locationWhenInUse: permissionsArray[5],
    );
  }

  Future<void> requestCameraAcces() async {
    final status = await Permission.camera.request();
    state = state.copyWith(camera: status);

    if (status == PermissionStatus.permanentlyDenied) {
      openAppSettings();
    }
  }

  Future<void> requestPhotosAcces() async {
    final status = await Permission.photos.request();
    state = state.copyWith(photoLibrary: status);

    if (status == PermissionStatus.permanentlyDenied) {
      openAppSettings();
    }
  }

  Future<void> requestSensorsAcces() async {
    final status = await Permission.sensors.request();
    state = state.copyWith(sensors: status);

    if (status == PermissionStatus.permanentlyDenied) {
      openAppSettings();
    }
  }

  Future<void> requestLocationAcces() async {
    final status = await Permission.location.request();
    state = state.copyWith(location: status);

    if (status == PermissionStatus.permanentlyDenied) {
      openAppSettings();
    }
  }

  Future<void> requestLocationAlwaysAcces() async {
    final status = await Permission.locationAlways.request();
    state = state.copyWith(locationAlways: status);

    if (status == PermissionStatus.permanentlyDenied) {
      openAppSettings();
    }
  }

  Future<void> requestLocationWhenInUseAcces() async {
    final status = await Permission.locationWhenInUse.request();
    state = state.copyWith(locationWhenInUse: status);

    if (status == PermissionStatus.permanentlyDenied) {
      openAppSettings();
    }
  }
}
