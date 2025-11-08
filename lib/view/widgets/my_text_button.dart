import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/utils/helpers/helper_function.dart';

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String text;
  const ActionButton({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    final bool isDark = HelperFunction.isDarkMode(context);
    final currentPrimaryColor = isDark
        ? Colorr.primaryColor[300]
        : Colorr.primaryColor[400];
    return Row(
      children: [
        Icon(icon, size: 17.w, color: currentPrimaryColor),

        SizedBox(width: 5.w),

        Text(
          text,
          style: Theme.of(
            context,
          ).textTheme.bodyLarge!.copyWith(fontSize: 11.sp),
        ),
      ],
    );
  }
}
