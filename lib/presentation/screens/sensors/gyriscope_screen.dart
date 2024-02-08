import 'package:flutter/material.dart';

class GyroscopeScreen extends StatelessWidget {
  const GyroscopeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GyroscopeScreen'),
      ),
      body: const Center(child: Text('Hola')),
    );
  }
}
