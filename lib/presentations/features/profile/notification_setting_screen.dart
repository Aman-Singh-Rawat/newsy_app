import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/utils/extensions.dart';
import 'package:newsy/presentations/common_widgets/appbar/appbar.dart';
import 'package:newsy/presentations/common_widgets/switch_option_widget.dart';

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
      appBar: CustomAppBar(title: "Notification"),
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
