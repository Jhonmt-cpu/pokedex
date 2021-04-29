import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:mobx/mobx.dart';
import 'package:pokedex_modular/app/core/utils/loading_dialog.dart';
import 'package:pokedex_modular/app/modules/home/domain/entities/generations_list.dart';
import 'package:pokedex_modular/app/modules/home/domain/usecases/get_generations_list_impl.dart';
part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final GetGenerationsList getGenerationsList;
  final LoadingDialog loading;

  _HomeControllerBase(this.getGenerationsList, this.loading);

  @observable
  GenerationsList generationsList;

  fetchGenerationsList() async {
    generationsList = null;
    await Future.delayed(Duration(milliseconds: 500));
    loading.show();
    var response = await getGenerationsList();
    loading.hide();
    response.fold(
        (failure) => asuka.showSnackBar(
              SnackBar(
                content: Text(failure.message),
                duration: Duration(seconds: 3),
              ),
            ),
        (generations) => generationsList = generations);
  }
}
