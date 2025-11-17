import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/utils/helpers/helper_function.dart';

class CreateNewsBottomBtnBackground extends StatelessWidget {
  final IconData? icon;
  final String? imagePath;
  final Color? iconColor;
  const CreateNewsBottomBtnBackground({
    super.key,
    this.icon,
    this.imagePath,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = HelperFunction.isDarkMode(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),
        color: isDark ? Colorr.iconBg : Colorr.primaryColor[50],
      ),
      padding: EdgeInsets.symmetric(
        horizontal: icon != null ? 17.w : 15.w,
        vertical: icon != null ? 9.5.h : 8.5.h,
      ),
      child: icon == null
          ? SvgPicture.asset(
              imagePath!,
              width: 30.w,
              height: 30.h,
              colorFilter: iconColor != null
                  ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
                  : null,
            )
          : Icon(icon, color: iconColor, size: 27.w),
    );
    ;
  }
}
