import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/utils/enums.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/models/notification.dart' as notification_model;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/view/widgets/custom_btn.dart';

class NotificationItem extends StatelessWidget {
  final notification_model.Notification notification;
  const NotificationItem({super.key, required this.notification});

  Widget get getTitle {
    if (notification.notificationType == NotificationType.message) {
      return Text(
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        notification.title,
        style: GoogleFonts.roboto(
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      );
    } else {
      return RichText(
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          text: notification.title.split(" ").first,
          style: GoogleFonts.roboto(
            fontSize: 13.sp,
            fontWeight: FontWeight.bold,
            color: Colorr.primaryColor[400],
          ),
          children: [
            TextSpan(
              text: " ${notification.title.split(" ").skip(1).join(" ")}",
              style: GoogleFonts.roboto(
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      );
    }
  }

  Widget get getActionWiget {
    Widget widget;

    if (notification.notificationType == NotificationType.isFollowingYou) {
      widget = TextButton.icon(
        style: TextButton.styleFrom(
          fixedSize: Size(85.w, 0.h),
          backgroundColor: Colorr.primaryColor[400],

          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
        ),
        label: Text(
          "Follow",
          style: GoogleFonts.roboto(
            fontSize: 11.sp,

            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        onPressed: () {},
        icon: Icon(Icons.add, color: Colors.white, size: 15.w),
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
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: Colors.grey.shade200, width: 1),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22.r,
            backgroundImage: NetworkImage(notification.leadingImage),
          ),
          SizedBox(width: 15.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getTitle,
                if (notification.description != null) ...[
                  SizedBox(height: 6.h),
                  Text(
                    notification.description!,
                    style: GoogleFonts.roboto(
                      fontSize: 12.5.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ),
                ],

                if (notification.createdAt != null) ...[
                  SizedBox(height: 6.h),
                  Text(
                    notification.timeAgo,
                    style: GoogleFonts.roboto(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ],
            ),
          ),
          getActionWiget,
        ],
      ),
    );
  }
}
