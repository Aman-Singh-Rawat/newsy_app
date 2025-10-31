import 'package:flutter/material.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/theme/custom_themes/checkbox_theme.dart';
import 'package:newsy/core/theme/custom_themes/elevated_btn_theme.dart';
import 'package:newsy/core/theme/custom_themes/text_btn_theme.dart';
import 'package:newsy/core/theme/custom_themes/text_form_field_theme.dart';
import 'package:newsy/core/theme/custom_themes/text_theme.dart';

class AppTheme {
  AppTheme._();

  // light theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Colorr.primary,
    fontFamily: "Poppins",
    textSelectionTheme: TextSelectionThemeData().copyWith(
      cursorColor: Colorr.primary,
    ),
    appBarTheme: AppBarTheme(backgroundColor: Colors.white),
    textTheme: AppTextStyles.lightTextTheme,
    textButtonTheme: CustomTextBtnTheme.lightTheme,
    elevatedButtonTheme: ElevatedBtnTheme.lightTheme,
    checkboxTheme: CustomCheckboxTheme.lightCheckboxThem,
    inputDecorationTheme: TextFormFieldTheme.lightInputDecoration,
    scaffoldBackgroundColor: Colors.white,
  );

  // dark theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: "Poppins",
    primaryColor: Colorr.primary,
    textTheme: AppTextStyles.darkTextTheme,
    textButtonTheme: CustomTextBtnTheme.darkTheme,
    elevatedButtonTheme: ElevatedBtnTheme.darkTheme,
    checkboxTheme: CustomCheckboxTheme.darkCheckboxThem,
    inputDecorationTheme: TextFormFieldTheme.darkInputDecoration,
    scaffoldBackgroundColor: Colorr.darkBackground,
    appBarTheme: AppBarTheme(backgroundColor: Colorr.darkBackground),
    textSelectionTheme: TextSelectionThemeData().copyWith(
      cursorColor: Colorr.primary,
    ),
  );
}
