import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/navigation/app_navigation.dart';

import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/utils/constants/image_strings.dart';
import 'package:newsy/core/utils/constants/text_strings.dart';
import 'package:newsy/core/utils/helpers/helper_function.dart';
import 'package:newsy/view/views/main_screen.dart';

showAccountCreatedDialog({required BuildContext context}) {
  final bool isDark = HelperFunction.isDarkMode(context);

  return AlertDialog(
    backgroundColor: isDark ? Colorr.darkBackground : Colorr.light,
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(ImageStrings.imgSuccessDialog, height: 230.h, width: 240.w),

        Text(
          TextStrings.profileSetupDialogTitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            height: 1.5,
            color: Colorr.primaryColor[400]!.withOpacity(0.9),
            fontSize: 17.sp,
            fontWeight: FontWeight.w500,
          ),
        ),

        SizedBox(height: 20.h),

        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () =>
                AppNavigator.pushAndRemoveAll(context, const MainScreen()),
            child: Text(TextStrings.goToHome),
          ),
        ),

        SizedBox(height: 10.h),
      ],
    ),
  );
}
