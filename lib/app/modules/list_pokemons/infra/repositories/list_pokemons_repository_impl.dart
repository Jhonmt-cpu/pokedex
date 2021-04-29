import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_modular/app/core/consts/consts_api.dart';
import 'package:pokedex_modular/app/core/errors/errors.dart';
import 'package:pokedex_modular/app/core/errors/messages.dart';
import 'package:pokedex_modular/app/modules/list_pokemons/domain/entities/generation_detail.dart';
import 'package:pokedex_modular/app/modules/list_pokemons/domain/errors/errors.dart';

part 'list_pokemons_repository_impl.g.dart';

abstract class ListPokemonsRepository {
  Future<Either<Failure, GenerationDetail>> loadGenerationDetail(String id);
}

@Injectable()
class ListPokemonsRepositoryImpl implements ListPokemonsRepository {
  final Dio dio;

  ListPokemonsRepositoryImpl(this.dio);

  Future<Either<Failure, GenerationDetail>> loadGenerationDetail(
      String id) async {
    try {
      final response =
          await dio.get(ConstsAPI.pokeapiv2GenerationDetailURL + id);
      var generationDetails = GenerationDetail.fromJson(response.data);
      return Right(generationDetails);
    } catch (error) {
      return Left(
        ErrorGetPokemonsList(message: Messages.FAILED_GET_LIST_POKEMONS),
      );
    }
  }
}
