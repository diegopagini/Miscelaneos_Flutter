import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class PokemonsScreen extends StatelessWidget {
  const PokemonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _PokemonsView(),
    );
  }
}

class _PokemonsView extends ConsumerStatefulWidget {
  const _PokemonsView();

  @override
  ConsumerState<_PokemonsView> createState() => PokemonsViewState();
}

class PokemonsViewState extends ConsumerState<_PokemonsView> {
  final controller = ScrollController();

  void infiniteScroll() {
    final currentPokemons = ref.read(pokemonsProvider);
    if (currentPokemons.length > 400) {
      controller.removeListener(infiniteScroll);
      return;
    }

    if ((controller.position.pixels + 200) >
        controller.position.maxScrollExtent) {
      ref.read(pokemonsProvider.notifier).update();
    }
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(infiniteScroll);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controller,
      slivers: [
        SliverAppBar(
          title: const Text('Pokemons'),
          floating: true,
          backgroundColor: Colors.white.withOpacity(0.8),
        ),
        const _PokemonGrid(),
      ],
    );
  }
}

class _PokemonGrid extends ConsumerWidget {
  const _PokemonGrid();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemons = ref.watch(pokemonsProvider);

    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemCount: pokemons.length,
      itemBuilder: (context, index) {
        final src =
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index + 1}.png';

        return GestureDetector(
          onTap: () {},
          child: Image.network(
            src,
            fit: BoxFit.contain,
          ),
        );
      },
    );
  }
}
