import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_modular/app/core/consts/consts_api.dart';
import 'package:pokedex_modular/app/core/errors/errors.dart';
import 'package:pokedex_modular/app/core/errors/messages.dart';
import 'package:pokedex_modular/app/modules/poke_detail/domain/entities/evolution_chain.dart';
import 'package:pokedex_modular/app/modules/poke_detail/domain/entities/specie.dart';
import 'package:pokedex_modular/app/modules/poke_detail/domain/errors/errors.dart';

part 'poke_detail_repository_impl.g.dart';

abstract class PokeDetailRepository {
  Future<Either<Failure, Specie>> getInfoSpecie(String id);
  Future<Either<Failure, EvolutionChain>> getEvlutionChain(String url);
}

@Injectable()
class PokeDetailRepositoryImpl implements PokeDetailRepository {
  final Dio dio;

  PokeDetailRepositoryImpl(this.dio);

  @override
  Future<Either<Failure, Specie>> getInfoSpecie(String id) async {
    try {
      var url = ConstsAPI.pokeapiv2EspeciesURL + id;
      final response = await dio.get(url);
      var specie = Specie.fromJson(response.data);
      return Right(specie);
    } catch (e) {
      return Left(ErrorGetSpecie(message: Messages.FAILED_GET_POKEMON));
    }
  }

  @override
  Future<Either<Failure, EvolutionChain>> getEvlutionChain(String url) async {
    try {
      final response = await dio.get(url);
      var evolutionChain = EvolutionChain.fromJson(response.data);
      return Right(evolutionChain);
    } catch (e) {
      return Left(ErrorGetEvolutionChain(message: Messages.FAILED_GET_POKEMON));
    }
  }
}
