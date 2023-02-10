import 'package:flutter/material.dart';
import 'package:netflix/theme/colors.dart';

class LegendColor {
  final Color textColor;
  final Color bgColor;
  final String name;

  const LegendColor(
      {required this.textColor, required this.bgColor, required this.name});

  @override
  String toString() {
    return name;
  }
}

class LegendsColors {
  static LegendColor branco = const LegendColor(
    bgColor: Colors.black,
    textColor: Colors.white,
    name: "Branco",
  );

  static LegendColor preto = const LegendColor(
    bgColor: Colors.white,
    textColor: Colors.black,
    name: "Preto",
  );

  static List<LegendColor> toArray() {
    return [
      branco,
      preto,
    ];
  }
}

enum TextShadow {
  none,
  shadow,
  above,
  down,
  uniform,
}

extension TextShadowU on TextShadow {
  String getString() {
    switch (this) {
      case TextShadow.above:
        return "Acima";
      case TextShadow.down:
        return "Abaixo";
      case TextShadow.none:
        return "Nenhuma";
      case TextShadow.shadow:
        return "Sombra";
      case TextShadow.uniform:
        return "Uniforme";
      default:
        return "";
    }
  }
}

enum BordFillColor {
  none,
  white,
  black,
  red,
  green,
  blue,
  yellow,
  magent,
  cian,
}

extension BordFillColorU on BordFillColor {
  static List<BordFillColor> valuesWithoutNone() {
    return [
      BordFillColor.white,
      BordFillColor.black,
      BordFillColor.red,
      BordFillColor.green,
      BordFillColor.blue,
      BordFillColor.yellow,
      BordFillColor.magent,
      BordFillColor.cian,
    ];
  }

  Color toColor() {
    switch (this) {
      case BordFillColor.none:
        return NetflixColors.grey;
      case BordFillColor.white:
        return Colors.white;
      case BordFillColor.black:
        return Colors.black;
      case BordFillColor.red:
        return Colors.red;
      case BordFillColor.green:
        return Colors.green;
      case BordFillColor.blue:
        return Colors.blue;
      case BordFillColor.yellow:
        return Colors.yellow;
      case BordFillColor.magent:
        return const Color.fromRGBO(255, 0, 255, 1);
      case BordFillColor.cian:
        return const Color.fromRGBO(224, 255, 255, 1);
    }
  }

  String name() {
    switch (this) {
      case BordFillColor.none:
        return "Nenhuma";
      case BordFillColor.white:
        return "Branco";
      case BordFillColor.black:
        return "Preto";
      case BordFillColor.red:
        return "Vermelho";
      case BordFillColor.green:
        return "Verde";
      case BordFillColor.blue:
        return "Azul";
      case BordFillColor.yellow:
        return "Amarela";
      case BordFillColor.magent:
        return "Magenta";
      case BordFillColor.cian:
        return "Ciano";
    }
  }

  Color toTextColor() {
    switch (this) {
      case BordFillColor.none:
        return NetflixColors.white;
      case BordFillColor.white:
        return NetflixColors.black;
      case BordFillColor.black:
        return NetflixColors.white;
      case BordFillColor.red:
        return NetflixColors.white;
      case BordFillColor.green:
        return NetflixColors.black;
      case BordFillColor.blue:
        return NetflixColors.white;
      case BordFillColor.yellow:
        return NetflixColors.black;
      case BordFillColor.magent:
        return NetflixColors.white;
      case BordFillColor.cian:
        return NetflixColors.black;
    }
  }
}
