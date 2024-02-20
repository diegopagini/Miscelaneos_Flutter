import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class ControlledMapScreen extends ConsumerWidget {
  const ControlledMapScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watchUserLocation = ref.watch(watchLocationProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ControlledMapScreen'),
      ),
      body: watchUserLocation.when(
        data: (data) => MapAndControls(latitude: data.$1, longitude: data.$2),
        error: (error, stackTrace) => Text('$error'),
        loading: () => const Center(
          child: Text('Buscando usuario'),
        ),
      ),
    );
  }
}

class MapAndControls extends StatelessWidget {
  final double latitude;
  final double longitude;

  const MapAndControls(
      {super.key, required this.latitude, required this.longitude});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _MapView(
          initialLat: latitude,
          initialLng: latitude,
        ),
        Positioned(
            top: 40,
            left: 20,
            child: IconButton.filledTonal(
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(Icons.arrow_back))),
        Positioned(
            bottom: 40,
            left: 20,
            child: IconButton.filledTonal(
                onPressed: () {}, icon: const Icon(Icons.location_searching))),
        Positioned(
            bottom: 90,
            left: 20,
            child: IconButton.filledTonal(
                onPressed: () {},
                icon: const Icon(Icons.accessibility_new_outlined))),
        Positioned(
            bottom: 90,
            left: 20,
            child: IconButton.filledTonal(
                onPressed: () {}, icon: const Icon(Icons.directions_run))),
        Positioned(
            bottom: 140,
            left: 20,
            child: IconButton.filledTonal(
                onPressed: () {}, icon: const Icon(Icons.pin_drop)))
      ],
    );
  }
}

class _MapView extends StatefulWidget {
  final double initialLat;
  final double initialLng;

  const _MapView({required this.initialLat, required this.initialLng});

  @override
  State<_MapView> createState() => __MapViewState();
}

class __MapViewState extends State<_MapView> {
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
          target: LatLng(widget.initialLat, widget.initialLng), zoom: 12),
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      onMapCreated: (GoogleMapController controller) {},
    );
  }
}
