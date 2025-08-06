import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: const Color(0xFFFFFDF9),
  primaryColor: const Color(0xFF37474F),
  cardColor: const Color(0xFFFFFFFF),
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF37474F),
    secondary: Color(0xFFFF7043),
    surface: Color(0xFFFFFFFF),
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.black87,
  ),
  textTheme: GoogleFonts.openSansTextTheme(),
  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFFFFFDF9),
    iconTheme: IconThemeData(color:  Colors.black87),
  )
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xFF121212),
  primaryColor: const Color(0xFFFFC107),
  cardColor: const Color(0xFF1E1E1E),
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFFFFC107),
    secondary: Color(0xFF90CAF9),
    surface: Color(0xFF1E1E1E),
    onPrimary: Colors.black,
    onSecondary: Colors.black,
    onSurface: Colors.white,
  ),
  textTheme: GoogleFonts.openSansTextTheme(),
  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF1E1E1E),
    iconTheme: IconThemeData(color: Colors.white),
  )
);
