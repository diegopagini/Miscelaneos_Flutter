import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/permissions_provider.dart';
import 'package:miscelaneos/presentation/screens/shared/ask_location_screen.dart';

class CompassScreen extends ConsumerWidget {
  const CompassScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationGranted = ref.watch(permissionsStateProvider).locationGranted;
    if (!locationGranted) return const AskLocationScreen();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Compass',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: const Center(child: Text('Hola')),
    );
  }
}
