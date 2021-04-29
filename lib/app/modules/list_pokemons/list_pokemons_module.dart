import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_modular/app/modules/list_pokemons/domain/usecases/get_pokemons_list_impl.dart';
import 'package:pokedex_modular/app/modules/list_pokemons/infra/repositories/list_pokemons_repository_impl.dart';
import 'package:pokedex_modular/app/modules/list_pokemons/presentation/list_pokemons_controller.dart';
import 'package:pokedex_modular/app/modules/list_pokemons/presentation/list_pokemons_page.dart';

class ListPokemonModule extends Module {
  @override
  final List<Bind> binds = [
    $ListPokemonsRepositoryImpl,
    $ListPokemonsController,
    $GetPokemonsListImpl,
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      "/:id",
      child: (context, args) => ListPokemonsPage(
        generationId: args.params['id'],
      ),
    ),
  ];
}
