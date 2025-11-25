import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:newsy/app/config/app_colors.dart';
import 'package:newsy/core/utils/helper_function.dart';
import 'package:newsy/presentations/common_widgets/custom_btn.dart';

class FeaturedWidget extends StatelessWidget {
  const FeaturedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = HelperFunction.isDarkMode(context);
    return SizedBox(
      width: double.maxFinite,
      height: 243.h,
      child: Stack(
        fit: StackFit.loose,
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Image.network(
                "https://english.cdn.zeenews.com/sites/default/files/2021/02/07/915333-tiger-shroff-pool.jpg?im=Resize=(1200,900)",
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    decoration: BoxDecoration(
                      color: isDark ? Colorr.darkSurface : Colors.grey.shade200,
                    ),
                    child: Center(child: Icon(Icons.error)),
                  );
                },
              ),
            ),
          ),

          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black12,
                    Colors.black12,
                    Colors.black54,
                    Colors.black87,
                  ],
                ),
                borderRadius: BorderRadius.circular(20.r),
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
                  style: TextStyle(
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
