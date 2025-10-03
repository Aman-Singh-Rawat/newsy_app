import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/theme/custom_text_style.dart';
import 'package:newsy/core/utils/constants.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/view/views/auth/auth_screen.dart';
import 'package:newsy/view/widgets/custom_app_bar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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

  void _handleNavigation(int index, BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => settingScreens[index]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: "Settings", context: context),
      body: Column(
        children: [
          ListView.builder(
            itemBuilder: (context, index) {
              final item = settingsItems[index];
              return Column(
                children: [
                  Divider().padSymmetric(vertical: 10.h),
                  getSettingItem(
                    icon: item["icon"],
                    title: item["title"],
                    onClick: () => _handleNavigation(index, context),
                  ),
                ],
              );
            },
          ),

          Divider().padSymmetric(vertical: 10.h),

          ListTile(
            onTap: () => Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => AuthScreen()),
              (Route<dynamic> route) => false,
            ),
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
