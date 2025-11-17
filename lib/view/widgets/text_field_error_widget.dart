import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/theme/app_colors.dart';

class TextFieldErrorWidget extends StatelessWidget {
  const TextFieldErrorWidget({super.key, required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: false,
      child: Container(
        margin: EdgeInsets.only(top: 6.h),
        decoration: BoxDecoration(
          color: isDark ? Colorr.iconBg : Colorr.primaryColor[20]!,
          borderRadius: BorderRadius.circular(20.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
        child: Row(
          children: [
            Icon(Icons.error, color: Colorr.primaryColor[700]!),
            const SizedBox(width: 5),
            Text(
              "Invalid email",
              style: TextStyle(
                color: Colorr.primaryColor[700]!,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
