import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/view/widgets/appbar/appbar.dart';
import 'package:newsy/view/widgets/switch_option_widget.dart';

class AppearanceSettingScreen extends StatefulWidget {
  const AppearanceSettingScreen({super.key});

  @override
  State<AppearanceSettingScreen> createState() =>
      _AppearanceSettingScreenState();
}

class _AppearanceSettingScreenState extends State<AppearanceSettingScreen> {
  final switchTitles = ["Dark Mode", "Blur Background", "Full Screen Mode"];

  final areSwitchesSelected = [false, true, true];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Appearance"),
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
          ],
        ).padSymmetric(horizontal: 20.w, vertical: 10.h),
      ),
    );
  }
}
