import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:pokedex_modular/app/core/pokemon/domain/usecases/get_pokemon_impl.dart';
import 'package:pokedex_modular/app/core/utils/loading_dialog.dart';
import 'package:pokedex_modular/app/modules/list_pokemons/domain/entities/generation_detail.dart';
import 'package:pokedex_modular/app/core/pokemon/domain/entities/pokemon.dart';
import 'package:pokedex_modular/app/modules/list_pokemons/domain/usecases/get_pokemons_list_impl.dart';
part 'list_pokemons_controller.g.dart';

@Injectable()
class ListPokemonsController = _ListPokemonsControllerBase
    with _$ListPokemonsController;

abstract class _ListPokemonsControllerBase with Store {
  final GetPokemonsList getPokemonsList;
  final GetPokemon getPokemon;
  final LoadingDialog loading;

  _ListPokemonsControllerBase(
      this.getPokemonsList, this.loading, this.getPokemon);

  @observable
  GenerationDetail generationDetail;

  fetchPokemonList(String id) async {
    generationDetail = null;
    await Future.delayed(Duration(milliseconds: 500));
    loading.show();
    var response = await getPokemonsList(id);
    loading.hide();
    response.fold(
        (failure) => asuka.showSnackBar(
              SnackBar(
                content: Text(failure.message),
                duration: Duration(seconds: 3),
              ),
            ),
        (pokemonList) => generationDetail = pokemonList);
  }

  Future<Pokemon> fethPokemonItem(String url) async {
    var response = await getPokemon(url);
    return response.fold((failure) => null, (pokemon) => pokemon);
  }
}
