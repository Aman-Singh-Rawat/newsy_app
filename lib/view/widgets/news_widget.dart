import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/view/views/home/news_detail_screen.dart';

class NewsWidget extends StatefulWidget {
  const NewsWidget({super.key});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => NewsDetailScreen())),
      child: Container(
        width: double.infinity,
        height: 150.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: Colors.grey.shade200, width: 1.5.w),
        ),
        margin: EdgeInsets.symmetric(vertical: 5.h),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  bottomLeft: Radius.circular(20.r),
                ),
                child: Image.network(
                  fit: BoxFit.cover,
                  "https://images.pexels.com/photos/1887624/pexels-photo-1887624.jpeg?_gl=1*6dygbj*_ga*MTcxMzc4NDA4NC4xNzU4ODg1NjE0*_ga_8JE65Q40S6*czE3NTg4ODU2MTQkbzEkZzAkdDE3NTg4ODU2MTQkajYwJGwwJGgw",
                ),
              ),
            ),

            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Wow! USA Developers New Way of Faster and More",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.roboto(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(height: 15.h),

                  Row(
                    children: [
                      CircleAvatar(
                        radius: 12.w,
                        backgroundColor: Colorr.primaryColor[400],
                      ),

                      SizedBox(width: 8.w),

                      Text(
                        "BBC News",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.roboto(
                          fontSize: 11.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      Container(
                        width: 63.w,
                        margin: EdgeInsets.only(left: 12.w),
                        padding: EdgeInsets.symmetric(
                          horizontal: 11.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(
                            width: 1.5.w,
                            color: Colorr.primaryColor[400]!,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Health",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.roboto(
                              fontSize: 9.sp,
                              color: Colorr.primaryColor[400],
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 15.h),

                  /// actions buttons
                  Row(
                    children: [
                      Icon(
                        Icons.thumb_up,
                        size: 18.w,
                        color: Colorr.primaryColor[400],
                      ),

                      SizedBox(width: 5.w),

                      Text(
                        "316k",
                        style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 11.sp,
                        ),
                      ),

                      SizedBox(width: 10.w),

                      Icon(
                        Icons.message,
                        size: 18.w,
                        color: Colorr.primaryColor[400],
                      ),

                      SizedBox(width: 6.w),

                      Text(
                        "316k",
                        style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 11.sp,
                        ),
                      ),

                      Spacer(),

                      Icon(
                        Icons.bookmark_outline,
                        color: Colorr.primaryColor[400],
                      ),
                    ],
                  ),
                ],
              ).marginSymmetric(horizontal: 10.w),
            ),
          ],
        ),
      ),
    );
  }
}
