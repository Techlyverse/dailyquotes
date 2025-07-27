import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

ThemeData appTheme = ThemeData(
  textTheme: GoogleFonts.openSansTextTheme(),
  tabBarTheme: TabBarThemeData(
      dividerColor: Colors.transparent,
      //tabAlignment: TabAlignment.start,
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      labelStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
      )),
  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
    ),
  ),
);
