import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";


ThemeData appTheme=ThemeData().copyWith(
  iconButtonTheme: IconButtonThemeData(
   style:IconButton.styleFrom(
    foregroundColor: Colors.black,
    backgroundColor: Colors.white
   )
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.black,
      backgroundColor: Colors.white
    )
  ),
   textTheme: GoogleFonts.openSansTextTheme(),
  
listTileTheme: ListTileThemeData(
      tileColor: Colors.deepPurple,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
    ),
);

