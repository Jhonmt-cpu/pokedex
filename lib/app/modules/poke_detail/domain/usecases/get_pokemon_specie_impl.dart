import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_modular/app/core/errors/errors.dart';
import 'package:pokedex_modular/app/modules/poke_detail/domain/entities/specie.dart';
import 'package:pokedex_modular/app/modules/poke_detail/infra/repositories/poke_detail_repository_impl.dart';

part 'get_pokemon_specie_impl.g.dart';

abstract class GetPokemonSpecie {
  Future<Either<Failure, Specie>> call(String id);
}

@Injectable()
class GetPokemonSpecieImpl implements GetPokemonSpecie {
  final PokeDetailRepository pokeDetailRepository;

  GetPokemonSpecieImpl(this.pokeDetailRepository);

  @override
  Future<Either<Failure, Specie>> call(String id) async {
    return await pokeDetailRepository.getInfoSpecie(id);
  }
}
