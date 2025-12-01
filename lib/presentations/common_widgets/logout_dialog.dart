import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:newsy/app/config/app_colors.dart';
import 'package:newsy/core/utils/extensions.dart';
import 'package:newsy/presentations/features/auth/view/auth_screen.dart';
import 'package:newsy/presentations/common_widgets/custom_btn.dart';
import 'package:newsy/presentations/common_widgets/my_outline_button.dart';

showLogoutDialgo(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Colors.white,
    isScrollControlled: true,
    showDragHandle: true,
    context: context,
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 15.h),
          Icon(Icons.logout, size: 48, color: Colorr.primaryColor[400]),
          Text(
            "Are you sure want to logout?",
            style: TextStyle(
              color: Colors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ).padSymmetric(vertical: 28.h),

          Row(
            children: [
              Expanded(
                child: MyOutlineButton(
                  onClick: () => Navigator.of(context).pop(),
                  btnText: "Cancel",
                ),
              ),

              SizedBox(width: 20.w),

              Expanded(
                child: CustomBtn(
                  height: 48,
                  color: Colorr.primaryColor[400]!,
                  btnText: "Yes, Logout",
                  onTap: () => Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => AuthScreen()),
                    (Route<dynamic> route) => false,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
        ],
      ).padSymmetric(horizontal: 20.w);
    },
  );
}
