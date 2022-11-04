import 'package:flutter/material.dart';

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
