import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:newsy/app/config/app_colors.dart';
import 'package:newsy/core/utils/helper_function.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final bool isSmall;
  final double? maxWidth;
  final VoidCallback? onTap;

  const CategoryChip({
    super.key,
    required this.label,
    this.isSelected = false,
    this.isSmall = false,
    this.maxWidth,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = HelperFunction.isDarkMode(context);

    final Color bgColor = isSelected
        ? Colorr.primaryColor[400]!
        : isDark
            ? Colorr.darkSurface
            : Colorr.light;

    final Color textColor = isSelected
        ? Colors.white
        : isDark
            ? Colorr.primaryColor[300]!
            : Colorr.primaryColor[400]!;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: maxWidth != null
            ? BoxConstraints(maxWidth: maxWidth!)
            : null,
        padding: EdgeInsets.symmetric(
          horizontal: isSmall ? 7.w : (isSelected ? 18.w : 17.w),
          vertical: isSmall ? 5.h : (isSelected ? 10.h : 8.h),
        ),
        margin: EdgeInsets.only(right: 10.w),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20.r),
          border: !isSelected
              ? Border.all(
                  width: isSmall ? 1.5.w : 2.w,
                  color: Colorr.primaryColor[300]!,
                )
              : null,
        ),
        child: Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: isSmall ? 9.sp : 12.sp,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
