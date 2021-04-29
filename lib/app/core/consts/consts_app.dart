import 'package:flutter/material.dart';

class ConstsApp {
  static const whitePokeball = "assets/images/pokeball.png";
  static const blackPokeball = "assets/images/pokeball_dark.png";

  static Color getColorType({String type}) {
    switch (type) {
      case 'normal':
        return Colors.brown[400];
        break;
      case 'fire':
        return Colors.red;
        break;
      case 'water':
        return Colors.blue;
        break;
      case 'grass':
        return Colors.green;
        break;
      case 'electric':
        return Colors.amber;
        break;
      case 'ice':
        return Colors.cyanAccent[400];
        break;
      case 'fighting':
        return Colors.orange;
        break;
      case 'poison':
        return Colors.purple;
        break;
      case 'ground':
        return Colors.orange[300];
        break;
      case 'flying':
        return Colors.indigo[200];
        break;
      case 'psychic':
        return Colors.pink;
        break;
      case 'bug':
        return Colors.lightGreen[500];
        break;
      case 'rock':
        return Colors.grey;
        break;
      case 'ghost':
        return Colors.indigo[400];
        break;
      case 'dark':
        return Colors.brown;
        break;
      case 'dragon':
        return Colors.indigo[800];
        break;
      case 'steel':
        return Colors.blueGrey;
        break;
      case 'fairy':
        return Colors.pinkAccent[100];
        break;
      default:
        return Colors.grey;
        break;
    }
  }

  static Color getColorGeneration({int generation}) {
    switch (generation) {
      case 0:
        return Colors.lightGreen[500];
        break;
      case 1:
        return Colors.green;
        break;
      case 2:
        return Colors.blue;
        break;
      case 3:
        return Colors.cyanAccent[400];
        break;
      case 4:
        return Colors.amber;
        break;
      case 5:
        return Colors.orange;
        break;
      case 6:
        return Colors.red;
        break;
      case 7:
        return Colors.indigo[400];
        break;
      default:
        return Colors.grey;
        break;
    }
  }
}
