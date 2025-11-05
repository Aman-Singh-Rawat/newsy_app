import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/utils/helpers/helper_function.dart';

class ChooseYourNewsWidget extends StatelessWidget {
  final Map<String, Object> newsSource;
  final VoidCallback onTap;
  final bool isSelected;
  const ChooseYourNewsWidget({
    super.key,
    required this.newsSource,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = HelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? Colorr.darkSurface : Colorr.light,
          borderRadius: BorderRadius.circular(25.r),
          border: isSelected
              ? Border.all(color: Colorr.primaryColor[400]!, width: 2.0.w)
              : isDark
              ? null
              : Border.all(color: Colors.grey.shade200, width: 2.w),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30.r,
                    backgroundColor: Colorr.primaryColor[50],
                    backgroundImage: NetworkImage(newsSource["logo"] as String),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    (newsSource["name"] as String).toUpperCase(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            // checkbox
            Positioned(
              top: 5.h,
              right: 5.w,
              child: Checkbox(value: isSelected, onChanged: null),
            ),
          ],
        ),
      ),
    );
  }
}
