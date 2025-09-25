import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/theme/custom_text_style.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/view/widgets/custom_btn.dart';

import '../../../core/utils/assets.dart';

class CongratulationScreen extends StatefulWidget {
  const CongratulationScreen({super.key});

  @override
  State<CongratulationScreen> createState() => _CongratulationScreenState();
}

class _CongratulationScreenState extends State<CongratulationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Image.asset(
            Assets.imgSplash,
            fit: BoxFit.cover,
            width: 260.w,
            height: 260.h,
          ),

          /// congratulation text
          Text(
            "Congratulation!",
            style: GoogleFonts.poppins(
              color: Colorr.primaryColor[400]!,
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 20.h),

          /// message
          Text(
            "Your account is ready to use",
            style: CustomTextStyle.screenDescTextStyle,
          ),

          const Spacer(),

          CustomBtn(
            color: Colorr.primaryColor[400]!,
            btnText: "Go to Homepage",
            onTap: () {},
          ),

          SizedBox(height: 20.h),
        ],
      ).padSymmetric(horizontal: 20.w)
    );
  }
}
