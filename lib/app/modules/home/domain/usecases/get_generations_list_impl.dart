import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_modular/app/core/errors/errors.dart';
import 'package:pokedex_modular/app/modules/home/domain/entities/generations_list.dart';
import 'package:pokedex_modular/app/modules/home/infra/repositories/home_repository_impl.dart';

part 'get_generations_list_impl.g.dart';

abstract class GetGenerationsList {
  Future<Either<Failure, GenerationsList>> call();
}

@Injectable()
class GetGenerationsListImpl implements GetGenerationsList {
  final HomeRepository homeRepository;

  GetGenerationsListImpl(this.homeRepository);

  @override
  Future<Either<Failure, GenerationsList>> call() async {
    return homeRepository.loadGenerationsList();
  }
}
