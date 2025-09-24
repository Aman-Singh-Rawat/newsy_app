import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyle {
  static TextStyle onboardingTextStyle = TextStyle(
    fontSize: 32.sp,
    height: 1.3,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static TextStyle screenDescTextStyle = GoogleFonts.poppins(
    fontSize: 13,
    height: 1.5,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
}