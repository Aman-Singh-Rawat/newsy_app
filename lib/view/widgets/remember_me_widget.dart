import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theme/app_colors.dart';

class RememberMeWidget extends StatelessWidget {
  final bool isRememberMe;
  final ValueChanged<bool?> onChanged;

  const RememberMeWidget({
    super.key,
    required this.isRememberMe,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          side: BorderSide(color: Colorr.primaryColor[400]!, width: 1.5.w),
          value: isRememberMe,
          onChanged: onChanged,
          activeColor: Colorr.primaryColor[400]!,
        ),

        Text(
          "Remember me",
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ],
    );
  }
}
