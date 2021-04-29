import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_modular/app/core/errors/errors.dart';
import 'package:pokedex_modular/app/modules/list_pokemons/domain/entities/generation_detail.dart';
import 'package:pokedex_modular/app/modules/list_pokemons/infra/repositories/list_pokemons_repository_impl.dart';

part 'get_pokemons_list_impl.g.dart';

abstract class GetPokemonsList {
  Future<Either<Failure, GenerationDetail>> call(String id);
}

@Injectable()
class GetPokemonsListImpl implements GetPokemonsList {
  final ListPokemonsRepository listPokemonsRepository;

  GetPokemonsListImpl(this.listPokemonsRepository);

  @override
  Future<Either<Failure, GenerationDetail>> call(String id) async {
    return listPokemonsRepository.loadGenerationDetail(id);
  }
}
