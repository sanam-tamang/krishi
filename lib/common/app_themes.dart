import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.baseColor, foregroundColor: Colors.white),
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.baseColor,
        brightness: Brightness.light,
      ),
      useMaterial3: true,
      textTheme: GoogleFonts.dmSansTextTheme(const TextTheme()),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.baseColor,
        brightness: Brightness.dark,
      ),
      useMaterial3: true,
      textTheme: GoogleFonts.dmSansTextTheme(const TextTheme()),
    );
  }
}
