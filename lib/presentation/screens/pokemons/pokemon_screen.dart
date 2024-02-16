import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/config/config.dart';
import 'package:miscelaneos/domain/domain.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class PokemonScreen extends ConsumerWidget {
  final String id;

  const PokemonScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonAsync = ref.watch(pokemonByIdProvider(id));

    return pokemonAsync.when(
      data: (data) => _PokemonView(pokemon: data),
      error: (error, stackTrace) => _ErrorView(message: error.toString()),
      loading: () => const _LoadingView(),
    );
  }
}

class _PokemonView extends StatelessWidget {
  final Pokemon pokemon;

  const _PokemonView({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
        actions: [
          IconButton(
              onPressed: () {
                // link == Deeplink
                SharePlugin.shareLink(
                    'https://web-app-pokemon-flutter.vercel.app/pokemons/${pokemon.id}/',
                    'Mira este pókemon');
              },
              icon: const Icon(Icons.share_outlined))
        ],
      ),
      body: Center(
        child: Image.network(
          pokemon.spriteFront,
          fit: BoxFit.contain,
          width: 250,
          height: 250,
        ),
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String message;

  const _ErrorView({required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(message),
      ),
    );
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: CircularProgressIndicator(
        strokeWidth: 2,
      )),
    );
  }
}
