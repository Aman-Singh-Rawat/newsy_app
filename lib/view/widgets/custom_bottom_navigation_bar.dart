import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/utils/constants/bottom_navigation_item.dart';
import 'package:newsy/core/utils/helpers/helper_function.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final Function(int) onTap;
  final int currentBottomSelectedIndex;

  const CustomBottomNavigationBar({
    super.key,
    required this.onTap,
    required this.currentBottomSelectedIndex,
  });

  BottomNavigationBarItem bottomNavigationBarItem({
    required IconData icon,
    required bool isSelected,
    required bool isDark,
    required String label,
  }) {
    return BottomNavigationBarItem(
      label: label,
      icon: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13.r),
          color: isSelected
              ? Colorr.primaryColor[400]
              : isDark
              ? Colorr.iconBg
              : Colorr.primaryColor[100]!.withOpacity(0.5),
        ),
        child: Icon(icon),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = HelperFunction.isDarkMode(context);
    return Container(
      padding: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 2,
            color: isDark ? Colorr.darkSurface : Colors.grey.shade200,
          ),
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.r),
          topRight: Radius.circular(25.r),
        ),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          iconSize: 20.w,
          onTap: onTap,
          backgroundColor: Colors.transparent,
          currentIndex: currentBottomSelectedIndex,
          items: bottomNavigationBarItemValues.asMap().entries.map((
            bottomValue,
          ) {
            final item = bottomValue.value;

            return bottomNavigationBarItem(
              icon: item["icon"],
              isSelected: currentBottomSelectedIndex == bottomValue.key,
              isDark: isDark,
              label: item["label"],
            );
          }).toList(),
        ),
      ),
    );
  }
}
