import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBtn extends StatelessWidget {
  final Color color;
  final String btnText;
  final VoidCallback onTap;
  final double width;
  final double height;
  final double btnSize;
  final IconData? icon;
  final bool isPrefixIcon;
  final bool isClickable;

  const CustomBtn({
    super.key,
    required this.color,
    required this.btnText,
    required this.onTap,
    this.width = double.infinity,
    this.height = 54,
    this.icon,
    this.isClickable = true,
    this.btnSize = 14,
    this.isPrefixIcon = false,
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isPrefixIcon) ...[
              Icon(icon, color: Colors.white, size: 14.w),
              SizedBox(width: 6.w),
            ],
            Text(
              btnText,
              style: TextStyle(
                color: Colors.white,
                fontSize: btnSize,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (icon != null && !isPrefixIcon) ...[
              SizedBox(width: 6.w),
              Icon(icon, color: Colors.white, size: 14.w),
            ],
          ],
        ),
      ),
    );
  }
}
