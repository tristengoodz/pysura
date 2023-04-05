import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';

class AppTextStyle {
  static TextStyle get displayLarge =>
      Theme.of(Get.context!).textTheme.displayLarge!;
  static TextStyle get displayMedium =>
      Theme.of(Get.context!).textTheme.displayMedium!;
  static TextStyle get displaySmall =>
      Theme.of(Get.context!).textTheme.displaySmall!;

  static TextStyle get headlineLarge =>
      Theme.of(Get.context!).textTheme.headlineLarge!;
  static TextStyle get headlineMedium =>
      Theme.of(Get.context!).textTheme.headlineMedium!;
  static TextStyle get headlineSmall =>
      Theme.of(Get.context!).textTheme.headlineSmall!;

  static TextStyle get titleLarge =>
      Theme.of(Get.context!).textTheme.titleLarge!;
  static TextStyle get titleMedium =>
      Theme.of(Get.context!).textTheme.titleMedium!;
  static TextStyle get titleSmall =>
      Theme.of(Get.context!).textTheme.titleSmall!;

  static TextStyle get bodyLarge => Theme.of(Get.context!).textTheme.bodyLarge!;
  static TextStyle get bodyMedium =>
      Theme.of(Get.context!).textTheme.bodyMedium!;
  static TextStyle get bodySmall => Theme.of(Get.context!).textTheme.bodySmall!;

  static TextStyle get labelLarge =>
      Theme.of(Get.context!).textTheme.labelLarge!;
  static TextStyle get labelMedium =>
      Theme.of(Get.context!).textTheme.labelMedium!;
  static TextStyle get labelSmall =>
      Theme.of(Get.context!).textTheme.labelSmall!;

  static InputDecoration generateTextFieldDecoration(
    String label,
    String hint, {
    Widget? prefixWidget,
    Widget? suffixWidget,
  }) =>
      InputDecoration(
        labelText: label,
        hintText: hint,
        labelStyle: GoogleFonts.roboto(
          textStyle: AppTextStyle.bodyMedium,
        ),
        hintStyle: GoogleFonts.roboto(),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: AppColor.onBackground,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: AppColor.onBackground,
          ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        prefixIcon: prefixWidget,
        suffixIcon: suffixWidget,
      );
}
