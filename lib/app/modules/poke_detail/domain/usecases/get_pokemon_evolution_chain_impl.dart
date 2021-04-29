import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_modular/app/core/errors/errors.dart';
import 'package:pokedex_modular/app/modules/poke_detail/domain/entities/evolution_chain.dart';
import 'package:pokedex_modular/app/modules/poke_detail/infra/repositories/poke_detail_repository_impl.dart';

part 'get_pokemon_evolution_chain_impl.g.dart';

abstract class GetPokemonEvolutionChain {
  Future<Either<Failure, EvolutionChain>> call(String url);
}

@Injectable()
class GetPokemonEvolutionChainImpl implements GetPokemonEvolutionChain {
  final PokeDetailRepository pokeDetailRepository;

  GetPokemonEvolutionChainImpl(this.pokeDetailRepository);

  @override
  Future<Either<Failure, EvolutionChain>> call(String url) async {
    return pokeDetailRepository.getEvlutionChain(url);
  }
}
