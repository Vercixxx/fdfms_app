import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade200,
    primary: Color.fromARGB(255, 12, 136, 95),
    secondary: Color.fromARGB(255, 255, 229, 180),
    tertiary: Colors.grey.shade300,
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade900,
    primary: Color.fromARGB(255, 12, 136, 95),
    secondary: Color.fromARGB(255, 255, 229, 180),
    tertiary: Colors.grey.shade800,
  ),
);
