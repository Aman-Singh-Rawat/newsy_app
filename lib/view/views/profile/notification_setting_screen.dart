import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/theme/custom_text_style.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/view/widgets/custom_app_bar.dart';
import 'package:newsy/view/widgets/switch_option_widget.dart';

class NotificationSettingScreen extends StatefulWidget {
  const NotificationSettingScreen({super.key});

  @override
  State<NotificationSettingScreen> createState() =>
      _NotificationSettingScreenState();
}

class _NotificationSettingScreenState extends State<NotificationSettingScreen> {
  final switchTitles = [
    "Sound",
    "Vibrate",
    "New tips available",
    "New service available",
  ];

  final areSwitchesSelected = [true, true, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: "Notification", context: context),
      body: SafeArea(
        child: ListView.builder(
          itemCount: switchTitles.length,
          itemBuilder: (context, index) => SwitchOptionWidget(
            isSwitchSelected: areSwitchesSelected[index],
            switchTitle: switchTitles[index],
            onSwitchClick: (value) {
              setState(() => areSwitchesSelected[index] = value);
            },
          ),
        ).padSymmetric(horizontal: 20.w, vertical: 10.h),
      ),
    );
  }
}
