import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF7C71F4);
  static const Color primaryDark = Color(0xFF6358D4);
  static const Color secondaryColor = Color(0xFFFFB572);
  static const Color backgroundLight = Color(0xFFFDF8F5);
  static const Color backgroundDark = Color(0xFF1A1A1E);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFF2C2C30);
  static const Color textLight = Color(0xFF1F1F1F);
  static const Color textDark = Color(0xFFE2E2E2);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundLight,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      surface: surfaceLight,
      background: backgroundLight,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: textLight,
      onBackground: textLight,
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.fredoka(
          fontSize: 32, fontWeight: FontWeight.bold, color: textLight),
      displayMedium: GoogleFonts.fredoka(
          fontSize: 28, fontWeight: FontWeight.w600, color: textLight),
      displaySmall: GoogleFonts.fredoka(
          fontSize: 24, fontWeight: FontWeight.w500, color: textLight),
      headlineMedium: GoogleFonts.inter(
          fontSize: 20, fontWeight: FontWeight.bold, color: textLight),
      bodyLarge: GoogleFonts.inter(fontSize: 16, color: textLight),
      bodyMedium: GoogleFonts.inter(fontSize: 14, color: textLight),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: textLight),
      titleTextStyle: TextStyle(
          color: textLight, fontSize: 20, fontWeight: FontWeight.bold),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        textStyle: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: primaryColor, width: 2),
      ),
      contentPadding: const EdgeInsets.all(20),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundDark,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: primaryColor,
      secondary: secondaryColor,
      surface: surfaceDark,
      background: backgroundDark,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: textDark,
      onBackground: textDark,
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.fredoka(
          fontSize: 32, fontWeight: FontWeight.bold, color: textDark),
      displayMedium: GoogleFonts.fredoka(
          fontSize: 28, fontWeight: FontWeight.w600, color: textDark),
      displaySmall: GoogleFonts.fredoka(
          fontSize: 24, fontWeight: FontWeight.w500, color: textDark),
      headlineMedium: GoogleFonts.inter(
          fontSize: 20, fontWeight: FontWeight.bold, color: textDark),
      bodyLarge: GoogleFonts.inter(fontSize: 16, color: textDark),
      bodyMedium: GoogleFonts.inter(fontSize: 14, color: textDark),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: textDark),
      titleTextStyle: TextStyle(
          color: textDark, fontSize: 20, fontWeight: FontWeight.bold),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        textStyle: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: surfaceDark,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: primaryColor, width: 2),
      ),
      contentPadding: const EdgeInsets.all(20),
    ),
  );
}
