import 'package:miscelaneos/domain/domain.dart';
import 'package:miscelaneos/infrasctructure/infrastructure.dart';

class PokemonsRepositoryImpl implements PokemonsRepository {
  final PokemonsDatasource datasource;

  PokemonsRepositoryImpl(PokemonsDatasource? datasource)
      : datasource = datasource ?? PokemonsDatasourceImpl();

  @override
  Future<(Pokemon?, String)> getPokemon(String id) {
    return datasource.getPokemon(id);
  }
}
