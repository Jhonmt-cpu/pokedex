import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_modular/app/modules/list_pokemons/list_pokemons_module.dart';
import 'package:pokedex_modular/app/modules/poke_detail/poke_detail_module.dart';

import 'core/pokemon/domain/usecases/get_pokemon_impl.dart';
import 'core/pokemon/infra/repositories/pokemon_repository_impl.dart';
import 'core/utils/loading_dialog.dart';
import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    $PokemonRepositoryImpl,
    $GetPokemonImpl,
    Bind((i) => LoadingDialogImpl()),
    Bind((i) => Dio()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: HomeModule()),
    ModuleRoute('/list-pokemons', module: ListPokemonModule()),
    ModuleRoute('/poke-detail', module: PokeDetailModule())
  ];
}
