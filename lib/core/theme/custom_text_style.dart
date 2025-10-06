import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsy/core/theme/app_colors.dart';

class CustomTextStyle {
  static TextStyle onboardingTextStyle = GoogleFonts.poppins(
    fontSize: 28.sp,
    height: 1.3.h,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static TextStyle screenDescTextStyle = GoogleFonts.poppins(
    fontSize: 13.sp,
    height: 1.5.h,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static TextStyle emptyTextStyle = GoogleFonts.poppins(
    fontSize: 20.sp,
    color: Colorr.primaryColor[400],
    fontWeight: FontWeight.w600,
  );

  static TextStyle followFollowingTextStyle = GoogleFonts.poppins(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 10.sp,
  );

  static TextStyle tabTextStyle = GoogleFonts.poppins(
    color: Colors.black,
    fontSize: 14.0.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle settingScreenItemTitleStyle = GoogleFonts.poppins(
    color: Colors.black,
    fontSize: 13.5.sp,
    letterSpacing: 0.09,
    fontWeight: FontWeight.w600,
  );

  static TextStyle commentBsTextStyle = GoogleFonts.poppins(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontSize: 14.sp,
  );

  static TextStyle commentNumberTextStyle = GoogleFonts.poppins(
    color: Colorr.primaryColor[400],
    fontWeight: FontWeight.w600,
    fontSize: 14.sp,
  );

  static TextStyle userNameTextStyle = GoogleFonts.poppins(
    color: Colors.black,
    fontSize: 13.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle userNameSubTextStyle = GoogleFonts.poppins(
    color: Colors.black87,
    fontSize: 10.sp,
    height: 2.1.h,
    fontWeight: FontWeight.w500,
  );

  static TextStyle userCommentTextStyle = GoogleFonts.poppins(
    fontSize: 12.sp,
    height: 1.5.h,
    fontWeight: FontWeight.w500,
    color: Colors.black54,
  );
}
