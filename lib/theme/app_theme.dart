import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primary = Color(0xFF135BEC);
  static const Color backgroundLight = Color(0xFFF6F6F8);
  static const Color backgroundDark = Color(0xFF101622);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFF1E2430);
  static const Color textSecondary = Color(0xFF9DA6B9);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: primary,
      background: backgroundLight,
      surface: surfaceLight,
      onPrimary: Colors.white,
      onBackground: Color(0xFF111318),
      onSurface: Color(0xFF111318),
    ),
    scaffoldBackgroundColor: backgroundLight,
    fontFamily: GoogleFonts.lexend().fontFamily,
    textTheme: GoogleFonts.lexendTextTheme(ThemeData.light().textTheme),
    appBarTheme: const AppBarTheme(
      backgroundColor: backgroundLight,
      elevation: 0,
      iconTheme: IconThemeData(color: Color(0xFF111318)),
      titleTextStyle: TextStyle(color: Color(0xFF111318), fontSize: 20, fontWeight: FontWeight.bold),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: primary,
      background: backgroundDark,
      surface: surfaceDark,
      onPrimary: Colors.white,
      onBackground: Colors.white,
      onSurface: Colors.white,
    ),
    scaffoldBackgroundColor: backgroundDark,
    fontFamily: GoogleFonts.lexend().fontFamily,
    textTheme: GoogleFonts.lexendTextTheme(ThemeData.dark().textTheme),
    appBarTheme: const AppBarTheme(
      backgroundColor: backgroundDark,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    ),
  );
}
