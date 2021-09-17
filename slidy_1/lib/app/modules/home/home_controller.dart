import 'package:mobx/mobx.dart';

import 'models/pokemon_model.dart';
import 'repositories/poke_repository.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final PokeRepository repository;

  @observable
  ObservableFuture<List<PokemonModel>>? pokemons;

  @action
  fetchPokemon() => pokemons = repository.getAllPokemons().asObservable();

  _HomeControllerBase(this.repository) {
    fetchPokemon();
  }
}
