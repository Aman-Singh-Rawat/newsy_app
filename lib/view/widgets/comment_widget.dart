import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/theme/custom_text_style.dart';
import 'package:newsy/core/utils/constants/image_strings.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/models/comment_model.dart';
import 'package:newsy/view/widgets/my_text_button.dart';

class CommentWidget extends StatelessWidget {
  final CommentModel comment;
  const CommentWidget({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      margin: EdgeInsets.only(top: 20.h),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(14.r),
      ),

      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.all(0),
            leading: CircleAvatar(
              radius: 18.r,
              backgroundImage: NetworkImage(comment.userImage),
            ),
            title: Text(
              comment.userName,
              style: CustomTextStyle.userNameTextStyle,
            ),
            subtitle: Text(
              comment.timeAgo,
              style: CustomTextStyle.userNameSubTextStyle,
            ),
            trailing: InkWell(
              onTap: () {},
              child: Icon(Icons.more_vert, color: Colorr.primaryColor[400]),
            ),
          ),

          Divider(),

          // comment text
          Text(comment.comment, style: CustomTextStyle.userCommentTextStyle),

          Row(
            children: [
              ActionButton(
                icon: Icons.thumb_up,
                text: comment.likes.toString(),
              ),
              SizedBox(width: 10.w),

              ActionButton(
                icon: Icons.thumb_down,
                text: comment.dislikes.toString(),
              ),
              SizedBox(width: 10.w),
              ActionButton(
                icon: Icons.message,
                text: comment.comments.toString(),
              ),
            ],
          ).padSymmetric(vertical: 4.h),

          Divider(),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${comment.replies} Reply",
                style: TextStyle(
                  color: Colorr.primaryColor[400],
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),

              Image.asset(ImageStrings.imgReplies),
            ],
          ).padSymmetric(vertical: 6.h),
        ],
      ),
    );
  }
}
