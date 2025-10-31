import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialStatsWidget extends StatelessWidget {
  final String category;
  final String value;
  const SocialStatsWidget({
    super.key,
    required this.category,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          value,
          maxLines: 1,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,

            fontWeight: FontWeight.w600,
          ),
        ),

        SizedBox(height: 6.h),

        Text(
          category,
          maxLines: 1,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
