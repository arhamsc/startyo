import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:sizer/sizer.dart";
import 'package:startyo/theme/colors.theme.dart';

class TextThemes {
  static final TextTheme typography = TextTheme(
    headline1: GoogleFonts.breeSerif(
      fontSize: 34,
      color: Palette.heading,
    ),
    headline2: GoogleFonts.breeSerif(
      fontSize: 24,
      color: Palette.heading,
    ),
    button: GoogleFonts.sarabun(
      fontSize: 16,
      color: Palette.tertiary,
      fontWeight: FontWeight.bold,
    ),
    bodyText1: GoogleFonts.sarabun(
      fontSize: 16,
      color: Palette.textColor,
    ),
  );
}
