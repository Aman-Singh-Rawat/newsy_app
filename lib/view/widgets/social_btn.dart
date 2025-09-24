import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final String btnText;

  const SocialBtn({
    super.key,
    required this.icon,
    required this.onTap,
    required this.btnText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade200),
      ),
      height: 48.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 24.r),
          SizedBox(width: 8.w),
          Text(
            btnText,
            style: GoogleFonts.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
