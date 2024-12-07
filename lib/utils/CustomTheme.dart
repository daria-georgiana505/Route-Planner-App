import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  static ThemeData lightThemeData()
  {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        brightness: Brightness.light
      ).copyWith(
        surface: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        color: Colors.indigo,
        iconTheme: IconThemeData(color: Colors.white),
      ),
        // textTheme: GoogleFonts.robotoTextTheme(
        //   ThemeData.light().textTheme
        // ),
      cardColor: Colors.grey[200],
      shadowColor: Colors.black,
        scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.indigo,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  static ThemeData darkThemeData()
  {
    return ThemeData(
      useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.cyanAccent,
            brightness: Brightness.dark
        ).copyWith(
            surface: Colors.black
        ),
      appBarTheme: const AppBarTheme(
          color: Colors.cyanAccent,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      // textTheme: GoogleFonts.robotoTextTheme(
      //   ThemeData.dark().textTheme,
      // ),
      cardColor: Colors.grey[900],
      shadowColor: Colors.white,
        scaffoldBackgroundColor: Colors.black,
      primaryColor: Colors.cyanAccent,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey[900],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}