import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:newsy/app/navigation/app_navigation.dart';
import 'package:newsy/app/config/app_colors.dart';
import 'package:newsy/app/constants/image_strings.dart';
import 'package:newsy/core/utils/helper_function.dart';
import 'package:newsy/data/datasource/local/role_local_datasource.dart';
import 'package:newsy/presentations/features/auth/view/auth_screen.dart';
import 'package:newsy/presentations/features/onboarding/provider/onboarding_providers.dart';
import 'package:newsy/presentations/features/onboarding/role_screen.dart';
import 'package:newsy/presentations/features/onboarding/view/onboarding_screen.dart';
import 'package:newsy/presentations/root/main_screen.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  /// selecting scrren where to navigate
  Widget get getNavigationScreen {
    final onboardingSeen = ref.read(onboardingViewModelProvider);
    final role = RoleLocalDataSource().getRole();
    final loggedIn =
        FirebaseAuth.instance.currentUser != null; // TODO CHANGE THIS LATER

    if (!onboardingSeen) {
      return const OnboardingScreen();
    } else if (role == null) {
      return const RoleScreen();
    } else if (!loggedIn) {
      return const AuthScreen();
    } else {
      return const MainScreen();
    }
  }

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => AppNavigator.pushReplacement(context, getNavigationScreen),
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
