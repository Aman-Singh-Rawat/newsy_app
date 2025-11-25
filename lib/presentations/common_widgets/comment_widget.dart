import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:newsy/app/config/app_colors.dart';
import 'package:newsy/app/constants/image_strings.dart';
import 'package:newsy/app/constants/text_strings.dart';
import 'package:newsy/core/utils/extensions.dart';
import 'package:newsy/core/utils/helper_function.dart';
import 'package:newsy/data/models/comment_model.dart';
import 'package:newsy/presentations/common_widgets/my_text_button.dart';

class CommentWidget extends StatelessWidget {
  final CommentModel comment;
  const CommentWidget({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    final bool isDark = HelperFunction.isDarkMode(context);
    final currentPrimaryColor = isDark
        ? Colorr.primaryColor[300]
        : Colorr.primaryColor[400];
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.h),
      margin: EdgeInsets.only(top: 20.h),
      decoration: BoxDecoration(
        color: isDark ? Colorr.darkBackground : Colors.transparent,
        border: Border.all(
          color: isDark ? Colorr.darkBackground : Colors.grey.shade200,
        ),
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
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(fontSize: 12.sp),
            ),
            subtitle: Text(
              comment.timeAgo,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(
                context,
              ).textTheme.labelSmall!.copyWith(fontSize: 9.sp),
            ),
            trailing: InkWell(
              onTap: () {},
              child: Icon(Icons.more_vert, color: currentPrimaryColor),
            ),
            visualDensity: VisualDensity(horizontal: 0, vertical: -3),
          ),

          Divider(),

          SizedBox(height: 5.h),

          // comment text
          Text(
            comment.comment,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.w400,
              height: 1.5.h,
            ),
          ),

          SizedBox(height: 5.h),

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
                "${comment.replies} ${TextStrings.reply}",
                style: TextStyle(
                  color: Colorr.primaryColor[400],
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),

              Image.asset(ImageStrings.imgReplies, width: 15.w, height: 15.h),
            ],
          ).padSymmetric(vertical: 6.h),
        ],
      ),
    );
  }
}
