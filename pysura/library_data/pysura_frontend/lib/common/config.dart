import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'config.g.dart';

@HiveType(typeId: 0)
class Config {
  static const String boxName = 'config';

  @HiveField(0)
  bool isDarkMode = true;

  @HiveField(1)
  int seedColor = Colors.blue.value;
}
