import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/theme/custom_text_style.dart';
import 'package:newsy/core/utils/assets.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/view/widgets/show_comment_dialog.dart';
import 'package:newsy/view/widgets/user_comment_field.dart';

class BeautifulCommentWidget extends StatelessWidget {
  const BeautifulCommentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: Colors.grey.shade200, width: 1.w),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text("Comments", style: CustomTextStyle.commentBsTextStyle),

              SizedBox(width: 10.w),

              Text("170.5k", style: CustomTextStyle.commentNumberTextStyle),

              Spacer(),
              InkWell(
                onTap: () => showCommentDialog(context),
                child: SvgPicture.asset(
                  Assets.icTopBottomArrow,
                  width: 24,
                  height: 24,
                ),
              ),
            ],
          ),

          Divider(color: Colors.grey.shade200).padSymmetric(vertical: 17.h),

          UserCommentField()
        ],
      ),
    );
  }
}
