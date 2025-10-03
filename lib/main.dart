import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/theme/custom_text_style.dart';
import 'package:newsy/view/views/auth/auth_screen.dart';
import 'package:newsy/view/views/auth/otp_screen.dart';
import 'package:newsy/view/views/home/home_screen.dart';
import 'package:newsy/view/views/home/news_detail_screen.dart';
import 'package:newsy/view/views/home/notification_screen.dart';
import 'package:newsy/view/views/main_screen.dart';
import 'package:newsy/view/views/onboarding/splash_screen.dart';
import 'package:newsy/view/views/search/hashtag_screen.dart';
import 'package:newsy/view/views/search/search_screen.dart';
import 'package:newsy/view/views/setup-profile/choose_your_news_sources.dart';
import 'package:newsy/view/views/setup-profile/fill_your_profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, ctx) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'News App',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: Colorr.primaryColor[400]!, // Global cursor color
              selectionHandleColor: Colorr
                  .primaryColor[400]!, // Optional: also change the selection handle color
            ),
            tabBarTheme: TabBarThemeData(
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.grey.shade300,
              dividerHeight: 1.5.h,

              unselectedLabelColor: Colors.black,
              unselectedLabelStyle: CustomTextStyle.tabTextStyle,
              overlayColor: WidgetStatePropertyAll(Colors.transparent),
              indicatorColor: Colorr.primaryColor[400],
              labelColor: Colors.black,
              labelStyle: CustomTextStyle.tabTextStyle,
            ),
            inputDecorationTheme: InputDecorationTheme(
              contentPadding: EdgeInsets.symmetric(
                vertical: 12.h,
                horizontal: 14.w,
              ),
              hintStyle: GoogleFonts.poppins(
                color: Colors.grey.shade400,
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.r),
                borderSide: BorderSide(
                  color: Colors.grey.shade200,
                  width: 1.5.w,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.r),
                borderSide: BorderSide(
                  color: Colorr.primaryColor[400]!,
                  width: 2.w,
                ),
              ),
            ),
            checkboxTheme: CheckboxThemeData(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),

              side: BorderSide(color: Colorr.primaryColor[400]!, width: 1.5.w),
            ),
            appBarTheme: AppBarTheme(
              scrolledUnderElevation: 0.0,
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Colorr.primaryColor[400]!),
              titleTextStyle: GoogleFonts.poppins(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            fontFamily: GoogleFonts.poppins().fontFamily,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colorr.primaryColor[400]!,
            ),
          ),
          home: AuthScreen(),
        );
      },
    );
  }
}
