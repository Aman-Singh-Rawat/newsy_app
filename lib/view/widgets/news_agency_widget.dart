
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsy/core/theme/app_colors.dart';

class NewsAgencyWidget extends StatelessWidget {
  final bool isSelected;
  final Function(int) onClick;
  final bool isForgotPassword;
  final Map<String, dynamic> dataList;

  const NewsAgencyWidget({
    super.key,
    required this.isSelected,
    required this.onClick,
    required this.dataList,
    this.isForgotPassword = true,
  });

  TextStyle get getHeadingStyle {
    if (isForgotPassword) {
      return GoogleFonts.poppins(
        color: Colors.black54,
        fontSize: 11,
        fontWeight: FontWeight.w500,
      );
    } else {
      return GoogleFonts.poppins(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      );
    }
  }

  TextStyle get getSubHeadingStyle {
    if (isForgotPassword) {
      return GoogleFonts.poppins(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      );
    } else {
      return GoogleFonts.poppins(
        color: Colors.black54,
        fontSize: 11,
        fontWeight: FontWeight.w500,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
  
    return GestureDetector(
      onTap: () {
        onClick(dataList["index"]);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: isSelected ? 2.w : 1.5.w,
            color: isSelected
                ? (Colorr.primaryColor[400]!).withOpacity(0.8)
                : Colors.grey.shade100,
          ),
          boxShadow: [
            BoxShadow(
              color: Colorr.primaryColor[20]!.withOpacity(0.2), // Shadow color
              offset: const Offset(4, 4), // X and Y offset
              blurRadius: 8, // Blur intensity
              spreadRadius: 2, // Spread of the shadow
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colorr.primaryColor[20],
                child: Icon(
                  dataList["icon"],
                  size: 30.w,
                  color: Colorr.primaryColor[400]!.withOpacity(0.8),
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(dataList["category"], style: getHeadingStyle),

                  const SizedBox(height: 10),
                  Text(dataList["description"], style: getSubHeadingStyle),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
