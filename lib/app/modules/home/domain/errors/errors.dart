import 'package:pokedex_modular/app/core/errors/errors.dart';

class ErrorGetGeneratonsList extends Failure {
  final String message;
  ErrorGetGeneratonsList({this.message});
}
