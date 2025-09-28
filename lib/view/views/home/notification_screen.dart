import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/utils/assets.dart';
import 'package:newsy/core/utils/constants.dart';
import 'package:newsy/core/utils/date_formats.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/view/widgets/btn_with_bg.dart';
import 'package:newsy/view/widgets/custom_app_bar.dart';
import 'package:newsy/view/widgets/notification_item.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  get getEmptyNotification => SizedBox(
    height: double.infinity,
    width: double.infinity,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          Assets.imgNotification,
          width: 150.w,
          height: 150.h,
          fit: BoxFit.contain,
        ),
        SizedBox(height: 20),
        Text(
          "You have No Notifications",
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colorr.primaryColor[400],
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 20),
      ],
    ).padSymmetric(horizontal: 20.w),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        title: "Notification",
        context: context,
        actions: [BtnWithBg(icon: Icons.more_vert_rounded)],
      ),
      body: GroupedListView(
        elements: notificationGroups,
        groupHeaderBuilder: (element) => Text(
          DateFormat(DateFormats.articleDateFormat12).format(element.dateTime),
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black54,
          ),
        ).padOnly(bottom: 15.h, top: 15.h),
        groupBy: (element) => DateFormat(
          DateFormats.articleDateFormat12,
        ).format(element.dateTime),
        order: GroupedListOrder.DESC,
        groupSeparatorBuilder: (String date) => Text(
          date,
          style: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black.withOpacity(0.9),
          ),
        ),
        itemBuilder: (context, element) => Column(
          children: element.notifications.map((notification) {
            return NotificationItem(notification: notification);
          }).toList(),
        ),
      ).padSymmetric(horizontal: 20.w),
    );
  }
}
