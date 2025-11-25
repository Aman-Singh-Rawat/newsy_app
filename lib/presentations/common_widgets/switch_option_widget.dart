import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/app/config/app_colors.dart';
import 'package:newsy/app/config/custom_text_style.dart';
import 'package:newsy/core/utils/extensions.dart';

class SwitchOptionWidget extends StatelessWidget {
  final bool isSwitchSelected;
  final String switchTitle;
  final Function(bool) onSwitchClick;
  const SwitchOptionWidget({
    super.key,
    required this.isSwitchSelected,
    required this.switchTitle,
    required this.onSwitchClick,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              switchTitle,
              style: CustomTextStyle.settingScreenItemTitleStyle,
            ),

            Switch(
              value: isSwitchSelected,
              onChanged: onSwitchClick,
              trackColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.selected)) {
                  return Colorr.primaryColor[400];
                } else {
                  return Colors.grey.shade500.withOpacity(0.9);
                }
              }),

              trackOutlineColor: WidgetStateColor.resolveWith((states) {
                if (states.contains(WidgetState.selected)) {
                  return Colors.transparent;
                } else {
                  return Colors.transparent;
                }
              }),

              thumbColor: WidgetStatePropertyAll(Colors.white),
            ),
          ],
        ),

        Divider().padSymmetric(vertical: 10.h),
      ],
    );
  }
}
