import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/app/config/app_colors.dart';

class ElevatedBtnTheme {
  ElevatedBtnTheme._();

  static final ElevatedButtonThemeData lightTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: Colorr.buttonColor,
      foregroundColor: Colors.white,
      maximumSize: Size(double.maxFinite, 47.h),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      disabledBackgroundColor: Colorr.buttonDisabled,
      disabledForegroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.r)),
      textStyle: TextStyle(
        color: Colors.white,
        fontSize: 15.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  static final ElevatedButtonThemeData darkTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shadowColor: Colorr.buttonColor.withOpacity(0.05),
      backgroundColor: Colorr.buttonColor,
      foregroundColor: Colors.white,
      maximumSize: Size(double.maxFinite, 47.h),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      disabledBackgroundColor: Colorr.buttonDisabled,
      disabledForegroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.r)),
      textStyle: TextStyle(
        color: Colors.white,
        fontSize: 15.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
