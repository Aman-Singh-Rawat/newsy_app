import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/theme/app_colors.dart';

class CustomCheckboxTheme {
  CustomCheckboxTheme._();

  static final CheckboxThemeData lightCheckboxThem = CheckboxThemeData(
    checkColor: WidgetStatePropertyAll(Colors.white),
    fillColor: WidgetStateColor.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return Colorr.primary;
      }
      return Colors.transparent;
    }),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    side: BorderSide(color: Colorr.primaryColor[400]!, width: 1.5.w),
  );

  static final CheckboxThemeData darkCheckboxThem = CheckboxThemeData(
    fillColor: WidgetStateColor.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return Colorr.primary;
      }
      return Colorr.darkBackground;
    }),
    checkColor: WidgetStatePropertyAll(Colors.white),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    side: BorderSide(color: Colorr.primaryColor[400]!, width: 1.w),
  );
}
