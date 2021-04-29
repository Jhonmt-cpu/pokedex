import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_modular/app/modules/poke_detail/presentation/poke_detail_controller.dart';

class AboutProgressCircular extends StatelessWidget {
  final pokeDetailController = Modular.get<PokeDetailController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: SizedBox(
          height: 15,
          width: 15,
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(
                pokeDetailController.pokemonColor),
          ),
        ),
      ),
    );
  }
}
