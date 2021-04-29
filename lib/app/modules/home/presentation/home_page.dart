import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pokedex_modular/app/core/consts/consts_app.dart';
import 'package:pokedex_modular/app/modules/home/presentation/home_controller.dart';
import 'widgets/app_bar_home.dart';
import 'widgets/generation_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  void initState() {
    super.initState();
    if (controller.generationsList == null) {
      controller.fetchGenerationsList();
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
                AppBarHome(),
                Expanded(
                  child: Container(
                    child: Observer(
                      name: 'ListaHomePage',
                      builder: (BuildContext context) {
                        return (controller.generationsList != null)
                            ? AnimationLimiter(
                                child: ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  padding: EdgeInsets.all(12),
                                  addAutomaticKeepAlives: true,
                                  itemCount:
                                      controller.generationsList.results.length,
                                  itemBuilder: (BuildContext context, int i) {
                                    return AnimationConfiguration.staggeredGrid(
                                      position: i,
                                      duration:
                                          const Duration(milliseconds: 375),
                                      columnCount: 2,
                                      child: ScaleAnimation(
                                        child: GenerationItem(
                                          name: controller
                                              .generationsList.results[i].name,
                                          url: controller
                                              .generationsList.results[i].url,
                                          index: i,
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
