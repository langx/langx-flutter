import 'package:flutter/material.dart';

ThemeData whiteTheme() {
  return ThemeData(
    fontFamily: "Comfortaa",
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFFEC409),
      primary: const Color(0xFFFFC409),
      primaryContainer: const Color(0xFFFFCA22),
      secondary: const Color(0xFFFF571A),
      secondaryContainer: const Color(0xFFFFF8F5),
      tertiary: const Color(0xFF5260FF),
      error: const Color(0xFFEB445A),
      surface: const Color(0xFFFFFFFF),
      onPrimary: Colors.black,
      onSecondary: Colors.black,
      onTertiary: Colors.white,
      onSurface: Colors.black,
      onError: Colors.white,
    ),
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(color: Color(0xFF000000)),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFFEC409),
      foregroundColor: Colors.black,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Color(0xFFFEC409),
    ),
    cardTheme: const CardTheme(
      color: Colors.white,
      shadowColor: Colors.grey,
      elevation: 5,
    ),
  );
}

ThemeData darkTheme() {
  return ThemeData(
    fontFamily: "Comfortaa",
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFFEC409),
      primary: const Color(0xFFFFC409),
      primaryContainer: const Color(0xFFFFD948),
      secondary: const Color(0xFFFF571A),
      secondaryContainer: const Color(0xFF1C1C1D),
      tertiary: const Color(0xFF6A64FF),
      error: const Color(0xFFFF4961),
      surface: const Color(0xFF121212),
      onPrimary: Colors.black,
      onSecondary: Colors.black,
      onTertiary: Colors.white,
      onSurface: Colors.white,
      onError: Colors.white,
    ),
    scaffoldBackgroundColor: const Color(0xFF121212),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(color: Color(0xFFFFFFFF)),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFFEC409),
      foregroundColor: Colors.black,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF121212),
      unselectedItemColor: Color(0xFFFFFFFF),
      selectedItemColor: Color(0xFFFEC409),
    ),
    cardTheme: const CardTheme(
      color: Color(0xFF1A1A1A),
      shadowColor: Colors.black87,
      elevation: 5,
    ),
  );
}
