import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_list_provider.g.dart';

@riverpod
class Pokemons extends _$Pokemons {
  @override
  List<int> build() => List.generate(30, (index) => index + 1);

  void update() {
    state = [
      ...state,
      ...List.generate(30, (index) => state.length + 1 + index)
    ];
  }
}
