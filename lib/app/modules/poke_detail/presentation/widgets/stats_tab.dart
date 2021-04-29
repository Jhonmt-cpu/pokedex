import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_modular/app/core/pokemon/domain/entities/pokemon.dart';

import '../poke_detail_controller.dart';
import 'about_pogress_circular.dart';

class StatsTab extends StatelessWidget {
  final pokeDetailController = Modular.get<PokeDetailController>();

  List<int> getPokemonStats(Pokemon pokemon) {
    List<int> list = [1, 2, 3, 4, 5, 6, 7];
    int sum = 0;
    pokemon.stats.forEach((element) {
      sum = sum + element.baseStat;
      switch (element.stat.name) {
        case 'speed':
          list[0] = element.baseStat;
          break;
        case 'special-defense':
          list[1] = element.baseStat;
          break;
        case 'special-attack':
          list[2] = element.baseStat;
          break;
        case 'defense':
          list[3] = element.baseStat;
          break;
        case 'attack':
          list[4] = element.baseStat;
          break;
        case 'hp':
          list[5] = element.baseStat;
          break;
      }
    });
    list[6] = sum;

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      List<int> _list = getPokemonStats(pokeDetailController.currentPokemon);
      return pokeDetailController.stats != null
          ? Container(
              height: 200,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Speed',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Sp. Def',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Sp. Att',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Defense',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Attack',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'HP',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Total',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Text(
                            _list[0].toString(),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            _list[1].toString(),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            _list[2].toString(),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            _list[3].toString(),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            _list[4].toString(),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            _list[5].toString(),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            _list[6].toString(),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          StatsBar(
                            widthFactor: _list[0] / 160,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          StatsBar(
                            widthFactor: _list[1] / 160,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          StatsBar(
                            widthFactor: _list[2] / 160,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          StatsBar(
                            widthFactor: _list[3] / 160,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          StatsBar(
                            widthFactor: _list[4] / 160,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          StatsBar(
                            widthFactor: _list[5] / 160,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          StatsBar(
                            widthFactor: _list[6] / 960,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          : AboutProgressCircular();
    });
  }
}

class StatsBar extends StatelessWidget {
  final double widthFactor;

  const StatsBar({Key key, this.widthFactor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 19,
      child: Center(
        child: Container(
          height: 4,
          width: MediaQuery.of(context).size.width * 0.57,
          alignment: Alignment.centerLeft,
          decoration: ShapeDecoration(
            shape: StadiumBorder(),
            color: Colors.grey,
          ),
          child: FractionallySizedBox(
            widthFactor: widthFactor,
            heightFactor: 1.0,
            child: Container(
              decoration: ShapeDecoration(
                shape: StadiumBorder(),
                color: widthFactor > 0.5 ? Colors.teal : Colors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
