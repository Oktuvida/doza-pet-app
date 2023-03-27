import 'package:flutter/material.dart';

final ThemeData lightThemeData = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.light,
        seedColor: const Color.fromARGB(255, 184, 166, 72)));

final ThemeData darkThemeData = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: const Color.fromARGB(255, 184, 166, 72)));

//rgb(184, 166, 72)