import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

ThemeData darkTheme() {
  return ThemeData.dark().copyWith(
    listTileTheme: ListTileThemeData(
      tileColor: Colors.deepPurple,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
    ),
    textTheme: GoogleFonts.openSansTextTheme(),
  );
}
