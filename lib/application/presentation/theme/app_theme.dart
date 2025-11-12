import 'package:devhub/application/presentation/utils/colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  //  Light Theme Configuration
  static ThemeData lightTheme() {
    return ThemeData(
      fontFamily: 'Lufga',
      brightness: Brightness.light,
      primaryColor: kprimary,
      scaffoldBackgroundColor: kwhite,
      appBarTheme: const AppBarTheme(
        backgroundColor: koffwhite,
        foregroundColor: kblack,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: 'Lufga',
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: kblack,
        ),
      ),
      colorScheme: const ColorScheme.light(
        primary: kprimary,
        onPrimary: kwhite,
        secondary: kgrey,
        onSecondary: kblack,
        error: kred,
        onError: kwhite,
        surface: kwhite,
        onSurface: kblack,
      ),
      dividerTheme: DividerThemeData(color: kgrey.withOpacity(0.3)),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: kblack),
        bodyMedium: TextStyle(color: kblack),
        titleMedium: TextStyle(color: kblack),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: koffwhite,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: kgrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: kprimary),
        ),
        hintStyle: const TextStyle(color: kgrey),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(color: kprimary),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kprimary,
          foregroundColor: kwhite,
          textStyle: const TextStyle(fontWeight: FontWeight.w500),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }

  //  Dark Theme Configuration
  static ThemeData darkTheme() {
    return ThemeData(
      fontFamily: 'Lufga',
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF0D0D0D),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF1A1A1A),
        foregroundColor: kwhite,
        elevation: 0,
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: TextStyle(
          fontFamily: 'Lufga',
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: kwhite,
        ),
      ),
      cardColor: kdarkgrey,
      colorScheme: const ColorScheme.dark(
        primary: kprimary,
        onPrimary: kwhite,
        secondary: kgrey,
        onSecondary: kwhite,
        error: kred,
        onError: kwhite,
        surface: Color(0xFF121212),
        onSurface: kwhite,
      ),
      dividerTheme: DividerThemeData(color: kgrey.withOpacity(0.4)),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: kwhite),
        bodyMedium: TextStyle(color: kwhite),
        titleMedium: TextStyle(color: kwhite),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF1E1E1E),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: kgrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: kprimary),
        ),
        hintStyle: const TextStyle(color: kgrey),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(color: kprimary),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kprimary,
          foregroundColor: kwhite,
          textStyle: const TextStyle(fontWeight: FontWeight.w500),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
