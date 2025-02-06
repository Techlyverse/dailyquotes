import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

ThemeData appTheme = ThemeData(
  textTheme: GoogleFonts.openSansTextTheme(),
  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
    ),
  ),
);
