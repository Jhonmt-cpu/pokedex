import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_modular/app/modules/poke_detail/domain/entities/specie.dart';
import 'package:pokedex_modular/app/modules/poke_detail/presentation/poke_detail_controller.dart';

import 'about_pogress_circular.dart';

class AboutTab extends StatelessWidget {
  final pokeDetailController = Modular.get<PokeDetailController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Observer(
              builder: (context) {
                Specie _specie = pokeDetailController.specie;
                return SizedBox(
                  height: 70,
                  child: SingleChildScrollView(
                    child: _specie != null
                        ? Text(
                            _specie.flavorTextEntries
                                .where((item) => item.language.name == 'en')
                                .first
                                .flavorText
                                .replaceAll('\n', ' '),
                          )
                        : AboutProgressCircular(),
                  ),
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Biology',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 200),
              child: Observer(builder: (context) {
                int height = pokeDetailController.currentPokemon.height;
                String heightMeters = (height * 0.1).toStringAsFixed(2);
                int weight = pokeDetailController.currentPokemon.weight;
                String weightKilograms = (weight * 0.1).toStringAsFixed(2);
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Height',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                        Text(
                          heightMeters + ' m',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Weight',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                        Text(
                          weightKilograms + ' kg',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
