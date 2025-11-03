import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/theme/custom_text_style.dart';
import 'package:newsy/core/utils/constants.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/view/widgets/comment_widget.dart';
import 'package:newsy/view/widgets/user_comment_field.dart';

void showCommentDialog(BuildContext context) {
  showModalBottomSheet(
    context: context,
    showDragHandle: true,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    builder: (context) => SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        children: [
          Row(
            children: [
              Text("Comments", style: CustomTextStyle.commentBsTextStyle),

              SizedBox(width: 10.w),

              Text("170.5k", style: CustomTextStyle.commentNumberTextStyle),

              Spacer(),
              InkWell(
                onTap: () {},
                child: Icon(
                  Icons.filter_list_rounded,
                  color: Colorr.primaryColor[400],
                ),
              ),

              SizedBox(width: 15.w),

              InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: Icon(Icons.close, color: Colorr.primaryColor[400]),
              ),
            ],
          ),

          Divider().padSymmetric(vertical: 20.h),

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
