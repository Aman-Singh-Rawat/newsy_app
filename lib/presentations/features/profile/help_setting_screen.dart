import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/app/config/app_colors.dart';
import 'package:newsy/app/config/custom_text_style.dart';
import 'package:newsy/app/constants/constants.dart';
import 'package:newsy/core/utils/extensions.dart';
import 'package:newsy/presentations/common_widgets/appbar/appbar.dart';

class HelpSettingScreen extends StatelessWidget {
  const HelpSettingScreen({super.key});

  _handleNavigate(int index, BuildContext context) {
    final navigator = Navigator.of(context);
    if (index == 0) {
      navigator.push(MaterialPageRoute(builder: (context) => helpScreens[0]));
    } else if (index == 1) {
      navigator.push(MaterialPageRoute(builder: (context) => helpScreens[1]));
    } else if (index == helpList.length - 1) {
      navigator.push(MaterialPageRoute(builder: (context) => helpScreens[2]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Help"),
      body: SafeArea(
        child: ListView.builder(
          itemCount: helpList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  onTap: () => _handleNavigate(index, context),
                  title: Text(
                    helpList[index],
                    style: CustomTextStyle.settingScreenItemTitleStyle,
                  ),
                  trailing: InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.navigate_next,
                      color: Colorr.primaryColor[400]!.withOpacity(0.9),
                      size: 24.w,
                    ),
                  ),
                ),
                Divider().padSymmetric(horizontal: 10.h),
              ],
            );
          },
        ),
      ),
    );
  }
}
