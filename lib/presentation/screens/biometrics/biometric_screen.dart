import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/local_auth/local_auth_providers.dart';

class BiometricScreen extends ConsumerWidget {
  const BiometricScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final canCheckBiometris = ref.watch(canCheckBiometricsProvider);
    final state = ref.watch(localAuthStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Biometric Screen'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FilledButton.tonal(
              onPressed: () {}, child: const Text('Authenticar')),
          canCheckBiometris.when(
              data: (canCheck) => Text('Puede revisar biométricos: $canCheck'),
              error: (error, _) => Text('Error: $error'),
              loading: () => const CircularProgressIndicator()),
          const Text(
            'Estado del biómetrico',
            style: TextStyle(fontSize: 30),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Estado $state',
            style: TextStyle(fontSize: 20),
          )
        ],
      )),
    );
  }
}
