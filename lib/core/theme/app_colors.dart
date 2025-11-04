import 'package:flutter/material.dart';

class Colorr {
  Colorr._();

  static const Color dangerColor = Color(0xFFCE0000);
  static const Color successColor = Color(0xFF00A86B);
  static const Color warningColor = Color(0xFFE8A300);

  static const Map<int, Color> primaryColor = {
    20: Color(0xFFFFF1F1),
    50: Color(0xFFFFF1F1),
    100: Color(0xFFFFE2E1),
    200: Color(0xFFFFC9C7),
    300: Color(0xFFFFA3A0),
    400: Color(0xFFFF7672),
    500: Color(0xFFF8403B),
    600: Color(0xFFE5231D),
    700: Color(0xFFC11914),
    800: Color(0xFFA01814),
    900: Color(0xFF841B18),
    950: Color(0xFF480907),
  };

  static const primary = Color(0xFFFF7672);
  static const onPrimary = Color(0xFFFFFFFF);

  // text colors
  static const textPrimary = Color(0xFF25282e);
  static const textSecondary = Color(0xFF6c7073);
  static const textWhite = Colors.white;
  static const textHintColor = Color(0xFFdcdcde);

  // background colors
  static const light = Colors.white;
  static const dark = Color(0xFF1a1a22);

  // button colors
  static Color buttonDisabled = const Color(0xFFefa8a4);
  static const Color buttonColor = Color(0xFFff847d);

  // Error & Validation Colors
  static const Color error = Color(0xFFF5322F);
  static const Color success = Color(0xFF38E83C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFFfe6f69);

  // Border colors
  static const borderPrimary = Color(0xFFfe6f69);
  static const borderSecondary = Color(0xFFf2f2f2);

  // dark colors
  static const Color darkBackground = Color(0xFF1a1a22);
  static const Color darkSurface = Color(0xFF23262f);
  static const Color darkPrimaryRed = Color(0xFFE94057);
  static const Color darkBorderRed = Color(0xFFFF4C5E);
  static const Color darkTextPrimary = Color(0xFFFFFFFF);
  static const Color darkTextSecondary = Color(0xFFD4D4DC);
  static const Color darkDivider = Color(0xFF2C2C2E);
  static const Color iconBg = Color(0xFF382b34);
  static const Color darkerTextColor = Color(0xFF3c434d);
  static const Color darkerGrey = Color(0XFF7b7f88);

  // white colors
  static const Color whiteSurface = Color(0x000000ff);
}
