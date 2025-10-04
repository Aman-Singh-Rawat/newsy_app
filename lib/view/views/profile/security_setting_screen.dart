import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/view/widgets/custom_app_bar.dart';
import 'package:newsy/view/widgets/my_outline_button.dart';
import 'package:newsy/view/widgets/switch_option_widget.dart';

class SecuritySettingScreen extends StatefulWidget {
  const SecuritySettingScreen({super.key});

  @override
  State<SecuritySettingScreen> createState() => _SecuritySettingScreenState();
}

class _SecuritySettingScreenState extends State<SecuritySettingScreen> {
  final switchTitles = ["Face ID", "Remember me", "Touch ID"];

  final areSwitchesSelected = [true, true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: "Security", context: context),
      body: SafeArea(
        child: Column(
          children: [
            ListView.builder(
              itemCount: switchTitles.length,
              itemBuilder: (context, index) => SwitchOptionWidget(
                isSwitchSelected: areSwitchesSelected[index],
                switchTitle: switchTitles[index],
                onSwitchClick: (value) {
                  setState(() => areSwitchesSelected[index] = value);
                },
              ),
            ),
            MyOutlineButton(onClick: () {}, btnText: "Change Password"),
          ],
        ).padSymmetric(horizontal: 20.w, vertical: 10.h),
      ),
    );
  }
}
