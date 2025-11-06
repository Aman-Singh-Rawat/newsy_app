import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_quill/flutter_quill.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/theme/theme.dart';
import 'package:newsy/view/views/main_screen.dart';

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
          themeMode: ThemeMode.system,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          debugShowCheckedModeBanner: false,
          title: 'News App',

          localizationsDelegates: const [
            FlutterQuillLocalizations.delegate, // ← Add this
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],

          home: MainScreen(),
        );
      },
    );
  }
}

/* 
  theme: ThemeData(
            dialogTheme: DialogThemeData(backgroundColor: Colors.white),
            scaffoldBackgroundColor: Colors.white,
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: Colorr.primaryColor[400]!,
              selectionHandleColor: Colorr.primaryColor[400]!,
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
              hintStyle: TextStyle(
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
            dividerTheme: DividerThemeData(color: Colors.grey.shade200),
            bottomSheetTheme: BottomSheetThemeData(
              dragHandleColor: Colors.grey.shade200,
            ),
            appBarTheme: AppBarTheme(
              scrolledUnderElevation: 0.0,
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Colorr.primaryColor[400]!),
              titleTextStyle: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            fontFamily: TextStyle().fontFamily,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colorr.primaryColor[400]!,
            ),
          ),
 */
