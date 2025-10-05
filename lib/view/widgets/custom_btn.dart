import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBtn extends StatelessWidget {
  final Color color;
  final String btnText;
  final VoidCallback onTap;
  final double width;
  final double height;
  final double btnSize;
  final IconData? icon;
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
            Text(
              btnText,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: btnSize,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (icon != null) ...[
              SizedBox(width: 6.w),
              Icon(icon, color: Colors.white, size: 14.w),
            ],
          ],
        ),
      ),
    );
  }
}
