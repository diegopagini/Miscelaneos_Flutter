import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/permissions_provider.dart';

class PermissionsScreen extends StatelessWidget {
  const PermissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Permisos'),
      ),
      body: const _PermissionsView(),
    );
  }
}

class _PermissionsView extends ConsumerWidget {
  const _PermissionsView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final permissionsState = ref.watch(permissionsStateProvider);
    final notifier = ref.watch(permissionsStateProvider.notifier);

    return ListView(
      children: [
        CheckboxListTile(
          value: permissionsState.cameraGranted,
          onChanged: (_) {
            notifier.requestCameraAcces();
          },
          title: const Text('Camera'),
          subtitle: Text('${permissionsState.camera}'),
        ),
        CheckboxListTile(
          value: permissionsState.photoLibraryGranted,
          onChanged: (_) {
            notifier.requestPhotosAcces();
          },
          title: const Text('Photos'),
          subtitle: Text('${permissionsState.photoLibrary}'),
        ),
        CheckboxListTile(
          value: permissionsState.sensorsGranted,
          onChanged: (_) {
            notifier.requestSensorsAcces();
          },
          title: const Text('Sensors'),
          subtitle: Text('${permissionsState.sensors}'),
        ),
        CheckboxListTile(
          value: permissionsState.locationGranted,
          onChanged: (_) {
            notifier.requestLocationAcces();
          },
          title: const Text('Location'),
          subtitle: Text('${permissionsState.location}'),
        ),
        CheckboxListTile(
          value: permissionsState.locationAlwaysGranted,
          onChanged: (_) {
            notifier.requestLocationAlwaysAcces();
          },
          title: const Text('Location Always'),
          subtitle: Text('${permissionsState.locationAlways}'),
        ),
        CheckboxListTile(
          value: permissionsState.locationWhenInUseGranted,
          onChanged: (_) {
            notifier.requestLocationWhenInUseAcces();
          },
          title: const Text('Location When In Use'),
          subtitle: Text('${permissionsState.locationWhenInUse}'),
        ),
      ],
    );
  }
}
