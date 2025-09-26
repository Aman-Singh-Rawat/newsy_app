import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/view/widgets/custom_btn.dart';

showAccountCreatedDialog() {
  return AlertDialog(
    backgroundColor: Colors.white,
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Great!\nYour account has been created successfully",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            height: 1.5,
            color: Colorr.primaryColor[400],
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),

        SizedBox(height: 20.h,),

        CustomBtn(
          color: Colorr.primaryColor[400]!,
          btnText: "Go To Home",
          onTap: () {},
        ),
      ],
    ),
  );
}
