// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_pokemons_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ListPokemonsController = BindInject(
  (i) => ListPokemonsController(
      i<GetPokemonsList>(), i<LoadingDialog>(), i<GetPokemon>()),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListPokemonsController on _ListPokemonsControllerBase, Store {
  final _$generationDetailAtom =
      Atom(name: '_ListPokemonsControllerBase.generationDetail');

  @override
  GenerationDetail get generationDetail {
    _$generationDetailAtom.reportRead();
    return super.generationDetail;
  }

  @override
  set generationDetail(GenerationDetail value) {
    _$generationDetailAtom.reportWrite(value, super.generationDetail, () {
      super.generationDetail = value;
    });
  }

  @override
  String toString() {
    return '''
generationDetail: ${generationDetail}
    ''';
  }
}
