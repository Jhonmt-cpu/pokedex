import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_modular/app/core/pokemon/domain/entities/pokemon.dart';

class GetSprites {
  static List<Widget> getSprites(Sprites sprites) {
    List<Widget> _list = [];

    if (sprites.backDefault != null) {
      _list.add(
        CachedNetworkImage(
          alignment: Alignment.center,
          height: 80,
          width: 80,
          placeholder: (context, url) => new Container(
            color: Colors.transparent,
          ),
          imageUrl: sprites.backDefault,
        ),
      );
    }

    if (sprites.backFemale != null) {
      _list.add(
        CachedNetworkImage(
          alignment: Alignment.center,
          height: 80,
          width: 80,
          placeholder: (context, url) => new Container(
            color: Colors.transparent,
          ),
          imageUrl: sprites.backFemale,
        ),
      );
    }

    if (sprites.backShiny != null) {
      _list.add(
        CachedNetworkImage(
          alignment: Alignment.center,
          height: 80,
          width: 80,
          placeholder: (context, url) => new Container(
            color: Colors.transparent,
          ),
          imageUrl: sprites.backShiny,
        ),
      );
    }

    if (sprites.backShinyFemale != null) {
      _list.add(
        CachedNetworkImage(
          alignment: Alignment.center,
          height: 80,
          width: 80,
          placeholder: (context, url) => new Container(
            color: Colors.transparent,
          ),
          imageUrl: sprites.backShinyFemale,
        ),
      );
    }

    if (sprites.frontDefault != null) {
      _list.add(
        CachedNetworkImage(
          alignment: Alignment.center,
          height: 80,
          width: 80,
          placeholder: (context, url) => new Container(
            color: Colors.transparent,
          ),
          imageUrl: sprites.frontDefault,
        ),
      );
    }

    if (sprites.frontFemale != null) {
      _list.add(
        CachedNetworkImage(
          alignment: Alignment.center,
          height: 80,
          width: 80,
          placeholder: (context, url) => new Container(
            color: Colors.transparent,
          ),
          imageUrl: sprites.frontFemale,
        ),
      );
    }

    if (sprites.frontShiny != null) {
      _list.add(
        CachedNetworkImage(
          alignment: Alignment.center,
          height: 80,
          width: 80,
          placeholder: (context, url) => new Container(
            color: Colors.transparent,
          ),
          imageUrl: sprites.frontShiny,
        ),
      );
    }

    if (sprites.frontShinyFemale != null) {
      _list.add(
        CachedNetworkImage(
          alignment: Alignment.center,
          height: 80,
          width: 80,
          placeholder: (context, url) => new Container(
            color: Colors.transparent,
          ),
          imageUrl: sprites.frontShinyFemale,
        ),
      );
    }

    return _list;
  }
}
