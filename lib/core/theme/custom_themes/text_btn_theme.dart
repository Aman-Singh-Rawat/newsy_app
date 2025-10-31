import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/theme/app_colors.dart';

class CustomTextBtnTheme {
  const CustomTextBtnTheme._();

  static final lightTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Colorr.primary,
      textStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: Colorr.primary,
      ),
    ),
  );

  static final darkTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      textStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: Colorr.primary,
      ),
      foregroundColor: Colorr.primary,
    ),
  );
}
