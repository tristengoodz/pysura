import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ThemeController extends GetxController {
  static ThemeController instance = Get.find();

  final _isDarkMode = true.obs;
  bool get isDarkMode => _isDarkMode.value;
  set isDarkMode(bool value) => _isDarkMode.value = value;

  final _seedColor = Rx<Color>(Colors.blue);
  Color get seedColor => _seedColor.value;
  set seedColor(Color value) => _seedColor.value = value;
}
