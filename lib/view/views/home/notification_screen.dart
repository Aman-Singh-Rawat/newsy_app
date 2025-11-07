import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:newsy/core/theme/custom_text_style.dart';
import 'package:newsy/core/utils/constants/image_strings.dart';
import 'package:newsy/core/utils/constants.dart';
import 'package:newsy/core/utils/date_formats.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/view/widgets/appbar/appbar.dart';
import 'package:newsy/view/widgets/btn_with_bg.dart';
import 'package:newsy/view/widgets/notification_item.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final bool _isEmpty = false;

  get getEmptyNotification => Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          ImageStrings.imgNotification,
          width: 180.w,
          height: 180.h,
          fit: BoxFit.contain,
        ),
        SizedBox(height: 20),
        Text(
          "You have No Notifications",
          style: CustomTextStyle.emptyTextStyle,
        ),
        SizedBox(height: 60),
      ],
    ).padSymmetric(horizontal: 20.w),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Notification",
        actions: [BtnWithBg(icon: Icons.more_vert_rounded)],
      ),
      body: _isEmpty
          ? getEmptyNotification
          : GroupedListView(
              elements: notificationGroups,
              groupHeaderBuilder: (element) => Text(
                DateFormat(
                  DateFormats.articleDateFormat12,
                ).format(element.dateTime),
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500),
              ).padOnly(bottom: 15.h, top: 15.h),
              groupBy: (element) => DateFormat(
                DateFormats.articleDateFormat12,
              ).format(element.dateTime),
              order: GroupedListOrder.DESC,
              groupSeparatorBuilder: (String date) => Text(
                date,
                style: TextStyle(
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
