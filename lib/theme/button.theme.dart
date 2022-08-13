import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:startyo/theme/colors.theme.dart';
import 'package:startyo/theme/text.theme.dart';

class ButtonThemes {
  //Normal Elevated Button Style
  static ElevatedButtonThemeData elevatedButton = ElevatedButtonThemeData(
    style: ButtonStyle(
      alignment: Alignment.center,
      backgroundColor: MaterialStateProperty.all(Palette.primary),
      foregroundColor: MaterialStateProperty.all(Palette.tertiary),
      textStyle: MaterialStateProperty.all(TextThemes.typography.button),
      elevation: MaterialStateProperty.all(0),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(34.sp),
        ),
      ),
    ),
  );

  static OutlinedButtonThemeData outlinedButton = OutlinedButtonThemeData(
    style: ButtonStyle(
      alignment: Alignment.center,
      backgroundColor: MaterialStateProperty.all(Palette.tertiary),
      foregroundColor: MaterialStateProperty.all(Palette.primary),
      textStyle: MaterialStateProperty.all(TextThemes.typography.button),
      // elevation: MaterialStateProperty.all(0),
      side: MaterialStateProperty.all(
        const BorderSide(color: Palette.primary, width: 3),
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
