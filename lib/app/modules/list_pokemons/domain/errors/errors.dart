import 'package:pokedex_modular/app/core/errors/errors.dart';

class ErrorGetPokemonsList extends Failure {
  final String message;
  ErrorGetPokemonsList({this.message});
}
