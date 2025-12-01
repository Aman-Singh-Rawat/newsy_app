import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newsy/app/config/app_colors.dart';
import 'package:newsy/core/utils/helper_function.dart';

class SocialBtn extends StatelessWidget {
  final String icon;
  final VoidCallback onTap;
  final String btnText;

  const SocialBtn({
    super.key,
    required this.icon,
    required this.onTap,
    required this.btnText,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunction.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? Colorr.darkSurface : Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: isDark ? null : Border.all(color: Colors.grey.shade200),
        ),
        height: 48.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(icon, height: 18.h, width: 20.w),
            SizedBox(width: 12.w),
            Text(
              btnText,
              style: Theme.of(
                context,
              ).textTheme.headlineMedium!.copyWith(fontSize: 13.sp),
            ),
          ],
        ),
      ),
    );
  }
}
