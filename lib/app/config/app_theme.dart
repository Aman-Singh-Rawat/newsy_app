import 'package:flutter/material.dart';
import 'package:newsy/app/config/app_colors.dart';
import 'package:newsy/app/config/components/app_bar_theme.dart';
import 'package:newsy/app/config/components/bottom_navigation_theme.dart';
import 'package:newsy/app/config/components/checkbox_theme.dart';
import 'package:newsy/app/config/components/chip_theme.dart';
import 'package:newsy/app/config/components/divider_theme.dart';
import 'package:newsy/app/config/components/dropdown_menu_theme.dart';
import 'package:newsy/app/config/components/elevated_btn_theme.dart';
import 'package:newsy/app/config/components/tabbar_theme.dart';
import 'package:newsy/app/config/components/text_btn_theme.dart';
import 'package:newsy/app/config/components/text_form_field_theme.dart';
import 'package:newsy/app/config/components/text_theme.dart';

class AppTheme {
  AppTheme._();

  // light theme
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colorr.primary),
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Colorr.primary,
    fontFamily: "Poppins",
    textSelectionTheme: TextSelectionThemeData().copyWith(
      cursorColor: Colorr.primary,
    ),
    dropdownMenuTheme: CustomDropdownMenuTheme.lightDropdownMenuTheme,
    dividerTheme: ADividerTheme.lightTheme,
    chipTheme: AChipTheme.lightTheme,
    appBarTheme: CustomAppBarTheme.lightTheme,
    textTheme: AppTextStyles.lightTextTheme,
    tabBarTheme: TabbarTheme.lightTheme,
    bottomNavigationBarTheme: BottomNavigationTheme.lightTheme,
    textButtonTheme: CustomTextBtnTheme.lightTheme,
    elevatedButtonTheme: ElevatedBtnTheme.lightTheme,
    checkboxTheme: CustomCheckboxTheme.lightCheckboxThem,
    inputDecorationTheme: TextFormFieldTheme.lightInputDecoration,
    scaffoldBackgroundColor: Colors.white,
  );

  // dark theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Poppins",
    dividerTheme: ADividerTheme.darkTheme,
    chipTheme: AChipTheme.darkTheme,
    primaryColor: Colorr.primary,
    tabBarTheme: TabbarTheme.darkTheme,
    appBarTheme: CustomAppBarTheme.darkTheme,
    textTheme: AppTextStyles.darkTextTheme,
    dialogTheme: DialogThemeData(backgroundColor: Colorr.darkSurface),
    dropdownMenuTheme: CustomDropdownMenuTheme.darkDropdownMenuTheme,
    bottomNavigationBarTheme: BottomNavigationTheme.darkTheme,
    textButtonTheme: CustomTextBtnTheme.darkTheme,
    elevatedButtonTheme: ElevatedBtnTheme.darkTheme,
    checkboxTheme: CustomCheckboxTheme.darkCheckboxThem,
    inputDecorationTheme: TextFormFieldTheme.darkInputDecoration,
    scaffoldBackgroundColor: Colorr.darkBackground,
    textSelectionTheme: TextSelectionThemeData().copyWith(
      cursorColor: Colorr.primary,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colorr.primary,
      brightness: Brightness.dark,
    ),
  );
}
