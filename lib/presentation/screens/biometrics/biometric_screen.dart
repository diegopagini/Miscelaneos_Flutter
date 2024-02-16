import 'package:flutter/material.dart';

class BiometricScreen extends StatelessWidget {
  const BiometricScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          const Text(
            'Estado del biómetrico',
            style: TextStyle(fontSize: 30),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Estado XXX',
            style: TextStyle(fontSize: 20),
          )
        ],
      )),
    );
  }
}
