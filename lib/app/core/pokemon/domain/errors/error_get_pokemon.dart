import 'package:pokedex_modular/app/core/errors/errors.dart';

class ErrorGetPokemons extends Failure {
  final String message;
  ErrorGetPokemons({this.message});
}
