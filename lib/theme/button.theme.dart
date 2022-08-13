import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:startyo/theme/colors.theme.dart';
import 'package:startyo/theme/text.theme.dart';

class ButtonThemes {
  //Normal Elevated Button Style
  static ElevatedButtonThemeData elevatedButton = ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Palette.primary),
      foregroundColor: MaterialStateProperty.all(Palette.tertiary),
      textStyle: MaterialStateProperty.all(
        TextThemes.typography.button,
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(34.sp),
        ),
      ),
    ),
  );

  static TextButtonThemeData textButton = TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all(Palette.primary),
      textStyle: MaterialStateProperty.all(
        TextThemes.typography.button,
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(34.sp),
        ),
      ),
    ),
  );
}
