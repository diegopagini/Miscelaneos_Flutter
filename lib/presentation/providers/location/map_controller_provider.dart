import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_controller_provider.g.dart';

@riverpod
class MapController extends _$MapController {
  final bool isReady;
  final bool followUser;
  final List<Marker> markers;
  final GoogleMapController? controller;

  MapController(
      {this.isReady = false,
      this.followUser = false,
      this.markers = const [],
      this.controller});

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

  void goToLocation() {}
}
