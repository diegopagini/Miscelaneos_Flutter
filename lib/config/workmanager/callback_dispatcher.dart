import 'package:miscelaneos/infrasctructure/infrastructure.dart';
import 'package:workmanager/workmanager.dart';

const fetchBackgroundTaskKey =
    'com.diegopagini.miscelaneos.fetch-background-pokemon';
const fetchPeriodicBagrkoundTaskKey =
    'com.diegopagini.miscelaneos.fetch-background-periodic';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    switch (task) {
      case fetchBackgroundTaskKey:
        await loadNextPokemon();
        break;

      case fetchPeriodicBagrkoundTaskKey:
        print('fetchPeriodicBagrkoundTaskKey');
        break;

      case Workmanager.iOSBackgroundTask: // FOR IOS
        print('Workmanager.iOSBackgroundTask');
        break;
    }

    return true;
  });
}

Future loadNextPokemon() async {
  final localDbRepository = LocalDbRepositryImpl();
  final pokemonRepository = PokemonsRepositoryImpl();
  final lastPokemonId = await localDbRepository.pokemonCount() + 1;
  try {
    final (pokemon, message) =
        await pokemonRepository.getPokemon(lastPokemonId.toString());
    if (pokemon == null) throw message;

    await localDbRepository.insertPokemon(pokemon);
  } catch (e) {
    throw Exception(e);
  }
}
