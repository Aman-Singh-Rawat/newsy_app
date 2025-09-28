import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/utils/assets.dart';
import 'package:newsy/view/views/home/home_screen.dart';
import 'package:newsy/view/widgets/custom_btn.dart';

showAccountCreatedDialog({required BuildContext context}) {
  return AlertDialog(
    backgroundColor: Colors.white,
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 24.h),
        Image.asset(Assets.imgSuccessDialog, height: 150.h, width: 150.w),

        SizedBox(height: 20.h),

        Text(
          "Great!\nYour account has been created successfully",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            height: 1.5,
            color: Colorr.primaryColor[400],
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),

        SizedBox(height: 20.h),

        CustomBtn(
          height: 46.h,
          color: Colorr.primaryColor[400]!.withOpacity(0.9),
          btnText: "Go To Home",
          onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()))
        ),

        SizedBox(height: 10.h),
      ],
    ),
  );
}
