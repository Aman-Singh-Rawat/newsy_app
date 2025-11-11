import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/core/utils/helpers/helper_function.dart';
import 'package:newsy/view/views/home/news_detail_screen.dart';
import 'package:newsy/view/widgets/my_text_button.dart';

class NewsWidget extends StatelessWidget {
  final VoidCallback? onBookmarkClick;
  final VoidCallback? onEdit;
  final Color nightColor;
  const NewsWidget({
    super.key,
    this.onBookmarkClick,
    this.onEdit,
    this.nightColor = Colorr.darkSurface,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = HelperFunction.isDarkMode(context);
    final currentPrimaryColor = isDark
        ? Colorr.primaryColor[300]
        : Colorr.primaryColor[400];

    return GestureDetector(
      onTap: () => Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => NewsDetailScreen())),
      child: Container(
        width: double.infinity,
        height: 150.h,
        decoration: BoxDecoration(
          color: isDark ? nightColor : Colors.transparent,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isDark ? Colors.transparent : Colors.grey.shade200,
            width: 1.5.w,
          ),
        ),
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
                    "Wow! USA Developers New Way of Faster and More what do you think",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 13.sp,
                      height: 1.5.h,
                    ),
                  ),

                  SizedBox(height: 15.h),

                  Row(
                    children: [
                      CircleAvatar(
                        radius: 12.w,
                        backgroundImage: NetworkImage(
                          "https://cdn.pixabay.com/photo/2025/10/17/15/16/halloween-9900545_1280.jpg",
                        ),
                        backgroundColor: isDark
                            ? Colorr.darkBackground
                            : Colors.grey.shade200,
                      ),

                      SizedBox(width: 8.w),

                      Flexible(
                        child: Text(
                          "BBC News",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),

                      Container(
                        constraints: BoxConstraints(maxWidth: 60),
                        margin: EdgeInsets.only(left: 12.w),
                        padding: EdgeInsets.symmetric(
                          horizontal: 7.w,
                          vertical: 5.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(
                            width: 1.5.w,
                            color: currentPrimaryColor!,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Health",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 9.sp,
                              color: currentPrimaryColor,
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /// Like
                      ActionButton(icon: Icons.thumb_up, text: "316k"),
                      SizedBox(width: 15.w),

                      /// Comments
                      ActionButton(icon: Icons.message, text: "316k"),
                      SizedBox(width: 15.w),

                      Spacer(),

                      InkWell(
                        onTap: onBookmarkClick,
                        child: Icon(
                          size: 18.w,
                          CupertinoIcons.bookmark,
                          color: currentPrimaryColor,
                        ),
                      ),

                      SizedBox(width: 10.w),

                      if (onEdit != null)
                        InkWell(
                          onTap: onEdit,
                          child: Icon(
                            Icons.edit,
                            size: 18.w,
                            color: currentPrimaryColor,
                          ),
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
