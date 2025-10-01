import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/view/views/search/hashtag_screen.dart';

class HashtagWidget extends StatelessWidget {
  final Map<String, String> hashtag;
  const HashtagWidget({super.key, required this.hashtag});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => HashtagScreen(hashtag: hashtag),
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        margin: EdgeInsets.only(bottom: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
          border: Border.all(color: Colors.grey.shade200, width: 1.5.w),
        ),
        child: Row(
          children: [
            Text(
              hashtag["tag"] as String,
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
              ),
            ),

            Spacer(),
            Text(
              hashtag["count"] as String,
              style: GoogleFonts.poppins(
                fontSize: 12.5.sp,
                fontWeight: FontWeight.w600,
                color: Colorr.primaryColor[400],
              ),
            ),

            SizedBox(width: 6.w),
            Text(
              "News",
              style: GoogleFonts.poppins(
                fontSize: 12.5.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
