import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/theme/app_colors.dart';

class CustomTextStyle {
  CustomTextStyle._();
  static TextStyle onboardingTextStyle = TextStyle(
    fontSize: 28.sp,
    height: 1.3.h,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static TextStyle screenDescTextStyle = TextStyle(
    fontSize: 13.sp,
    height: 1.5.h,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static TextStyle emptyTextStyle = TextStyle(
    fontSize: 19.sp,
    color: Colorr.primaryColor[400],
    fontWeight: FontWeight.w500,
  );

  static TextStyle followFollowingTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 10.sp,
  );

  static TextStyle tabTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 14.sp,
    color: Colorr.light,
  );

  static TextStyle settingScreenItemTitleStyle = TextStyle(
    color: Colors.black,
    fontSize: 13.5.sp,
    letterSpacing: 0.09,
    fontWeight: FontWeight.w600,
  );

  static TextStyle commentBsTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontSize: 14.sp,
  );

  static TextStyle commentNumberTextStyle = TextStyle(
    color: Colorr.primaryColor[400],
    fontWeight: FontWeight.w600,
    fontSize: 14.sp,
  );

  static TextStyle userNameTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 13.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle userNameSubTextStyle = TextStyle(
    color: Colors.black87,
    fontSize: 10.sp,
    height: 2.1.h,
    fontWeight: FontWeight.w500,
  );

  static TextStyle userCommentTextStyle = TextStyle(
    fontSize: 12.sp,
    height: 1.5.h,
    fontWeight: FontWeight.w500,
    color: Colors.black54,
  );

  static TextStyle fieldLabelStyle = TextStyle(
    color: Colors.black54,
    fontWeight: FontWeight.w600,
    fontSize: 13.sp,
  );

  static TextStyle fieldFormStyle = TextStyle(
    fontSize: 13.sp,
    color: Colors.black,
    fontWeight: FontWeight.w600,
  );
}
