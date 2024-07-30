import 'package:flutter/material.dart';
import 'package:meals_app/src/constant/constant.dart';

class AppTheme {
  AppTheme._();

  static ThemeData theme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Constant.warmWhite,
    dialogBackgroundColor: Constant.warmWhite,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: Constant.darkRed,
        foregroundColor: Constant.white,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        backgroundColor: Constant.darkRed,
        foregroundColor: Constant.white,
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'Montserrat',
        color: Colors.black87,
        fontSize: 64.0,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        fontFamily: 'Montserrat',
        color: Colors.black87,
        fontSize: 48.0,
        fontWeight: FontWeight.w600, // Semi-bold
      ),
      displaySmall: TextStyle(
        fontFamily: 'Montserrat',
        color: Colors.black87,
        fontSize: 36.0,
        fontWeight: FontWeight.normal,
      ),
      headlineLarge: TextStyle(
        fontFamily: 'Montserrat',
        color: Colors.black87,
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Montserrat',
        color: Colors.black87,
        fontSize: 28.0,
        fontWeight: FontWeight.w600, // Semi-bold
      ),
      headlineSmall: TextStyle(
        fontFamily: 'Montserrat',
        color: Colors.black87,
        fontSize: 24.0,
        fontWeight: FontWeight.normal,
      ),
      titleLarge: TextStyle(
        fontFamily: 'Montserrat',
        color: Colors.black87,
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Montserrat',
        color: Colors.black87,
        fontSize: 20.0,
        fontWeight: FontWeight.w600, // Semi-bold
      ),
      titleSmall: TextStyle(
        fontFamily: 'Montserrat',
        color: Colors.black87,
        fontSize: 18.0,
        fontWeight: FontWeight.normal,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Montserrat',
        color: Colors.black87,
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Montserrat',
        color: Colors.black87,
        fontSize: 14.0,
        fontWeight: FontWeight.w600, // Semi-bold
      ),
      bodySmall: TextStyle(
        fontFamily: 'Montserrat',
        color: Colors.black87,
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
      ),
      labelLarge: TextStyle(
        fontFamily: 'Montserrat',
        color: Colors.black87,
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
      ),
      labelMedium: TextStyle(
        fontFamily: 'Montserrat',
        color: Colors.black87,
        fontSize: 12.0,
        fontWeight: FontWeight.w600, // Semi-bold
      ),
      labelSmall: TextStyle(
        fontFamily: 'Montserrat',
        color: Colors.black87,
        fontSize: 10.0,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}
