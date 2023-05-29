import 'package:flutter/material.dart';

abstract class ThemeConstants {
  static final ThemeData light = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
          seedColor: const Color.fromRGBO(254, 150, 199, 1)));

  static final ThemeData dark = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: const Color.fromRGBO(254, 150, 199, 1)));
}
