import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pokedex_modular/app/modules/poke_detail/infra/utils/get_sprites.dart';

import '../poke_detail_controller.dart';
import 'about_pogress_circular.dart';

class SpritesTab extends StatelessWidget {
  final pokeDetailController = Modular.get<PokeDetailController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Container(
          child: Observer(
            name: 'ListaHomePage',
            builder: (BuildContext context) {
              return (pokeDetailController.sprites != null)
                  ? AnimationLimiter(
                      child: GridView.builder(
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.all(12),
                        addAutomaticKeepAlives: true,
                        gridDelegate:
                            new SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount:
                            GetSprites.getSprites(pokeDetailController.sprites)
                                .length,
                        itemBuilder: (BuildContext context, int i) {
                          return AnimationConfiguration.staggeredGrid(
                            position: i,
                            duration: const Duration(milliseconds: 375),
                            columnCount: 2,
                            child: ScaleAnimation(
                              child: GetSprites.getSprites(
                                  pokeDetailController.sprites)[i],
                            ),
                          );
                        },
                      ),
                    )
                  : Center(
                      child: AboutProgressCircular(),
                    );
            },
          ),
        ),
      ),
    );
  }
}
