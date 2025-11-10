import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/theme/custom_text_style.dart';
import 'package:newsy/core/utils/constants.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/core/utils/helpers/helper_function.dart';
import 'package:newsy/view/widgets/comment_widget.dart';
import 'package:newsy/view/widgets/user_comment_field.dart';

import '../../core/utils/constants/text_strings.dart';

void showCommentDialog(BuildContext context) {
  final bool isDark = HelperFunction.isDarkMode(context);
  final colorPrimary = isDark
      ? Colorr.primaryColor[300]
      : Colorr.primaryColor[400];

  showModalBottomSheet(
    context: context,
    showDragHandle: true,
    isScrollControlled: true,
    backgroundColor: isDark ? Colorr.darkSurface : Colors.white,
    builder: (context) => SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
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
                onTap: () {},
                child: Icon(Icons.filter_list_rounded, color: colorPrimary),
              ),

              SizedBox(width: 15.w),

              InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: Icon(Icons.close, color: colorPrimary),
              ),
            ],
          ),

          SizedBox(height: 10.h),

          Divider(
            color: isDark
                ? Colorr.darkBackground.withOpacity(0.4)
                : Colors.grey.shade200,
          ),

          SizedBox(height: 10.h),

          UserCommentField(),

          SizedBox(height: 5.h),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: comments.map((comment) {
                  return CommentWidget(comment: comment);
                }).toList(),
              ),
            ),
          ),
        ],
      ).padSymmetric(horizontal: 20.w),
    ),
  );
}
