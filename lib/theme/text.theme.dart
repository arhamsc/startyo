import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:sizer/sizer.dart";
import 'package:startyo/theme/colors.theme.dart';

class TextThemes {
  static final TextTheme typography = TextTheme(
    headline1: GoogleFonts.breeSerif(
      fontSize: 48.sp,
      color: Palette.heading,
    ),
    headline2: GoogleFonts.breeSerif(
      fontSize: 34.sp,
      color: Palette.heading,
    ),
    button: GoogleFonts.sarabun(
      fontSize: 23.sp,
      color: Palette.tertiary,
    ),
    bodyText1: GoogleFonts.sarabun(
      fontSize: 23.sp,
      color: Palette.textColor,
    ),
  );
}
