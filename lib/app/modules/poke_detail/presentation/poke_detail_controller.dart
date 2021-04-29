import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:pokedex_modular/app/core/consts/consts_app.dart';
import 'package:pokedex_modular/app/core/pokemon/domain/entities/pokemon.dart';
import 'package:pokedex_modular/app/core/pokemon/domain/usecases/get_pokemon_impl.dart';
import 'package:pokedex_modular/app/modules/poke_detail/domain/entities/evolution_chain.dart';
import 'package:pokedex_modular/app/modules/poke_detail/domain/entities/specie.dart';
import 'package:pokedex_modular/app/modules/poke_detail/domain/usecases/get_pokemon_evolution_chain_impl.dart';
import 'package:pokedex_modular/app/modules/poke_detail/domain/usecases/get_pokemon_specie_impl.dart';

part 'poke_detail_controller.g.dart';

@Injectable()
class PokeDetailController = _PokeDetailControllerBase
    with _$PokeDetailController;

abstract class _PokeDetailControllerBase with Store {
  final GetPokemonEvolutionChain getPokemonEvolutionChain;
  final GetPokemonSpecie getPokemonSpecie;
  final GetPokemon getPokemon;

  _PokeDetailControllerBase(
      this.getPokemonEvolutionChain, this.getPokemonSpecie, this.getPokemon);

  @observable
  Pokemon currentPokemon;

  @observable
  Specie specie;

  @observable
  EvolutionChain evolutionChain;

  @observable
  Color pokemonColor;

  @observable
  int currentPosition;

  @observable
  List<Stats> stats;

  @observable
  Sprites sprites;

  List<String> getPokemonApiV2({int index}) {
    List<String> _list = [];
    var id = currentPokemon.id.toString();
    var name = currentPokemon.name;
    _list = [id, name];
    return _list;
  }

  setCurrentPokemon({Pokemon pokemon, int index, String url}) async {
    stats = null;
    sprites = null;
    if (pokemon != null) {
      currentPokemon = pokemon;
    } else {
      var response = await getPokemon(url);
      response.fold(
          (failure) => asuka.showSnackBar(
                SnackBar(
                  content: Text(failure.message),
                  duration: Duration(seconds: 3),
                ),
              ),
          (pokemon) => currentPokemon = pokemon);
    }
    pokemonColor =
        ConstsApp.getColorType(type: currentPokemon.types[0].type.name);
    currentPosition = index;
    stats = currentPokemon.stats;
    sprites = currentPokemon.sprites;
    getInfoSpecieAndEvolution();
  }

  getInfoSpecieAndEvolution() async {
    await getInfoSpecie(currentPokemon.id.toString());
    await getEvolutionChain(specie.evolutionChain.url);
  }

  Widget getImage({String id}) {
    return CachedNetworkImage(
      placeholder: (context, url) => new Container(
        color: Colors.transparent,
      ),
      imageUrl:
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png",
    );
  }

  getInfoSpecie(String id) async {
    specie = null;
    var response = await getPokemonSpecie(id);
    response.fold(
        (failure) => asuka.showSnackBar(
              SnackBar(
                content: Text(failure.message),
                duration: Duration(seconds: 3),
              ),
            ),
        (specieResponse) => specie = specieResponse);
  }

  getEvolutionChain(String url) async {
    evolutionChain = null;
    var response = await getPokemonEvolutionChain(url);
    response.fold(
        (failure) => asuka.showSnackBar(
              SnackBar(
                content: Text(failure.message),
                duration: Duration(seconds: 3),
              ),
            ),
        (evolutionChainResponse) => evolutionChain = evolutionChainResponse);
  }
}
