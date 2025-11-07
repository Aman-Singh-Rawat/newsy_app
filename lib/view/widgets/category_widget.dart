import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/utils/helpers/helper_function.dart';

class CategoryWidget extends StatelessWidget {
  final String categoryName;
  final bool isSelected;
  final int index;
  final VoidCallback onCategoryChoose;

  const CategoryWidget({
    super.key,
    required this.categoryName,
    required this.isSelected,
    required this.index,
    required this.onCategoryChoose,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = HelperFunction.isDarkMode(context);

    return GestureDetector(
      onTap: onCategoryChoose,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: isSelected ? 18.w : 17.w,
          vertical: isSelected ? 10.h : 8.h,
        ),
        margin: EdgeInsets.only(right: 10.w, left: index == 0 ? 20.w : 0),
        decoration: BoxDecoration(
          color: isSelected
              ? Colorr.primaryColor[400]
              : isDark
              ? Colorr.darkSurface
              : Colorr.light,
          borderRadius: BorderRadius.circular(20.r),
          border: !isSelected
              ? Border.all(width: 2.w, color: Colorr.primaryColor[300]!)
              : null,
        ),
        child: Text(
          categoryName,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: isSelected
                ? Colors.white
                : isDark
                ? Colorr.primaryColor[300]
                : Colorr.primaryColor[400],
          ),
        ),
      ),
    );
  }
}
