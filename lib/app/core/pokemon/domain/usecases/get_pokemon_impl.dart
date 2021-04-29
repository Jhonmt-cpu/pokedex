import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_modular/app/core/errors/errors.dart';
import 'package:pokedex_modular/app/core/pokemon/domain/entities/pokemon.dart';
import 'package:pokedex_modular/app/core/pokemon/infra/repositories/pokemon_repository_impl.dart';

part 'get_pokemon_impl.g.dart';

abstract class GetPokemon {
  Future<Either<Failure, Pokemon>> call(String url);
}

@Injectable()
class GetPokemonImpl implements GetPokemon {
  final PokemonRepository pokemonRepository;

  GetPokemonImpl(this.pokemonRepository);

  @override
  Future<Either<Failure, Pokemon>> call(String url) async {
    return pokemonRepository.loadPokemonItem(url);
  }
}
