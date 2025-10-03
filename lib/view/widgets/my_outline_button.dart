import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsy/core/theme/app_colors.dart';

class MyOutlineButton extends StatelessWidget {
  final double width;
  final double height;
  final IconData? icon;
  final VoidCallback onClick;
  final String btnText;

  const MyOutlineButton({
    super.key,
    this.width = double.maxFinite,
    this.height = 47,
    required this.onClick,
    required this.btnText,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: OutlinedButton.icon(
        onPressed: onClick,

        icon: icon != null
            ? Icon(icon, color: Colorr.primaryColor[400], size: 20.w)
            : null,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colorr.primaryColor[400]!, width: 2),
        ),
        label: Text(
          btnText,
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            color: Colorr.primaryColor[400],
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
