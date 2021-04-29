import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_modular/app/modules/home/presentation/home_controller.dart';
import 'package:pokedex_modular/app/modules/home/infra/repositories/home_repository_impl.dart';
import 'package:pokedex_modular/app/modules/home/presentation/home_page.dart';

import 'domain/usecases/get_generations_list_impl.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    $HomeRepositoryImpl,
    $HomeController,
    $GetGenerationsListImpl
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/", child: (context, args) => HomePage()),
  ];
}
