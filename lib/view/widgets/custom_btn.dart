import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/theme/app_colors.dart';

class CustomBtn extends StatelessWidget {
  final Color color;
  final String btnText;
  final VoidCallback onTap;
  final double width;
  final double height;
  final bool isClickable;

  const CustomBtn({
    super.key,
    required this.color,
    required this.btnText,
    required this.onTap,
    this.width = double.infinity,
    this.height = 54, this.isClickable = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isClickable ? onTap : null,
      borderRadius: BorderRadius.circular(20.r),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Center(
          child: Text(
            btnText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
