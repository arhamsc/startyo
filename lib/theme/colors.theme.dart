import 'package:flutter/material.dart';
import 'package:startyo/theme/text.theme.dart';

class Palette {
  static const MaterialColor textColor = MaterialColor(
    0xFF565656,
    <int, Color>{
      50: Color.fromRGBO(86, 86, 86, .1),
      100: Color.fromRGBO(86, 86, 86, .2),
      200: Color.fromRGBO(86, 86, 86, .3),
      300: Color.fromRGBO(86, 86, 86, .4),
      400: Color.fromRGBO(86, 86, 86, .5),
      500: Color.fromRGBO(86, 86, 86, .6),
      600: Color.fromRGBO(86, 86, 86, .7),
      700: Color.fromRGBO(86, 86, 86, .8),
      800: Color.fromRGBO(86, 86, 86, .9),
      900: Color.fromRGBO(86, 86, 86, 1),
    },
  );
  static const MaterialColor primary = MaterialColor(
    0xFF006A6A,
    <int, Color>{
      50: Color.fromRGBO(0, 106, 106, .1),
      100: Color.fromRGBO(0, 106, 106, .2),
      200: Color.fromRGBO(0, 106, 106, .3),
      300: Color.fromRGBO(0, 106, 106, .4),
      400: Color.fromRGBO(0, 106, 106, .5),
      500: Color.fromRGBO(0, 106, 106, .6),
      600: Color.fromRGBO(0, 106, 106, .7),
      700: Color.fromRGBO(0, 106, 106, .8),
      800: Color.fromRGBO(0, 106, 106, .9),
      900: Color.fromRGBO(0, 106, 106, 1),
    },
  );
  static const MaterialColor secondary = MaterialColor(
    0xFF006A6A,
    <int, Color>{
      50: Color.fromRGBO(86, 86, 86, .1),
      100: Color.fromRGBO(86, 86, 86, .2),
      200: Color.fromRGBO(86, 86, 86, .3),
      300: Color.fromRGBO(86, 86, 86, .4),
      400: Color.fromRGBO(86, 86, 86, .5),
      500: Color.fromRGBO(86, 86, 86, .6),
      600: Color.fromRGBO(86, 86, 86, .7),
      700: Color.fromRGBO(86, 86, 86, .8),
      800: Color.fromRGBO(86, 86, 86, .9),
      900: Color.fromRGBO(86, 86, 86, 1),
    },
  );
  static const MaterialColor tertiary = MaterialColor(
    0xFFFCF6FF,
    <int, Color>{
      50: Color.fromRGBO(255, 252, 246, .1),
      100: Color.fromRGBO(255, 252, 246, .2),
      200: Color.fromRGBO(255, 252, 246, .3),
      300: Color.fromRGBO(255, 252, 246, .4),
      400: Color.fromRGBO(255, 252, 246, .5),
      500: Color.fromRGBO(255, 252, 246, .6),
      600: Color.fromRGBO(255, 252, 246, .7),
      700: Color.fromRGBO(255, 252, 246, .8),
      800: Color.fromRGBO(255, 252, 246, .9),
      900: Color.fromRGBO(255, 252, 246, 1),
    },
  );
  static const MaterialColor heading = MaterialColor(
    0xFF333333,
    <int, Color>{
      50: Color.fromRGBO(51, 51, 51, .1),
      100: Color.fromRGBO(51, 51, 51, .2),
      200: Color.fromRGBO(51, 51, 51, .3),
      300: Color.fromRGBO(51, 51, 51, .4),
      400: Color.fromRGBO(51, 51, 51, .5),
      500: Color.fromRGBO(51, 51, 51, .6),
      600: Color.fromRGBO(51, 51, 51, .7),
      700: Color.fromRGBO(51, 51, 51, .8),
      800: Color.fromRGBO(51, 51, 51, .9),
      900: Color.fromRGBO(51, 51, 51, 1),
    },
  );
}

class AppBarThemes {
  static AppBarTheme appBarTheme() {
    return const AppBarTheme(
      iconTheme: IconThemeData(color: Palette.primary, size: 24),
      backgroundColor: Palette.secondary,
      centerTitle: false,
    );
  }

  static BottomAppBarTheme bottomNav() {
    return const BottomAppBarTheme(
      color: Palette.secondary,
    );
  }
}
