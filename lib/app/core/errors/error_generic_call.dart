import 'package:pokedex_modular/app/core/errors/errors.dart';

class ErrorGenericCall extends Failure {
  final String message;
  final dynamic exception;

  ErrorGenericCall(this.message, this.exception);
}
