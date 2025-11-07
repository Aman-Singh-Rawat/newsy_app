import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/utils/constants/text_strings.dart';
import 'package:newsy/core/utils/helpers/helper_function.dart';
import 'package:newsy/view/views/search/hashtag_screen.dart';

class HashtagWidget extends StatelessWidget {
  final Map<String, String> hashtag;
  const HashtagWidget({super.key, required this.hashtag});

  @override
  Widget build(BuildContext context) {
    final bool isDark = HelperFunction.isDarkMode(context);

    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => HashtagScreen(hashtag: hashtag),
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 23.h),
        margin: EdgeInsets.only(bottom: 10.h),
        decoration: BoxDecoration(
          color: isDark ? Colorr.darkSurface : Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
          border: isDark
              ? null
              : Border.all(color: Colors.grey.shade200, width: 1.5.w),
        ),
        child: Row(
          children: [
            Text(
              hashtag["tag"] as String,
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(fontSize: 12.sp),
            ),

            Spacer(),
            Text(
              hashtag["count"] as String,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: Colorr.primaryColor[400],
              ),
            ),

            SizedBox(width: 6.w),
            Text(
              TextStrings.news,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 11.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
