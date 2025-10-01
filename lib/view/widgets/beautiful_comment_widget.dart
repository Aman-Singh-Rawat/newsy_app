import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/utils/assets.dart';
import 'package:newsy/core/utils/extension.dart';

class BeautifulCommentWidget extends StatelessWidget {
  const BeautifulCommentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: Colors.grey.shade200, width: 1.w),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Comments",
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                ),
              ),

              SizedBox(width: 10.w),

              Text(
                "170.5k",
                style: GoogleFonts.poppins(
                  color: Colorr.primaryColor[400],
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                ),
              ),

              Spacer(),
              SvgPicture.asset(
                Assets.icTopBottomArrow,
                width: 24,
                height: 24,
              ),
            ],
          ),

          Divider(color: Colors.grey.shade200).padSymmetric(vertical: 17.h),

          Row(
            children: [
              CircleAvatar(
                radius: 24.r,
                backgroundImage: NetworkImage(
                  "https://media.istockphoto.com/id/1326417862/photo/young-woman-laughing-while-relaxing-at-home.jpg?s=612x612&w=0&k=20&c=cd8e6RBGOe4b8a8vTcKW0Jo9JONv1bKSMTKcxaCra8c=",
                ),
              ),

              SizedBox(width: 10.w),

              Expanded(
                child: TextFormField(
                  style: GoogleFonts.poppins(
                    fontSize: 13.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: InputDecoration(hintText: "Add a Comment..."),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
