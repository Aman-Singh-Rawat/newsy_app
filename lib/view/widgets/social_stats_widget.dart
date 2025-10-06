import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialStatsWidget extends StatelessWidget {
  final String category;
  final String value;
  const SocialStatsWidget({super.key, required this.category, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          value,
          maxLines: 1,
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 20.sp,

            fontWeight: FontWeight.w600,
          ),
        ),

        SizedBox(height: 10.h),

        Text(
          category,
          maxLines: 1,
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}