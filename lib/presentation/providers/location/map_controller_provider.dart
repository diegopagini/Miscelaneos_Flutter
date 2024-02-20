import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_controller_provider.g.dart';

@riverpod
class MapController extends _$MapController {
  final bool isReady;
  final bool followUser;
  final List<Marker> markers;
  final GoogleMapController? controller;
  StreamSubscription? userLocation$;
  (double, double)? lastKnowLocation;

  MapController(
      {this.isReady = false,
      this.followUser = false,
      this.markers = const [],
      this.controller})
      : super() {
    trackUser().listen((event) {
      lastKnowLocation = (event.$1, event.$2);
    });
  }

  @override
  MapController build() => MapController();

  MapController copyWith(
          {bool? isReady,
          bool? followUser,
          List<Marker>? markers,
          GoogleMapController? controller}) =>
      MapController(
          isReady: isReady ?? this.isReady,
          followUser: followUser ?? this.followUser,
          markers: markers ?? this.markers,
          controller: controller ?? this.controller);

  void setMapController(GoogleMapController controller) {
    state = state.copyWith(controller: controller, isReady: true);
  }

  void goToLocation(double latitude, double longitude) {
    final newPosition =
        CameraPosition(target: LatLng(latitude, longitude), zoom: 15);

    state.controller
        ?.animateCamera(CameraUpdate.newCameraPosition(newPosition));
  }

  Stream<(double, double)> trackUser() async* {
    await for (final pos in Geolocator.getPositionStream()) {
      yield (pos.latitude, pos.longitude);
    }
  }

  void toggleFollowUser() {
    state = state.copyWith(followUser: !state.followUser);

    if (state.followUser) {
      findUser();

      userLocation$ = trackUser().listen((event) {
        goToLocation(event.$1, event.$2);
      });
    } else {
      userLocation$?.cancel();
    }
  }

  void findUser() {
    if (lastKnowLocation == null) return;

    final (latitude, longitude) = lastKnowLocation!;
    goToLocation(latitude, longitude);
  }
}
