import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsy/core/theme/app_colors.dart';

import 'package:newsy/core/theme/custom_text_style.dart';
import 'package:newsy/core/utils/constants/image_strings.dart';
import 'package:newsy/core/utils/constants/text_strings.dart';
import 'package:newsy/core/utils/helpers/helper_function.dart';
import 'package:newsy/view/widgets/show_comment_dialog.dart';
import 'package:newsy/view/widgets/user_comment_field.dart';

class BeautifulCommentWidget extends StatelessWidget {
  const BeautifulCommentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = HelperFunction.isDarkMode(context);

    final colorPrimary = isDark
        ? Colorr.primaryColor[300]
        : Colorr.primaryColor[400];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: isDark ? Colorr.darkSurface : Colors.transparent,
        borderRadius: BorderRadius.circular(14.r),
        border: isDark
            ? null
            : Border.all(color: Colors.grey.shade200, width: 1.w),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                TextStrings.comments,
                style: Theme.of(
                  context,
                ).textTheme.headlineMedium!.copyWith(fontSize: 14.sp),
              ),
              SizedBox(width: 10.w),

              Text(
                "170.5k",
                style: CustomTextStyle.commentNumberTextStyle.copyWith(
                  color: colorPrimary,
                ),
              ),

              Spacer(),
              InkWell(
                onTap: () => showCommentDialog(context),
                child: SvgPicture.asset(
                  ImageStrings.icTopBottomArrow,
                  colorFilter: ColorFilter.mode(colorPrimary!, BlendMode.srcIn),
                  width: 24,
                  height: 24,
                ),
              ),
            ],
          ),

          SizedBox(height: 10.h),

          Divider(
            color: isDark
                ? Colorr.darkBackground.withOpacity(0.4)
                : Colors.grey.shade200,
          ),

          SizedBox(height: 15.h),

          UserCommentField(),
        ],
      ),
    );
  }
}
