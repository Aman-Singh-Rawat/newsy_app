import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/theme/custom_text_style.dart';

Widget getSettingItem({
    required IconData icon,
    required String title,
    required VoidCallback onClick,
  }) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colorr.primaryColor[50],
        ),
        child: Icon(
          icon,
          color: Colorr.primaryColor[400]!.withOpacity(0.9),
          size: 20.w,
        ),
      ),

      title: Text(title, style: CustomTextStyle.settingScreenItemTitleStyle),
      trailing: InkWell(
        onTap: () {},
        child: Icon(
          Icons.navigate_next,
          color: Colorr.primaryColor[400]!.withOpacity(0.9),
          size: 24.w,
        ),
      ),
    );
  }