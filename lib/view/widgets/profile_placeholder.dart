import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/utils/assets.dart';

class ProfilePlaceholder extends StatefulWidget {
  const ProfilePlaceholder({super.key});

  @override
  State<ProfilePlaceholder> createState() => _ProfilePlaceholderState();
}

class _ProfilePlaceholderState extends State<ProfilePlaceholder> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(Assets.imgProfilePlaceholder, height: 120.h, width: 120.w),

        Positioned(
          bottom: 0,
          right: 0,
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(35.r),
            child: Container(
              height: 35.h,
              width: 35.w,
              decoration: BoxDecoration(
                color: Colorr.primaryColor[400],
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2.w),
              ),
              child: Icon(Icons.edit, color: Colors.white, size: 18.sp),
            ),
          ),
        ),
      ],
    );
  }
}
