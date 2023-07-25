import 'package:flutter/material.dart';

import '/common/app_config.dart';

class ThemeProvider extends ChangeNotifier {
  bool get isDarkMode => AppConfig.isDarkMode;
  set isDarkMode(bool value) {
    AppConfig.setDarkMode(value).then((_) => notifyListeners());
  }

  Color get seedColor => AppConfig.seedColor;
  set seedColor(Color value) {
    AppConfig.setSeedColor(value).then((_) => notifyListeners());
  }
}
