import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'config.dart';

class AppConfig {
  // init hive
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ConfigAdapter());
    await Hive.openBox<Config>(Config.boxName);
  }

  // get config
  static Config? get config {
    final box = Hive.box<Config>(Config.boxName);
    try {
      return box.get(0, defaultValue: Config());
    } catch (e) {
      return Config();
    }
  }

  // save config
  static Future<void> save(Config config) async {
    final box = Hive.box<Config>(Config.boxName);
    try {
      await box.putAt(0, config);
    } catch (e) {
      box.put(0, config);
    }
  }

  // set light/dark mode
  static Future<void> setDarkMode(bool isDarkMode) async {
    final config = AppConfig.config ?? Config();
    config.isDarkMode = isDarkMode;
    await AppConfig.save(config);
  }

  // get light/dark mode
  static bool get isDarkMode {
    final config = AppConfig.config ?? Config();
    return config.isDarkMode;
  }

  // set seed color
  static Future<void> setSeedColor(Color seedColor) async {
    final config = AppConfig.config ?? Config();
    config.seedColor = seedColor.value;
    await AppConfig.save(config);
  }

  // get seed color
  static Color get seedColor {
    final config = AppConfig.config ?? Config();
    return Color(config.seedColor);
  }
}
