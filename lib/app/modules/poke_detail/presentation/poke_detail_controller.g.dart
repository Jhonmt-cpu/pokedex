// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poke_detail_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $PokeDetailController = BindInject(
  (i) => PokeDetailController(
      i<GetPokemonEvolutionChain>(), i<GetPokemonSpecie>(), i<GetPokemon>()),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokeDetailController on _PokeDetailControllerBase, Store {
  final _$currentPokemonAtom =
      Atom(name: '_PokeDetailControllerBase.currentPokemon');

  @override
  Pokemon get currentPokemon {
    _$currentPokemonAtom.reportRead();
    return super.currentPokemon;
  }

  @override
  set currentPokemon(Pokemon value) {
    _$currentPokemonAtom.reportWrite(value, super.currentPokemon, () {
      super.currentPokemon = value;
    });
  }

  final _$specieAtom = Atom(name: '_PokeDetailControllerBase.specie');

  @override
  Specie get specie {
    _$specieAtom.reportRead();
    return super.specie;
  }

  @override
  set specie(Specie value) {
    _$specieAtom.reportWrite(value, super.specie, () {
      super.specie = value;
    });
  }

  final _$evolutionChainAtom =
      Atom(name: '_PokeDetailControllerBase.evolutionChain');

  @override
  EvolutionChain get evolutionChain {
    _$evolutionChainAtom.reportRead();
    return super.evolutionChain;
  }

  @override
  set evolutionChain(EvolutionChain value) {
    _$evolutionChainAtom.reportWrite(value, super.evolutionChain, () {
      super.evolutionChain = value;
    });
  }

  final _$pokemonColorAtom =
      Atom(name: '_PokeDetailControllerBase.pokemonColor');

  @override
  Color get pokemonColor {
    _$pokemonColorAtom.reportRead();
    return super.pokemonColor;
  }

  @override
  set pokemonColor(Color value) {
    _$pokemonColorAtom.reportWrite(value, super.pokemonColor, () {
      super.pokemonColor = value;
    });
  }

  final _$currentPositionAtom =
      Atom(name: '_PokeDetailControllerBase.currentPosition');

  @override
  int get currentPosition {
    _$currentPositionAtom.reportRead();
    return super.currentPosition;
  }

  @override
  set currentPosition(int value) {
    _$currentPositionAtom.reportWrite(value, super.currentPosition, () {
      super.currentPosition = value;
    });
  }

  final _$statsAtom = Atom(name: '_PokeDetailControllerBase.stats');

  @override
  List<Stats> get stats {
    _$statsAtom.reportRead();
    return super.stats;
  }

  @override
  set stats(List<Stats> value) {
    _$statsAtom.reportWrite(value, super.stats, () {
      super.stats = value;
    });
  }

  final _$spritesAtom = Atom(name: '_PokeDetailControllerBase.sprites');

  @override
  Sprites get sprites {
    _$spritesAtom.reportRead();
    return super.sprites;
  }

  @override
  set sprites(Sprites value) {
    _$spritesAtom.reportWrite(value, super.sprites, () {
      super.sprites = value;
    });
  }

  @override
  String toString() {
    return '''
currentPokemon: ${currentPokemon},
specie: ${specie},
evolutionChain: ${evolutionChain},
pokemonColor: ${pokemonColor},
currentPosition: ${currentPosition},
stats: ${stats},
sprites: ${sprites}
    ''';
  }
}
