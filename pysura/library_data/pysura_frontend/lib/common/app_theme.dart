import 'dart:math';

import 'package:flutter/material.dart';

class AppTheme {
  static int tintValue(int value, double factor) =>
      max(0, min((value + ((255 - value) * factor)).round(), 255));

  static Color tintColor(Color color, double factor) => Color.fromRGBO(
      tintValue(color.red, factor),
      tintValue(color.green, factor),
      tintValue(color.blue, factor),
      1);

  static int shadeValue(int value, double factor) =>
      max(0, min(value - (value * factor).round(), 255));

  static Color shadeColor(Color color, double factor) => Color.fromRGBO(
      shadeValue(color.red, factor),
      shadeValue(color.green, factor),
      shadeValue(color.blue, factor),
      1);

  static MaterialColor generateMaterialColor(Color color) {
    return MaterialColor(
      color.value,
      {
        50: tintColor(color, 0.9),
        100: tintColor(color, 0.8),
        200: tintColor(color, 0.6),
        300: tintColor(color, 0.4),
        400: tintColor(color, 0.2),
        500: color,
        600: shadeColor(color, 0.1),
        700: shadeColor(color, 0.2),
        800: shadeColor(color, 0.3),
        900: shadeColor(color, 0.4),
      },
    );
  }

  static ThemeData fromSeedColor(
    Color color, {
    bool darkMode = false,
  }) {
    final MaterialColor materialColor = generateMaterialColor(color);
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: materialColor,
      brightness: darkMode ? Brightness.dark : Brightness.light,
    );
  }

  static prepForThemeRefresh(BuildContext context) {
    Theme.of(context).colorScheme;
    Theme.of(context).textTheme;
  }
}
