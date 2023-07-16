import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var lightThemeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
  cardColor: Colors.blueGrey[50],
  primaryTextTheme: TextTheme(
    displayLarge: GoogleFonts.lato(
      textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 80),
    ),
    displayMedium: GoogleFonts.lato(
      textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 72),
    ),
    displaySmall: GoogleFonts.lato(
      textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 48),
    ),
    headlineLarge: GoogleFonts.lato(
      textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 48),
    ),
    headlineMedium: GoogleFonts.lato(
      textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 40),
    ),
    titleLarge: GoogleFonts.lato(
      textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 36),
    ),
    bodyLarge: GoogleFonts.lato(
      textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 28),
    ),
    bodyMedium: GoogleFonts.lato(
      textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
    ),
    bodySmall: GoogleFonts.lato(
      textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
    ),
    headlineSmall: GoogleFonts.lato(
      textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 40),
    ),
    titleMedium: GoogleFonts.lato(
      textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 36),
    ),
    titleSmall: GoogleFonts.lato(
      textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 32),
    ),
    labelLarge: GoogleFonts.lato(
      textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
    ),
    // labelMedium:                                    GoogleFonts.lato(textStyle:const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),),
    labelSmall: GoogleFonts.lato(
      textStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
    ),
    labelMedium: GoogleFonts.lato(
      textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
    ),
    // bodyText2: const                                    GoogleFonts.lato(textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),)
    // subtitle1: const                                    GoogleFonts.lato(textStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),)
    // subtitle2: const                                    GoogleFonts.lato(textStyle: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),)
    // caption: const                                    GoogleFonts.lato(textStyle: TextStyle(fontWeight: FontWeight.w300, fontSize: 12),)
  ),
  iconTheme: const IconThemeData(color: Colors.blueGrey),
  brightness: Brightness.light,
  bottomAppBarTheme: const BottomAppBarTheme(color: Colors.black),
);
