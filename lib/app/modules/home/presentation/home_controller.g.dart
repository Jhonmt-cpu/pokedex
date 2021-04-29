// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeController = BindInject(
  (i) => HomeController(i<GetGenerationsList>(), i<LoadingDialog>()),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$generationsListAtom =
      Atom(name: '_HomeControllerBase.generationsList');

  @override
  GenerationsList get generationsList {
    _$generationsListAtom.reportRead();
    return super.generationsList;
  }

  @override
  set generationsList(GenerationsList value) {
    _$generationsListAtom.reportWrite(value, super.generationsList, () {
      super.generationsList = value;
    });
  }

  @override
  String toString() {
    return '''
generationsList: ${generationsList}
    ''';
  }
}
