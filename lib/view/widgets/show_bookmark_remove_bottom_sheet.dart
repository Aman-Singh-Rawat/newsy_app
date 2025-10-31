import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/view/widgets/custom_btn.dart';
import 'package:newsy/view/widgets/my_outline_button.dart';
import 'package:newsy/view/widgets/news_widget.dart';

void showBookmarkRemoveBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    showDragHandle: true,
    backgroundColor: Colors.white,
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          NewsWidget(),
          SizedBox(height: 20.h),
          Text(
            "Remove from your bookmark?",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
            ),
          ),

          Row(
            children: [
              Expanded(
                child: MyOutlineButton(
                  onClick: () {
                    Navigator.pop(context);
                  },
                  btnText: "Cancel",
                ),
              ),
              SizedBox(width: 20.w),
              Expanded(
                child: CustomBtn(
                  color: Colorr.primaryColor[400]!,
                  btnText: "Yes, Remove",
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ).padSymmetric(vertical: 20.h),
        ],
      ).padSymmetric(horizontal: 20.w);
    },
  );
}
