import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsy/app/config/app_colors.dart';
import 'package:newsy/core/utils/helper_function.dart';

class BtnWithBg extends StatelessWidget {
  final IconData? icon;
  final String? imgPath;
  final VoidCallback? onTap;
  final EdgeInsets? padding;
  final double iconSize;
  const BtnWithBg({
    super.key,
    this.icon,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 11),
    this.iconSize = 20.0,
    this.imgPath,
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
        child: imgPath == null
            ? Icon(icon, size: iconSize.w, color: Colorr.primaryColor[400])
            : SvgPicture.asset(imgPath!, width: iconSize, height: iconSize),
      ),
    );
  }
}
