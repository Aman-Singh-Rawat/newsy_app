import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:newsy/app/config/app_colors.dart';
import 'package:newsy/app/navigation/app_navigation.dart';
import 'package:newsy/core/utils/extensions.dart';
import 'package:newsy/core/utils/helper_function.dart';
import 'package:newsy/data/models/news_article.dart';
import 'package:newsy/presentations/common_widgets/category_widget.dart';
import 'package:newsy/presentations/common_widgets/images/image_error.dart';
import 'package:newsy/presentations/common_widgets/placeholder/image_shimmer.dart';
import 'package:newsy/presentations/features/home/view/news_detail_screen.dart';
import 'package:newsy/presentations/common_widgets/my_text_button.dart';

class NewsWidget extends StatelessWidget {
  final NewsArticle? article;
  final VoidCallback? onBookmarkClick;
  final VoidCallback? onEdit;
  final Color nightColor;
  const NewsWidget({
    super.key,
    this.onBookmarkClick,
    this.onEdit,
    this.nightColor = Colorr.darkSurface,
    this.article,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = HelperFunction.isDarkMode(context);
    final currentPrimaryColor = isDark
        ? Colorr.primaryColor[300]
        : Colorr.primaryColor[400];

    return GestureDetector(
      onTap: () => AppNavigator.push(context, const NewsDetailScreen()),
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
              child: article != null
                  ? NewsImageWidget(imageUrl: article!.imageUrl)
                  : ImageError(),
            ),

            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    article != null
                        ? article!.title
                        : "Wow! USA Developers New Way of Faster and More what do you think",
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
                          article != null
                              ? article!.sourceIcon
                              : "https://cdn.pixabay.com/photo/2025/10/17/15/16/halloween-9900545_1280.jpg",
                        ),
                        backgroundColor: isDark
                            ? Colorr.darkBackground
                            : Colors.grey.shade200,
                      ),

                      SizedBox(width: 8.w),

                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                article != null
                                    ? article!.sourceName
                                    : "BBC News",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.titleLarge!
                                    .copyWith(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                            CategoryChip(
                              label:
                                  (article == null || article!.category == null)
                                  ? "Health"
                                  : article!.category![0],

                              isSmall: true,
                            ),
                          ],
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
                      ActionButton(
                        icon: Icons.thumb_up,
                        text: article?.likesCount.toString() ?? "0",
                      ),

                      SizedBox(width: 15.w),

                      /// Comments
                      ActionButton(
                        icon: Icons.message,
                        text: article?.commentsCount.toString() ?? "0",
                      ),
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

class NewsImageWidget extends StatelessWidget {
  const NewsImageWidget({super.key, this.imageUrl});

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.r),
        bottomLeft: Radius.circular(20.r),
      ),
      child: imageUrl != null
          ? CachedNetworkImage(
              fit: BoxFit.cover,
              placeholder: (context, url) => ImageShimmer(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  bottomLeft: Radius.circular(20.r),
                ),
                height: double.infinity,
                width: double.infinity,
              ),
              errorWidget: (context, url, error) => ImageError(),
              imageUrl: imageUrl!,
              width: double.maxFinite,
              height: double.maxFinite,
            )
          : ImageError(),
    );
  }
}
