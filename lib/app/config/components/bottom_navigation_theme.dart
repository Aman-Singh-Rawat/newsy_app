import 'package:flutter/material.dart';
import 'package:newsy/app/config/app_colors.dart';

class BottomNavigationTheme {
  const BottomNavigationTheme._();

  static final lightTheme = BottomNavigationBarThemeData(
    backgroundColor: Colorr.light,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    elevation: 0,
    selectedIconTheme: IconThemeData(color: Colors.white),
    unselectedIconTheme: IconThemeData(color: Colorr.primaryColor[400]),
    type: BottomNavigationBarType.fixed,
  );

  static final darkTheme = BottomNavigationBarThemeData(
    backgroundColor: Colorr.darkSurface,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    elevation: 0,

    selectedIconTheme: IconThemeData(color: Colors.white),
    unselectedIconTheme: IconThemeData(color: Colorr.primaryColor[400]),
    type: BottomNavigationBarType.fixed,
  );
}
