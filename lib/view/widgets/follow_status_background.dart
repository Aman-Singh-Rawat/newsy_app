import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/theme/custom_text_style.dart';
import 'package:newsy/core/utils/constants/text_strings.dart';

class FollowStatusText extends StatelessWidget {
  final bool isFollowingText;

  const FollowStatusText({super.key, required this.isFollowingText});

  Widget buildFollowText(String btnText) {
    return Text(
      btnText,
      style: CustomTextStyle.followFollowingTextStyle.copyWith(
        color: isFollowingText ? Colors.white : Colorr.primaryColor[400],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return AnimatedContainer(
      decoration: BoxDecoration(
        color: isFollowingText ? Colorr.primaryColor[400] : Colors.transparent,
        border: isFollowingText
            ? null
            : Border.all(width: 2.w, color: Colorr.primaryColor[400]!),
        borderRadius: BorderRadius.all(Radius.circular(20.r)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.5.h),
      duration: const Duration(microseconds: 200),
      child: isFollowingText
          ? Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.add, color: Colors.white, size: 18.w),
                buildFollowText(TextStrings.follow),
              ],
            )
          : buildFollowText(TextStrings.following),
    );
  }
}
