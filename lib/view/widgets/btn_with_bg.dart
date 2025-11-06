import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/utils/helpers/helper_function.dart';

class BtnWithBg extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  final EdgeInsets? padding;
  final double iconSize;
  const BtnWithBg({
    super.key,
    required this.icon,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 11),
    this.iconSize = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = HelperFunction.isDarkMode(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(11.r),
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: isDark
              ? Colorr.iconBg
              : Colorr.primaryColor[100]!.withOpacity(0.4),
          borderRadius: BorderRadius.circular(11.r),
        ),
        child: Icon(icon, size: iconSize.w, color: Colorr.primaryColor[400]),
      ),
    );
  }
}
