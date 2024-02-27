import 'package:miscelaneos/domain/domain.dart';
import 'package:miscelaneos/infrasctructure/datasources/isar_local_db_datasource.dart';

class LocalDbRepositryImpl extends LocalDbRepository {
  final LocalDbDatasource _datasource;

  LocalDbRepositryImpl([LocalDbDatasource? datasource])
      : _datasource = datasource ?? IsarLocalDbDatasource();

  @override
  Future<void> insertPokemon(Pokemon pokemon) {
    return _datasource.insertPokemon(pokemon);
  }

  @override
  Future<List<Pokemon>> loadPokemons() {
    return _datasource.loadPokemons();
  }

  @override
  Future<int> pokemonCount() {
    return _datasource.pokemonCount();
  }
}
