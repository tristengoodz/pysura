import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppColor {
  static Color get primary => Theme.of(Get.context!).colorScheme.primary;
  static Color get onPrimary => Theme.of(Get.context!).colorScheme.onPrimary;
  static Color get secondary => Theme.of(Get.context!).colorScheme.secondary;
  static Color get onSecondary =>
      Theme.of(Get.context!).colorScheme.onSecondary;
  static Color get tertiary => Theme.of(Get.context!).colorScheme.tertiary;
  static Color get onTertiary => Theme.of(Get.context!).colorScheme.onTertiary;
  static Color get error => Theme.of(Get.context!).colorScheme.error;
  static Color get onError => Theme.of(Get.context!).colorScheme.onError;
  static Color get background => Theme.of(Get.context!).colorScheme.background;
  static Color get onBackground =>
      Theme.of(Get.context!).colorScheme.onBackground;
  static Color get surface => Theme.of(Get.context!).colorScheme.surface;
  static Color get onSurface => Theme.of(Get.context!).colorScheme.onSurface;

  static const Color white = Colors.white;
}
