import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pokedex_modular/app/core/consts/consts_app.dart';
import 'package:pokedex_modular/app/modules/list_pokemons/domain/entities/generation_detail.dart';
import 'widgets/app_bar_list_pokemons.dart';
import 'widgets/poke_item.dart';
import 'package:pokedex_modular/app/modules/list_pokemons/presentation/list_pokemons_controller.dart';

class ListPokemonsPage extends StatefulWidget {
  final String generationId;

  const ListPokemonsPage({Key key, this.generationId}) : super(key: key);
  @override
  _ListPokemonsPageState createState() => _ListPokemonsPageState();
}

class _ListPokemonsPageState
    extends ModularState<ListPokemonsPage, ListPokemonsController> {
  @override
  void initState() {
    super.initState();
    if (controller.generationDetail == null) {
      controller.fetchPokemonList(widget.generationId);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double statusHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: <Widget>[
          Positioned(
            top: MediaQuery.of(context).padding.top - 240 / 2.9,
            left: screenWidth - (240 / 1.6),
            child: Opacity(
              opacity: 0.1,
              child: Image.asset(
                ConstsApp.blackPokeball,
                height: 240,
                width: 240,
              ),
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: statusHeight,
                ),
                AppBarListPokemons(),
                Expanded(
                  child: Container(
                    child: Observer(
                      name: 'PokemonListPage',
                      builder: (BuildContext context) {
                        return (controller.generationDetail != null)
                            ? AnimationLimiter(
                                child: GridView.builder(
                                  physics: BouncingScrollPhysics(),
                                  padding: EdgeInsets.all(12),
                                  addAutomaticKeepAlives: true,
                                  gridDelegate:
                                      new SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                  ),
                                  itemCount: controller
                                      .generationDetail.pokemonSpecies.length,
                                  itemBuilder: (BuildContext context, int i) {
                                    controller.generationDetail.pokemonSpecies
                                        .sort(
                                      (a, b) {
                                        var idWithWithThe2OfUrlA = a.url
                                            .replaceAll(
                                                new RegExp(r'[^0-9]'), '');
                                        var idWithWithThe2OfUrlB = b.url
                                            .replaceAll(
                                                new RegExp(r'[^0-9]'), '');
                                        var aNumber =
                                            int.parse(idWithWithThe2OfUrlA);
                                        var bNumber =
                                            int.parse(idWithWithThe2OfUrlB);
                                        return aNumber.compareTo(bNumber);
                                      },
                                    );

                                    NameUrl pokemon = controller
                                        .generationDetail.pokemonSpecies[i];
                                    return AnimationConfiguration.staggeredGrid(
                                      position: i,
                                      duration:
                                          const Duration(milliseconds: 375),
                                      columnCount: 2,
                                      child: ScaleAnimation(
                                        child: GestureDetector(
                                          child: PokeItem(
                                            name: pokemon.name,
                                            url: pokemon.url,
                                            index: i,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            : Center();
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
