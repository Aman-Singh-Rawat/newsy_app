import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/view/widgets/custom_btn.dart';

class FeaturedWidget extends StatelessWidget {
  const FeaturedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 245.h,
      child: Stack(
        fit: StackFit.loose,
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.network(
                "https://english.cdn.zeenews.com/sites/default/files/2021/02/07/915333-tiger-shroff-pool.jpg?im=Resize=(1200,900)",
                fit: BoxFit.cover,
              ),
            ),
          ),

          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ),

          Positioned(
            bottom: 15.w,
            left: 15.w,
            right: 15.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Tiger Shroff in Press Confrences India",
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),

                SizedBox(height: 10.h),

                CustomBtn(
                  color: Colorr.primaryColor[400]!,
                  btnText: "Read Now",
                  onTap: () {},
                  width: 90.w,
                  height: 32.h,
                  btnSize: 11.sp,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
