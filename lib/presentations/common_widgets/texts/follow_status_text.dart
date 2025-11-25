import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/app/config/app_colors.dart';
import 'package:newsy/app/config/custom_text_style.dart';
import 'package:newsy/app/constants/text_strings.dart';
import 'package:newsy/presentations/common_widgets/texts/text_container.dart';

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
    return TextContainer(
      border: isFollowingText
          ? null
          : Border.all(width: 2.w, color: Colorr.primaryColor[400]!),
      color: isFollowingText ? Colorr.primaryColor[400]! : Colors.transparent,

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
