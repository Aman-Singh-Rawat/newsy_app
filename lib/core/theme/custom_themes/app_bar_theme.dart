import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/theme/app_colors.dart';

class CustomAppBarTheme {
  const CustomAppBarTheme._();

  static final lightTheme = AppBarTheme(
    backgroundColor: Colors.white,
    scrolledUnderElevation: 0,
    titleTextStyle: TextStyle(
      fontSize: 18.sp,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w500,
      color: Colorr.light,
    ),

    iconTheme: IconThemeData(color: Colorr.primary),
  );

  static final darkTheme = AppBarTheme(
    backgroundColor: Colorr.darkBackground,
    scrolledUnderElevation: 0,
    iconTheme: IconThemeData(color: Colorr.primary),
    titleTextStyle: TextStyle(
      fontSize: 18.sp, 
      fontFamily: "Poppins",
      fontWeight: FontWeight.w500,
      color: Colorr.textWhite,
    ),
  );
}
