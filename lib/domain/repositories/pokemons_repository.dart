import 'package:miscelaneos/domain/entities/pokemon.dart';

abstract class PokemonsRepository {
  Future<(Pokemon?, String)> getPokemon(String id);
}
