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
    fontSize: 11.sp,
  );

  static TextStyle tabTextStyle = GoogleFonts.poppins(
    color: Colors.black,
    fontSize: 14.0.sp,
    fontWeight: FontWeight.w600,
  );
}
