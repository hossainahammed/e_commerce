import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightThemeData => ThemeData(
    // colorSchemeSeed: Colors.green
    //   colorSchemeSeed: Color(0xFF07ADAE)
    colorSchemeSeed: AppColors.themeColor,
    scaffoldBackgroundColor: Colors.white,
    filledButtonTheme: _filledButtonThemeData,
    inputDecorationTheme: _inputDecorationTheme,
  );
  static ThemeData get darkThemeData => ThemeData(
    // colorSchemeSeed: Colors.green
    //   colorSchemeSeed: Color(0xFF07ADAE)
    colorSchemeSeed: AppColors.themeColor,
    brightness: Brightness.dark,
    filledButtonTheme: _filledButtonThemeData,
    inputDecorationTheme: _inputDecorationTheme,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
      )
    )
  );
  static FilledButtonThemeData get _filledButtonThemeData =>
      FilledButtonThemeData(
        style: FilledButton.styleFrom(
          fixedSize: Size.fromWidth(double.maxFinite),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: EdgeInsets.symmetric(vertical: 12),
          textStyle: TextStyle(fontSize: 16, color: Colors.white),
          backgroundColor: AppColors.themeColor,
        ),
      );

  static InputDecorationTheme get _inputDecorationTheme => InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(horizontal: 16),
    hintStyle:TextStyle(
      fontWeight: FontWeight.w300
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.themeColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.themeColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.themeColor),
    ),
  );
}
