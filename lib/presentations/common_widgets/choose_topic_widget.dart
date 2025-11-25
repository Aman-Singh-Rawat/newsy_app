import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:newsy/app/config/app_colors.dart';

class ChooseTopicWidget extends StatelessWidget {
  final Map<String, String> newsTopic;
  final bool isSelected;
  final VoidCallback onTap;

  const ChooseTopicWidget({
    super.key,
    required this.newsTopic,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23.r),
          image: DecorationImage(
            image: NetworkImage(newsTopic["imageUrl"] as String),
            fit: BoxFit.cover,
          ),
          border: isSelected
              ? Border.all(color: Colorr.primaryColor[400]!, width: 2.5.w)
              : null,
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black12, Colors.black],
                  ),
                  borderRadius: BorderRadius.circular(23.r),
                ),
              ),
            ),

            Positioned(
              bottom: 15.h,
              left: 20.w,
              child: Text(
                newsTopic["topic"] as String,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),

            // checkbox
            Positioned(
              top: 5.h,
              right: 5.w,
              child: Checkbox(value: isSelected, onChanged: null),
            ),
          ],
        ),
      ),
    );
  }
}
