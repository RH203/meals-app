import 'package:flutter/material.dart';
import 'package:meals_app/src/constant/constant.dart';

class AppTheme {
  AppTheme._();

  static ThemeData theme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Constant.warmWhite,
    dialogBackgroundColor: Constant.warmWhite,
    textButtonTheme: TextButtonThemeData(
      style: IconButton.styleFrom(
        backgroundColor: Constant.darkRed,
        foregroundColor: Constant.white,
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        backgroundColor: Constant.darkRed,
        foregroundColor: Constant.white,
      ),
    ),
  );
}
