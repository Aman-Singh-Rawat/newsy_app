import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/utils/assets.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/view/widgets/btn_with_bg.dart';
import 'package:newsy/view/widgets/custom_app_bar.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        title: "Notification",
        context: context,
        actions: [BtnWithBg(icon: Icons.more_vert_rounded)],
      ),
      body: SizedBox(
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
      ),
    );
  }
}
