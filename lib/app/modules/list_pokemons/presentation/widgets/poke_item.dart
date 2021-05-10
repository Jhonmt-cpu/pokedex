import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_modular/app/core/consts/consts_app.dart';
import 'package:pokedex_modular/app/core/pokemon/domain/entities/pokemon.dart';
import 'package:pokedex_modular/app/modules/list_pokemons/domain/entities/generation_detail.dart';
import 'package:pokedex_modular/app/modules/list_pokemons/presentation/list_pokemons_controller.dart';

class PokeItem extends StatefulWidget {
  final GenerationDetail generationDetail;
  final String name;
  final String url;
  final int index;

  const PokeItem({
    Key key,
    this.name,
    this.url,
    this.index,
    this.generationDetail,
  }) : super(key: key);

  @override
  _PokeItemState createState() => _PokeItemState();
}

class _PokeItemState extends ModularState<PokeItem, ListPokemonsController> {
  List<Types> types;
  Pokemon _pokemon;

  Future<Pokemon> loadPokemon(String url) async {
    var pokemon = await controller.fethPokemonItem(url);
    _pokemon = pokemon;
    types = pokemon.types;
    return pokemon;
  }

  Widget setTipos() {
    List<Widget> lista = [];
    types.forEach((slot) {
      lista.add(
        Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(80, 255, 255, 255)),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  slot.type.name.trim(),
                  style: TextStyle(
                      fontFamily: 'Google',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            )
          ],
        ),
      );
    });
    return Column(
      children: lista,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  @override
  Widget build(BuildContext context) {
    String nameWithFirstUpperCase =
        widget.name[0].toUpperCase() + widget.name.substring(1);
    var idWithWithThe2OfUrl = widget.url.replaceAll(new RegExp(r'[^0-9]'), '');
    var id = idWithWithThe2OfUrl.substring(1);
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: loadPokemon(widget.url),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return GestureDetector(
                onTap: () {
                  Modular.to.pushNamed('/poke-detail/${widget.index}',
                      arguments: [
                        _pokemon,
                        widget.generationDetail.pokemonSpecies
                      ]);
                },
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        ConstsApp.getColorType(type: types[0].type.name)
                            .withOpacity(0.7),
                        ConstsApp.getColorType(type: types[0].type.name)
                      ],
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      //alignment: Alignment.bottomRight,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Hero(
                            tag: widget.name + 'rotatition',
                            child: Opacity(
                              opacity: 0.2,
                              child: Image.asset(
                                ConstsApp.whitePokeball,
                                height: 80,
                                width: 80,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8, top: 8),
                              child: Text(
                                nameWithFirstUpperCase,
                                style: TextStyle(
                                    fontFamily: "Google",
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: setTipos(),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Hero(
                            tag: widget.name,
                            child: CachedNetworkImage(
                              alignment: Alignment.bottomRight,
                              height: 80,
                              width: 80,
                              placeholder: (context, url) => new Container(
                                color: Colors.transparent,
                              ),
                              imageUrl:
                                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.grey.withOpacity(0.7),
                      Colors.grey,
                    ],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    //alignment: Alignment.bottomRight,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Hero(
                          tag: widget.name + 'rotatition',
                          child: Opacity(
                            opacity: 0.2,
                            child: Image.asset(
                              ConstsApp.whitePokeball,
                              height: 80,
                              width: 80,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8, top: 8),
                            child: Text(
                              nameWithFirstUpperCase,
                              style: TextStyle(
                                  fontFamily: "Google",
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
