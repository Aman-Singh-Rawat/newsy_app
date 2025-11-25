import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/app/config/app_colors.dart';

class AppTextStyles {
  const AppTextStyles._();

  /// Dark Text Theme
  static TextTheme darkTextTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 32.sp,
      fontFamily: "Poppins",
      fontWeight: FontWeight.bold,
      color: Colorr.textWhite,
    ),
    displayMedium: TextStyle(
      fontSize: 28.sp,
      fontFamily: "Poppins",
      fontWeight: FontWeight.bold,
      color: Colorr.textWhite,
    ),
    displaySmall: TextStyle(
      fontSize: 24.sp,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w600,
      color: Colorr.textWhite,
    ),
    headlineMedium: TextStyle(
      fontSize: 20.sp,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w600,
      color: Colorr.textWhite,
    ),
    headlineSmall: TextStyle(
      fontSize: 18.sp,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w500,
      color: Colorr.textWhite,
    ),
    titleLarge: TextStyle(
      fontSize: 16.sp,
      fontFamily: "Poppins",
      fontWeight: FontWeight.bold,
      color: Colorr.textWhite,
    ),
    titleMedium: TextStyle(
      fontSize: 15.sp,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w500,
      color: Colorr.darkTextSecondary,
    ),
    titleSmall: TextStyle(
      fontSize: 12.sp,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w400,
      color: Colorr.textWhite,
    ),
    bodyLarge: TextStyle(
      fontSize: 14.sp,
      fontFamily: "Poppins",
      color: Colorr.textWhite,
    ),
    bodyMedium: TextStyle(
      fontSize: 13.sp,
      fontFamily: "Poppins",
      color: Colorr.darkTextSecondary,
    ),
    bodySmall: TextStyle(
      fontSize: 12.sp,
      fontFamily: "Poppins",
      color: Colorr.darkTextSecondary,
    ),
    labelLarge: TextStyle(
      fontSize: 12.sp,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w500,
      color: Colorr.textWhite,
    ),
    labelMedium: TextStyle(
      fontSize: 11.sp,
      fontFamily: "Poppins",
      color: Colorr.darkTextSecondary,
    ),
    labelSmall: TextStyle(
      fontSize: 10.sp,
      fontFamily: "Poppins",
      color: Colorr.darkTextSecondary,
    ),
  );

  /// Light Text Theme
  static TextTheme lightTextTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 32.sp,
      fontFamily: "Poppins",
      fontWeight: FontWeight.bold,
      color: Colorr.textPrimary,
    ),
    displayMedium: TextStyle(
      fontSize: 28.sp,
      fontFamily: "Poppins",
      fontWeight: FontWeight.bold,
      color: Colorr.textPrimary,
    ),
    displaySmall: TextStyle(
      fontSize: 24.sp,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w600,
      color: Colorr.textPrimary,
    ),
    headlineMedium: TextStyle(
      fontSize: 20.sp,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w600,
      color: Colorr.textPrimary,
    ),
    headlineSmall: TextStyle(
      fontSize: 18.sp,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w500,
      color: Colorr.textPrimary,
    ),
    titleLarge: TextStyle(
      fontSize: 16.sp,
      fontFamily: "Poppins",
      fontWeight: FontWeight.bold,
      color: Colorr.textPrimary,
    ),
    titleMedium: TextStyle(
      fontSize: 15.sp,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w500,
      color: Colorr.textSecondary,
    ),
    titleSmall: TextStyle(
      fontSize: 12.sp,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w500,
      color: Colorr.darkBackground,
    ),
    bodyLarge: TextStyle(
      fontSize: 14.sp,
      fontFamily: "Poppins",
      color: Colorr.textPrimary,
    ),
    bodyMedium: TextStyle(
      fontSize: 13.sp,
      fontFamily: "Poppins",
      color: Colorr.textSecondary,
    ),
    bodySmall: TextStyle(
      fontSize: 12.sp,
      fontFamily: "Poppins",
      color: Colorr.textSecondary,
    ),
    labelLarge: TextStyle(
      fontSize: 12.sp,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w500,
      color: Colorr.textPrimary,
    ),
    labelMedium: TextStyle(
      fontSize: 11.sp,
      fontFamily: "Poppins",
      color: Colorr.textSecondary,
    ),
    labelSmall: TextStyle(
      fontSize: 10.sp,
      fontFamily: "Poppins",
      color: Colorr.textSecondary,
    ),
  );
}
