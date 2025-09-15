import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme{
   static ThemeData get lightThemeData => ThemeData(

  // colorSchemeSeed: Colors.green
  //   colorSchemeSeed: Color(0xFF07ADAE)
  colorSchemeSeed: AppColors.themeColor,scaffoldBackgroundColor: Colors.white
  );
  static ThemeData get darkThemeData => ThemeData(

  // colorSchemeSeed: Colors.green
  //   colorSchemeSeed: Color(0xFF07ADAE)
  colorSchemeSeed: AppColors.themeColor,
  brightness: Brightness.dark
  );
}