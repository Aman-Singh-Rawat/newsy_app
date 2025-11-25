import 'package:flutter/material.dart';
import 'package:newsy/app/config/app_colors.dart';
import 'package:newsy/app/config/components/text_form_field_theme.dart';

class CustomDropdownMenuTheme {
  const CustomDropdownMenuTheme._();

  static DropdownMenuThemeData darkDropdownMenuTheme = DropdownMenuThemeData(
    inputDecorationTheme: TextFormFieldTheme.darkInputDecoration,
    menuStyle: MenuStyle(
      backgroundColor: WidgetStatePropertyAll(Colorr.darkSurface),
    ),
  );

  static DropdownMenuThemeData lightDropdownMenuTheme = DropdownMenuThemeData(
    inputDecorationTheme: TextFormFieldTheme.lightInputDecoration,
    menuStyle: MenuStyle(backgroundColor: WidgetStatePropertyAll(Colorr.light)),
  );
}
