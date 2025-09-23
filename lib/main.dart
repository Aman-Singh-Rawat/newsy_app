import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/view/views/onboarding/onboarding_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (_, context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'News App',
          theme: ThemeData(
            fontFamily: GoogleFonts.lato().fontFamily,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colorr.primaryColor[400]!,
            ),
          ),
          home: const OnboardingScreen(),
        );
      },
    );
  }
}
