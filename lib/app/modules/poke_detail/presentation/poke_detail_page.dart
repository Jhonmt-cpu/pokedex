import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_modular/app/core/consts/consts_app.dart';
import 'package:pokedex_modular/app/core/pokemon/domain/entities/pokemon.dart';
import 'package:pokedex_modular/app/modules/list_pokemons/domain/entities/generation_detail.dart';
import 'package:pokedex_modular/app/modules/poke_detail/presentation/poke_detail_controller.dart';
import 'package:pokedex_modular/app/modules/poke_detail/presentation/widgets/about.dart';
import 'package:simple_animations/simple_animations/controlled_animation.dart';
import 'package:simple_animations/simple_animations/multi_track_tween.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class PokeDetailPage extends StatefulWidget {
  final int index;
  final Pokemon pokemon;
  final List<NameUrl> pokemonSpeciesList;

  PokeDetailPage({
    Key key,
    this.index,
    this.pokemon,
    this.pokemonSpeciesList,
  }) : super(key: key);

  @override
  _PokeDetailPageState createState() => _PokeDetailPageState();
}

class _PokeDetailPageState
    extends ModularState<PokeDetailPage, PokeDetailController> {
  PageController _pageController;
  MultiTrackTween _animation;
  double _progress;
  double _multiple;
  double _opacity;
  double _opacityTitleAppBar;

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: widget.index, viewportFraction: 0.5);
    controller.setCurrentPokemon(index: widget.index, pokemon: widget.pokemon);
    _animation = MultiTrackTween(
      [
        Track("rotation").add(
          Duration(seconds: 6),
          Tween(begin: 0.0, end: 6.3),
          curve: Curves.linear,
        ),
      ],
    );
    _progress = 0;
    _multiple = 1;
    _opacity = 1;
    _opacityTitleAppBar = 0;
  }

  double interval(double lower, double upper, double progress) {
    assert(lower < upper);

    if (progress > upper) return 1.0;
    if (progress < lower) return 0.0;

    return ((progress - lower) / (upper - lower)).clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Observer(builder: (context) {
            String name = controller.currentPokemon.name;
            String nameWithFirstUpperCase =
                name[0].toUpperCase() + name.substring(1);
            return AnimatedContainer(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    controller.pokemonColor.withOpacity(0.7),
                    controller.pokemonColor,
                  ],
                ),
              ),
              duration: Duration(milliseconds: 300),
              child: Stack(
                children: [
                  AppBar(
                    centerTitle: true,
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    actions: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            ControlledAnimation(
                              playback: Playback.LOOP,
                              duration: _animation.duration,
                              tween: _animation,
                              builder: (context, animation) {
                                return Transform.rotate(
                                  angle: animation["rotation"],
                                  child: Opacity(
                                    opacity:
                                        _opacityTitleAppBar >= 0.2 ? 0.2 : 0.0,
                                    child: Image.asset(
                                      ConstsApp.whitePokeball,
                                      height: 50,
                                      width: 50,
                                    ),
                                  ),
                                );
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.favorite_border),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.12 -
                        _progress *
                            (MediaQuery.of(context).size.height * 0.071),
                    left: 20 +
                        _progress *
                            (MediaQuery.of(context).size.height * 0.071),
                    child: Text(
                      nameWithFirstUpperCase,
                      style: TextStyle(
                        fontFamily: 'Google',
                        fontSize: 38 -
                            _progress *
                                (MediaQuery.of(context).size.height * 0.011),
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: (MediaQuery.of(context).size.height * 0.16),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 20, top: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            setTipos(controller.currentPokemon.types),
                            Text(
                              '#' +
                                  controller.currentPokemon.id
                                      .toString()
                                      .padLeft(3, '0'),
                              style: TextStyle(
                                fontFamily: 'Google',
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
          SlidingSheet(
            listener: (state) {
              setState(() {
                _progress = state.progress;
                _multiple = 1 - interval(0.0, 0.87, _progress);
                _opacity = _multiple;
                _opacityTitleAppBar =
                    _multiple = interval(0.55, 0.87, _progress);
              });
            },
            elevation: 0,
            cornerRadius: 30,
            snapSpec: const SnapSpec(
              snap: true,
              snappings: [0.60, 0.87],
              positioning: SnapPositioning.relativeToAvailableSpace,
            ),
            builder: (context, state) {
              return Container(
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).size.height * 0.12,
                child: About(),
              );
            },
          ),
          Opacity(
            opacity: _opacity,
            child: Padding(
              padding: EdgeInsets.only(
                  top: _opacityTitleAppBar == 1
                      ? 1000
                      : (MediaQuery.of(context).size.height * 0.25) -
                          _progress * 50),
              child: SizedBox(
                height: 200,
                child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (index) {
                    controller.specie = null;
                    controller.stats = null;
                    controller.evolutionChain = null;
                    controller.sprites = null;

                    var url = widget.pokemonSpeciesList[index].url;

                    controller.setCurrentPokemon(
                      index: index,
                      url: url,
                    );
                  },
                  itemCount: widget.pokemonSpeciesList.length,
                  itemBuilder: (BuildContext context, int index) {
                    var nameAndUrl = widget.pokemonSpeciesList[index];
                    var idWithWithThe2OfUrl =
                        nameAndUrl.url.replaceAll(new RegExp(r'[^0-9]'), '');
                    var id = idWithWithThe2OfUrl.substring(1);
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        ControlledAnimation(
                          playback: Playback.LOOP,
                          duration: _animation.duration,
                          tween: _animation,
                          builder: (context, animation) {
                            return Transform.rotate(
                              angle: animation["rotation"],
                              child: AnimatedOpacity(
                                opacity: index == controller.currentPosition
                                    ? 0.2
                                    : 0, //_pokeitem.name + 'rotatition',
                                duration: Duration(milliseconds: 200),
                                child: Image.asset(
                                  ConstsApp.whitePokeball,
                                  height: 270,
                                  width: 270,
                                ),
                              ),
                            );
                          },
                        ),
                        IgnorePointer(
                          child: Observer(
                            name: 'Pokemon',
                            builder: (context) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  AnimatedPadding(
                                    duration: Duration(milliseconds: 400),
                                    curve: Curves.easeIn,
                                    padding: EdgeInsets.only(
                                      top: index == controller.currentPosition
                                          ? 0
                                          : 60,
                                      bottom:
                                          index == controller.currentPosition
                                              ? 0
                                              : 60,
                                    ),
                                    child: Hero(
                                      tag: index == controller.currentPosition
                                          ? nameAndUrl.name
                                          : 'none' + index.toString(),
                                      child: CachedNetworkImage(
                                        height: 150,
                                        width: 150,
                                        placeholder: (context, url) =>
                                            new Container(
                                          color: Colors.transparent,
                                        ),
                                        color:
                                            index == controller.currentPosition
                                                ? null
                                                : Colors.black.withOpacity(0.5),
                                        imageUrl:
                                            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png",
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget setTipos(List<Types> types) {
    List<Widget> lista = [];
    types.forEach((slot) {
      lista.add(
        Row(
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
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              width: 8,
            )
          ],
        ),
      );
    });
    return Row(
      children: lista,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}
