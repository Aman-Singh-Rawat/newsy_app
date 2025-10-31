import 'package:flutter/material.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/theme/custom_themes/text_theme.dart';

class AppTheme {
  AppTheme._();

  // light theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Colorr.primary,
    fontFamily: "Poppins",
    appBarTheme: AppBarTheme(backgroundColor: Colors.white),
    textTheme: AppTextStyles.lightTextTheme,
    scaffoldBackgroundColor: Colors.white,
  );

  // dark theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: "Poppins",
    primaryColor: Colorr.primary,
    textTheme: AppTextStyles.darkTextTheme,
    scaffoldBackgroundColor: Colorr.darkBackground,
    appBarTheme: AppBarTheme(backgroundColor: Colorr.darkBackground),
  );
}
