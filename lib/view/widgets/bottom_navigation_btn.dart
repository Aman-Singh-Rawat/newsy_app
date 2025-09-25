import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_btn.dart';

class BottomNavigationBtn extends StatelessWidget {
  final Color btnColor;
  final String btnText;
  final VoidCallback onTap;

  const BottomNavigationBtn({
    super.key,
    required this.btnColor,
    required this.btnText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.r),
          topRight: Radius.circular(25.r),
        ),
        border: Border.symmetric(
          horizontal: BorderSide(width: 1.5, color: Colors.grey.shade200),
        ),
      ),
      child: CustomBtn(color: btnColor, btnText: btnText, onTap: onTap),
    );
  }
}
