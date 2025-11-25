import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/app/config/app_colors.dart';

class AChipTheme {
  const AChipTheme._();

  static final lightTheme = ChipThemeData(
    backgroundColor: Colorr.light,
    labelStyle: TextStyle(
      color: Colorr.primaryColor[400],
      fontSize: 11.sp,
      fontWeight: FontWeight.w600,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24.r),
      side: BorderSide(color: Colorr.primaryColor[400]!, width: 1.7.w),
    ),
  );

  static final darkTheme = ChipThemeData(
    backgroundColor: Colors.transparent,
    labelStyle: TextStyle(
      color: Colorr.primaryColor[300],
      fontSize: 11.sp,
      fontWeight: FontWeight.w600,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24.r),
      side: BorderSide(color: Colorr.primaryColor[300]!, width: 1.7.w),
    ),
  );
}
