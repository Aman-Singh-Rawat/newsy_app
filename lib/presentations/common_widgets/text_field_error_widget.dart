import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/app/config/app_colors.dart';
import 'package:newsy/core/utils/helper_function.dart';

class TextFieldErrorWidget extends StatelessWidget {
  final String errorText;
  const TextFieldErrorWidget({super.key, required this.errorText});

  @override
  Widget build(BuildContext context) {
    final bool isDark = HelperFunction.isDarkMode(context);
    return Container(
      margin: EdgeInsets.only(top: 6.h),
      decoration: BoxDecoration(
        color: isDark ? Colorr.iconBg : Colorr.primaryColor[20]!,
        borderRadius: BorderRadius.circular(20.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.error, color: Colorr.primaryColor[700]!, size: 18.w),
          const SizedBox(width: 5),
          Expanded(
            child: Text(
              errorText,
              maxLines: 2,
              style: TextStyle(
                fontSize: 11.sp,
                overflow: TextOverflow.ellipsis,
                color: Colorr.primaryColor[700]!,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
