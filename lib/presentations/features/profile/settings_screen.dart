import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/app/config/app_colors.dart';
import 'package:newsy/app/config/custom_text_style.dart';
import 'package:newsy/app/constants/constants.dart';
import 'package:newsy/core/utils/extensions.dart';
import 'package:newsy/presentations/common_widgets/appbar/appbar.dart';
import 'package:newsy/presentations/common_widgets/get_setting.dart';
import 'package:newsy/presentations/common_widgets/logout_dialog.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  void _handleNavigation(int index, BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => settingScreens[index]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Settings",),
      body: Column(
        children: [
          ...settingsItems.asMap().entries.map((settingItem) {
            final item = settingItem.value;
            return Column(
              children: [
                Divider().padSymmetric(vertical: 8.h),
                getSettingItem(
                  icon: item["icon"],
                  title: item["title"],
                  onClick: () => _handleNavigation(settingItem.key, context),
                ),
              ],
            );
          }),

          Divider().padSymmetric(vertical: 10.h),

          ListTile(
            onTap: () => showLogoutDialgo(context),
            leading: Container(
              padding: EdgeInsets.all(14.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colorr.primaryColor[50],
              ),
              child: Icon(
                Icons.logout,
                color: Colorr.primaryColor[400]!.withOpacity(0.9),
                size: 20.w,
              ),
            ),

            title: Text(
              "Logout",
              style: CustomTextStyle.settingScreenItemTitleStyle,
            ),
          ),
        ],
      ).padSymmetric(horizontal: 20.w),
    );
  }
}
