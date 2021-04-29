import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_modular/app/modules/poke_detail/domain/entities/evolution_chain.dart';

import '../poke_detail_controller.dart';
import 'about_pogress_circular.dart';

class EvolutionTab extends StatelessWidget {
  final pokeDetailController = Modular.get<PokeDetailController>();

  Widget resizePokemon(Widget widget) {
    return SizedBox(
      height: 80,
      width: 80,
      child: widget,
    );
  }

  List<Widget> getEvolution() {
    List<Widget> _list = [];
    Chain _chain = pokeDetailController.evolutionChain.chain;
    if (_chain != null) {
      String nameWithFirstUpperCase = _chain.species.name[0].toUpperCase() +
          _chain.species.name.substring(1);
      var idWithWithThe2OfUrl =
          _chain.species.url.replaceAll(new RegExp(r'[^0-9]'), '');
      var id = idWithWithThe2OfUrl.substring(1);
      _list.add(
        resizePokemon(
          pokeDetailController.getImage(id: id),
        ),
      );
      _list.add(
        Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
            bottom: 8.0,
          ),
          child: Text(
            nameWithFirstUpperCase,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
      if (_chain.evolvesTo.isNotEmpty) {
        _list.add(Icon(Icons.keyboard_arrow_down));
        List<Widget> _scrollList = [];
        _chain.evolvesTo.forEach((element) {
          String nameWithFirstUpperCase =
              element.species.name[0].toUpperCase() +
                  element.species.name.substring(1);
          var idWithWithThe2OfUrl =
              element.species.url.replaceAll(new RegExp(r'[^0-9]'), '');
          var id = idWithWithThe2OfUrl.substring(1);
          _scrollList.add(Column(
            children: [
              resizePokemon(
                pokeDetailController.getImage(id: id),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  bottom: 8.0,
                ),
                child: Text(
                  nameWithFirstUpperCase,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ));
        });

        _list.add(
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _scrollList,
            ),
          ),
        );
        if (_chain.evolvesTo[0].evolvesTo.isNotEmpty) {
          _chain.evolvesTo[0].evolvesTo.forEach((element) {
            String nameWithFirstUpperCase =
                element.species.name[1].toUpperCase() +
                    element.species.name.substring(1);
            var idWithWithThe2OfUrl =
                element.species.url.replaceAll(new RegExp(r'[^0-9]'), '');
            var id = idWithWithThe2OfUrl.substring(1);
            _list.add(Icon(Icons.keyboard_arrow_down));
            _list.add(
              resizePokemon(
                pokeDetailController.getImage(id: id),
              ),
            );
            _list.add(
              Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  bottom: 8.0,
                ),
                child: Text(
                  nameWithFirstUpperCase,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          });
        }
      }
    }

    return _list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Observer(builder: (context) {
          return pokeDetailController.evolutionChain != null
              ? SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: getEvolution(),
                  ),
                )
              : AboutProgressCircular();
        }),
      ),
    );
  }
}
