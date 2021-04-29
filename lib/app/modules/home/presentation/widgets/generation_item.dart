import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_modular/app/core/consts/consts_app.dart';
import 'package:pokedex_modular/app/modules/home/presentation/home_controller.dart';

class GenerationItem extends StatefulWidget {
  final String name;
  final String url;
  final int index;

  const GenerationItem({
    Key key,
    this.name,
    this.url,
    this.index,
  }) : super(key: key);

  @override
  _GenerationItemState createState() => _GenerationItemState();
}

class _GenerationItemState
    extends ModularState<GenerationItem, HomeController> {
  @override
  Widget build(BuildContext context) {
    String nameWithFirstUpperCase =
        widget.name[0].toUpperCase() + widget.name.substring(1);
    var idWithWithThe2OfUrl = widget.url.replaceAll(new RegExp(r'[^0-9]'), '');
    var id = idWithWithThe2OfUrl.substring(1);
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            Modular.to.pushNamed('/list-pokemons/$id');
          },
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  ConstsApp.getColorGeneration(generation: widget.index)
                      .withOpacity(0.7),
                  ConstsApp.getColorGeneration(generation: widget.index),
                ],
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Center(
                  child: Text(
                    nameWithFirstUpperCase,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
