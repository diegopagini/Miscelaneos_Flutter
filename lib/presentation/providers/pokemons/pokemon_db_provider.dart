import 'package:miscelaneos/domain/domain.dart';
import 'package:miscelaneos/infrasctructure/infrastructure.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_db_provider.g.dart';

@Riverpod(keepAlive: false)
class PokemonDb extends _$PokemonDb {
  final localDb = LocalDbRepositryImpl();

  @override
  FutureOr<List<Pokemon>> build() async {
    return await localDb.loadPokemons();
  }
}
