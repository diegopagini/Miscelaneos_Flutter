import 'package:miscelaneos/domain/domain.dart';
import 'package:miscelaneos/infrasctructure/infrastructure.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_provider.g.dart';

@Riverpod(keepAlive: true)
Future<Pokemon> pokemonById(PokemonByIdRef ref, String id) async {
  final (pokemon, error) = await PokemonsRepositoryImpl().getPokemon(id);

  if (pokemon != null) return pokemon;

  throw error;
}
