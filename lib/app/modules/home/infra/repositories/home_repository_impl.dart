import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_modular/app/core/consts/consts_api.dart';
import 'package:pokedex_modular/app/core/errors/errors.dart';
import 'package:pokedex_modular/app/core/errors/messages.dart';
import 'package:pokedex_modular/app/modules/home/domain/entities/generations_list.dart';
import 'package:pokedex_modular/app/modules/home/domain/errors/errors.dart';

part 'home_repository_impl.g.dart';

abstract class HomeRepository {
  Future<Either<Failure, GenerationsList>> loadGenerationsList();
}

@Injectable()
class HomeRepositoryImpl implements HomeRepository {
  final Dio dio;

  HomeRepositoryImpl(this.dio);

  @override
  Future<Either<Failure, GenerationsList>> loadGenerationsList() async {
    try {
      final response = await dio.get(ConstsAPI.pokeapiv2Generations);
      GenerationsList generationsList = GenerationsList.fromJson(response.data);
      return Right(generationsList);
    } catch (error) {
      return Left(ErrorGetGeneratonsList(
          message: Messages.FAILED_GET_LIST_GENERATIONS));
    }
  }
}
