import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_modular/app/core/consts/consts_api.dart';
import 'package:pokedex_modular/app/core/errors/errors.dart';
import 'package:pokedex_modular/app/core/errors/messages.dart';
import 'package:pokedex_modular/app/core/pokemon/domain/entities/pokemon.dart';
import 'package:pokedex_modular/app/core/pokemon/domain/errors/error_get_pokemon.dart';

part 'pokemon_repository_impl.g.dart';

abstract class PokemonRepository {
  Future<Either<Failure, Pokemon>> loadPokemonItem(String id);
}

@Injectable()
class PokemonRepositoryImpl implements PokemonRepository {
  final Dio dio;

  PokemonRepositoryImpl(this.dio);

  Future<Either<Failure, Pokemon>> loadPokemonItem(String url) async {
    var idWithWithThe2OfUrl = url.replaceAll(new RegExp(r'[^0-9]'), '');
    var id = idWithWithThe2OfUrl.substring(1);
    try {
      final response = await dio.get(ConstsAPI.pokeapiv2PokemonURL + id);
      var pokemon = Pokemon.fromJson(response.data);
      return Right(pokemon);
    } catch (error) {
      return Left(
        ErrorGetPokemons(message: Messages.FAILED_GET_POKEMON),
      );
    }
  }
}
