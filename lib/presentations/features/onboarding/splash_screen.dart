import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:newsy/app/navigation/app_navigation.dart';
import 'package:newsy/app/config/app_colors.dart';
import 'package:newsy/app/constants/image_strings.dart';
import 'package:newsy/core/utils/helper_function.dart';
import 'package:newsy/presentations/features/onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => AppNavigator.pushReplacement(context, OnboardingScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = HelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 80.h),
                Image.asset(
                  isDark ? ImageStrings.imgSplashDark : ImageStrings.imgSplash,
                  fit: BoxFit.cover,
                  width: 260.w,
                  height: 260.h,
                ),
              ],
            ),
          ),
          SpinKitCircle(color: Colorr.primaryColor[400], size: 60.w),
          SizedBox(height: 80.h),
        ],
      ),
    );
  }
}
