import 'package:flutter/material.dart';

class PokemonScreen extends StatelessWidget {
  final String id;

  const PokemonScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon name'),
      ),
      body: Center(
        child: Text('Pokemon id: $id'),
      ),
    );
  }
}
