import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_modular/app/modules/poke_detail/presentation/poke_detail_page.dart';

import 'domain/usecases/get_pokemon_evolution_chain_impl.dart';
import 'domain/usecases/get_pokemon_specie_impl.dart';
import 'presentation/poke_detail_controller.dart';
import 'infra/repositories/poke_detail_repository_impl.dart';

class PokeDetailModule extends Module {
  @override
  final List<Bind> binds = [
    $PokeDetailRepositoryImpl,
    $GetPokemonEvolutionChainImpl,
    $GetPokemonSpecieImpl,
    $PokeDetailController
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      "/:index",
      child: (context, args) => PokeDetailPage(
        index: int.parse(args.params['index']),
        pokemon: args.data[0],
        pokemonSpeciesList: args.data[1],
      ),
    ),
  ];
}
