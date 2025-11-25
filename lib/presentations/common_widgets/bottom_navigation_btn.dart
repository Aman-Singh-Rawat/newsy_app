import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/app/config/app_colors.dart';
import 'package:newsy/core/utils/helper_function.dart';

class BottomNavigationItemBg extends StatelessWidget {
  final Widget child;

  const BottomNavigationItemBg({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final bool isDark = HelperFunction.isDarkMode(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(21.r),
          topRight: Radius.circular(21.r),
        ),
        border: Border(
          top: BorderSide(
            width: 1.5,
            color: isDark ? Colorr.darkSurface : Colors.grey.shade200,
          ),
        ),
      ),

      child: child,
    );
  }
}
