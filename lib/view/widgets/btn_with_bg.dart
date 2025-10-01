import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/theme/app_colors.dart';

class BtnWithBg extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  final double padding;
  final double iconSize;
  const BtnWithBg({
    super.key,
    required this.icon,
    this.onTap,
    this.padding = 8,
    this.iconSize = 22.0,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(11.r),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: padding.w,
          vertical: padding.h,
        ),
        decoration: BoxDecoration(
          color: Colorr.primaryColor[100]!.withOpacity(0.4),
          borderRadius: BorderRadius.circular(11.r),
        ),
        child: Icon(icon, size: iconSize.w, color: Colorr.primaryColor[400]),
      ),
    );
  }
}
