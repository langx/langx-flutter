import "package:flutter/material.dart";

whiteTheme(){
 return ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFEC409)),
  scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
  inputDecorationTheme: InputDecorationTheme(
      suffixStyle: const TextStyle(color: Colors.white),
      fillColor: const Color(0xFFE8E8E8),
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1.5, color: Color(0xFFE8E8E8)),
        borderRadius: BorderRadius.circular(15)
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1.5, color: Color(0xFFE8E8E8)),
        borderRadius: BorderRadius.circular(15)
      ),
      labelStyle: const TextStyle(color: Color(0xEA000000)),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor:  Color(0xFFFEC409),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: WidgetStateProperty.all<TextStyle>(
            const TextStyle(
              color: Color(0xFFFEC409), 
            ),
          ),
        ),
      ),  
 );
}

darkTheme(){
 return ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFEC409)),
  scaffoldBackgroundColor: const Color.fromARGB(255, 20, 20, 20),
  inputDecorationTheme: InputDecorationTheme(
      suffixStyle: const TextStyle(color: Colors.white),
      fillColor: const Color(0xFF6B6B6B),
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1.5, color: Color(0xFF6B6B6B)),
        borderRadius: BorderRadius.circular(15)
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1.5, color: Color(0xFF6B6B6B)),
        borderRadius: BorderRadius.circular(15)
      ),
      labelStyle: const TextStyle(color: Color(0xEAFFFFFF)),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Color(0xFFFEC409),
      ),   
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium:  TextStyle(color: Colors.white),
        bodySmall: TextStyle(color: Colors.white),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: WidgetStateProperty.all<TextStyle>(
            const TextStyle(
              color: Color.fromARGB(255, 255, 213, 73),
            ),
          ),
        ),
      ),
 );
}