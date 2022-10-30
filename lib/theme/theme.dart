import 'package:flutter/material.dart';
import 'package:netflix/theme/colors.dart';

var theme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
    ),
    textTheme: const TextTheme(
        subtitle1: TextStyle(fontSize: 20, color: Colors.white),
        caption: TextStyle(fontSize: 14, color: Colors.white)));
