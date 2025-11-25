import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/app/config/app_colors.dart';
import 'package:newsy/app/config/custom_text_style.dart';

class TabbarTheme {
  const TabbarTheme._();

  static final darkTheme = TabBarThemeData(
    dividerColor: Colorr.darkSurface,
    indicatorColor: Colorr.primary,
    labelStyle: CustomTextStyle.tabTextStyle,
    unselectedLabelStyle: CustomTextStyle.tabTextStyle,
    overlayColor: WidgetStateColor.transparent,
    indicatorSize: TabBarIndicatorSize.tab,
    dividerHeight: 2.h,
  );

  static final lightTheme = TabBarThemeData(
    dividerColor: Colors.grey.shade200,
    indicatorColor: Colorr.primary,
    labelStyle: CustomTextStyle.tabTextStyle.copyWith(
      color: Colors.black.withOpacity(0.7)
    ),
    unselectedLabelStyle: CustomTextStyle.tabTextStyle.copyWith(
      color: Colors.black.withOpacity(0.7)
    ),
    overlayColor: WidgetStateColor.transparent,
    indicatorSize: TabBarIndicatorSize.tab,
    dividerHeight: 2.h,
  );
}
