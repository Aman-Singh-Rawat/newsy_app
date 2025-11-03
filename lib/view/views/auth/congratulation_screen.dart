import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/navigation/app_navigation.dart';

import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/utils/constants/text_strings.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/core/utils/helpers/helper_function.dart';
import 'package:newsy/view/views/main_screen.dart';

import '../../../core/utils/constants/image_strings.dart';

class CongratulationScreen extends StatefulWidget {
  const CongratulationScreen({super.key});

  @override
  State<CongratulationScreen> createState() => _CongratulationScreenState();
}

class _CongratulationScreenState extends State<CongratulationScreen> {
  @override
  Widget build(BuildContext context) {
    final bool isDark = HelperFunction.isDarkMode(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Image.asset(
            isDark ? ImageStrings.imgSplashDark : ImageStrings.imgSplash,
            fit: BoxFit.cover,
            width: 260.w,
            height: 260.h,
          ),

          /// congratulation text
          Text(
            TextStrings.congratulationTitle,
            style: Theme.of(
              context,
            ).textTheme.displaySmall!.copyWith(color: Colorr.primaryColor[400]),
          ),
          SizedBox(height: 20.h),

          /// message
          Text(
            TextStrings.congratulationSubtitle,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge!.copyWith(fontSize: 13.sp),
          ),

          const Spacer(),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () =>
                  AppNavigator.pushAndRemoveAll(context, const MainScreen()),
              child: Text(TextStrings.congratulationBtnText),
            ),
          ),

          SizedBox(height: 20.h),
        ],
      ).padSymmetric(horizontal: 20.w),
    );
  }
}
