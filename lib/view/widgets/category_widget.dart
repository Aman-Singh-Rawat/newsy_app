import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsy/core/theme/app_colors.dart';

class CategoryWidget extends StatelessWidget {
  final String categoryName;
  final bool isSelected;

  const CategoryWidget({
    super.key,
    required this.categoryName,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
        vertical: isSelected ? 10.h : 6.h,
      ),
      margin: EdgeInsets.only(right: 10.w, left: isSelected ? 20.w : 0),
      decoration: BoxDecoration(
        color: isSelected ? Colorr.primaryColor[400] : Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: !isSelected
            ? Border.all(width: 2.w, color: Colorr.primaryColor[400]!)
            : null,
      ),
      child: Text(
        categoryName,
        style: GoogleFonts.poppins(
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          color: isSelected ? Colors.white : Colorr.primaryColor[400],
        ),
      ),
    );
  }
}
