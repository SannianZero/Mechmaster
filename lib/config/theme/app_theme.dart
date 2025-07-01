import 'package:flutter/material.dart';

const customColor = Color.fromARGB(255, 214, 51, 51);

const List<Color> colorList = [
  customColor,
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.yellow,
  Colors.purple,
];

class AppTheme {
  int selector = 0;

  AppTheme({required this.selector})
  :assert(selector >= 0, "El selector debe ser mayor o igual a 0");

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: colorList[selector],
      );
}