import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/theme/app_colors.dart';

class BtnWithBg extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  const BtnWithBg({super.key, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: Colorr.primaryColor[100]!.withOpacity(0.4),
          borderRadius: BorderRadius.circular(11.r),
        ),
        child: Icon(icon, size: 22, color: Colorr.primaryColor[400]),
      ),
    );
  }
}
