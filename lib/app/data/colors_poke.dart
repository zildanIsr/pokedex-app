import 'package:flutter/material.dart';

class ColorsPoke {
  static Color getColors(String type) {
    switch (type) {
      case "grass":
        return Colors.greenAccent;
      case "fire":
        return Colors.redAccent;
      case "water":
        return Colors.blue;
      case "poison":
        return Colors.deepPurpleAccent;
      case "electric":
        return Colors.amber;
      case "rock":
        return Colors.grey;
      case "ground":
        return Colors.brown;
      case "psychic":
        return Colors.indigo;
      case "fighting":
        return Colors.orange;
      case "bug":
        return Colors.green.shade300;
      case "ghost":
        return Colors.deepPurple;
      case "normal":
        return Colors.blueGrey;
      default:
        return Colors.pink;
    }
  }
}
