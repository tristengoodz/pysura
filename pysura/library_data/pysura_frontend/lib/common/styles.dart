import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData kMainTheme = ThemeData(
  useMaterial3: true,
  primaryColor: kPrimaryColor,
  primaryColorLight: kPrimaryColorLight,
  scaffoldBackgroundColor: kBackgroundColor,
  canvasColor: kBackgroundColor,
);

const Color kPrimaryColor = Color(0xFF4A346C);
const Color kPrimaryColorLight = Color(0xFF7D6A9F);
const Color kSecondaryColor = Color(0xFFB3B3B3);
const Color kBackgroundColor = Color(0xFFF5F5F5);
const Color kGrey = Color(0xFFB3B3B3);
const Color kBlack = Color(0xFF000000);
const Color kDarkGrey = Color(0xFF4A4A4A);
const Color kWhite = Color(0xFFFFFFFF);
const Color kRed = Color(0xFFE74C3C);

const List<Color> avatarColors = [
  Color(0xFF4A346C),
  Color(0xFFE74C3C),
  Color(0xFFE67E22),
  Color(0xFFF1C40F),
  Color(0xFF2ECC71),
  Color(0xFF1ABC9C),
  Color(0xFF3498DB),
  Color(0xFF9B59B6),
  Color(0xFF34495E),
  Color(0xFFD35400),
  Color(0xFF2980B9),
  Color(0xFF16A085),
  Color(0xFF27AE60),
  Color(0xFF8E44AD),
  Color(0xFF2C3E50),
  Color(0xFFF39C12),
  Color(0xFFC0392B),
  Color(0xFFD35400),
  Color(0xFF2980B9),
  Color(0xFF16A085),
  Color(0xFF27AE60),
  Color(0xFF8E44AD),
  Color(0xFF2C3E50),
  Color(0xFFF39C12),
  Color(0xFFC0392B),
];

InputDecoration generateTextFieldDecoration(String label, String hint) =>
    InputDecoration(
      labelText: label,
      hintText: hint,
      labelStyle: GoogleFonts.roboto(
        color: kGrey,
      ),
      hintStyle: GoogleFonts.roboto(
        color: kGrey,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: kPrimaryColorLight,
          width: 2,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: kGrey,
          width: 1,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    );
