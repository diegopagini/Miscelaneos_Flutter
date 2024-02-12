import 'package:miscelaneos/domain/domain.dart';
import 'package:miscelaneos/infrasctructure/infrastructure.dart';

class PokemonMapper {
  static Pokemon pokeApiPokemonToEntity(Map<String, dynamic> json) {
    final apiResponse = PokeApiPokemonResponse.fromJson(json);

    return Pokemon(
        id: apiResponse.id,
        name: apiResponse.name,
        spriteFront: apiResponse.sprites.frontDefault);
  }
}
