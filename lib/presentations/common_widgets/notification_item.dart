import 'package:flutter/material.dart';

import 'package:newsy/app/config/app_colors.dart';
import 'package:newsy/app/constants/text_strings.dart';
import 'package:newsy/app/constants/enums.dart';
import 'package:newsy/core/utils/extensions.dart';
import 'package:newsy/core/utils/helper_function.dart';
import 'package:newsy/data/models/notification.dart' as notification_model;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationItem extends StatelessWidget {
  final notification_model.Notification notification;
  const NotificationItem({super.key, required this.notification});

  Widget getTitle(BuildContext context) {
    if (notification.notificationType == NotificationType.message) {
      return Text(
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        notification.title,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 13.sp,
        ),
      );
    } else {
      return RichText(
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          text: notification.title.split(" ").first,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
            color: Colorr.primaryColor[400],
          ),
          children: [
            TextSpan(
              text: " ${notification.title.split(" ").skip(1).join(" ")}",
              style: Theme.of(
                context,
              ).textTheme.headlineMedium!.copyWith(fontSize: 12.sp),
            ),
          ],
        ),
      );
    }
  }

  Widget getActionWiget(BuildContext context) {
    Widget widget;

    if (notification.notificationType == NotificationType.isFollowingYou) {
      widget = GestureDetector(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 5.h),
          decoration: BoxDecoration(
            color: Colorr.primary,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Row(
            children: [
              Icon(Icons.add, size: 18.w, color: Colorr.light),
              SizedBox(width: 5.w),
              Text(
                TextStrings.follow,
                style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      );
    } else if (notification.newsImage != null) {
      widget = ClipRRect(
        borderRadius: BorderRadius.circular(4.r),
        child: Image.network(
          notification.newsImage!,
          width: 35.w,
          height: 35.h,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return SizedBox.shrink();
    }

    return widget.padOnly(left: 7.w);
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = HelperFunction.isDarkMode(context);

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: isDark ? Colorr.darkSurface : Colors.transparent,
        borderRadius: BorderRadius.circular(14.r),
        border: isDark
            ? null
            : Border.all(color: Colors.grey.shade200, width: 1),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 21.r,
            backgroundImage: NetworkImage(notification.leadingImage),
          ),
          SizedBox(width: 15.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getTitle(context),
                if (notification.description != null) ...[
                  SizedBox(height: 6.h),
                  Text(
                    notification.description!,
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],

                if (notification.createdAt != null) ...[
                  SizedBox(height: 6.h),
                  Text(
                    notification.timeAgo,
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 9.sp,
                    ),
                  ),
                ],
              ],
            ),
          ),
          getActionWiget(context),
        ],
      ),
    );
  }
}
