import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/app/config/app_colors.dart';
import 'package:newsy/app/config/custom_text_style.dart';

class TextFormFieldTheme {
  TextFormFieldTheme._();

  static InputDecorationTheme lightInputDecoration = InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 14.w),
    hintStyle: CustomTextStyle.textFieldHintStyle,

    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.r),
      borderSide: BorderSide(color: Colors.grey.shade200, width: 1.5.w),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.r),
      borderSide: BorderSide(color: Colorr.primaryColor[400]!, width: 2.w),
    ),
  );

  // dark theme
  static InputDecorationTheme darkInputDecoration = InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 14.w),
    hintStyle: TextStyle(
      color: Colorr.darkerTextColor,
      fontSize: 13.sp,
      fontWeight: FontWeight.w600,
    ),

    filled: true,
    fillColor: Colorr.darkSurface,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(25.r),
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.r),
      borderSide: BorderSide(color: Colorr.primaryColor[400]!, width: 2.w),
    ),
  );
}
