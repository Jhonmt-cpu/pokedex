import 'package:pokedex_modular/app/core/errors/errors.dart';

class ErrorGetSpecie extends Failure {
  final String message;
  ErrorGetSpecie({this.message});
}

class ErrorGetEvolutionChain extends Failure {
  final String message;
  ErrorGetEvolutionChain({this.message});
}
