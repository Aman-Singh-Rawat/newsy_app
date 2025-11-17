import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/navigation/app_navigation.dart';

import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/utils/constants/text_strings.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/core/utils/helpers/helper_function.dart';
import 'package:newsy/view/widgets/my_outline_button.dart';
import 'package:newsy/view/widgets/news_widget.dart';

void showBookmarkRemoveBottomSheet(BuildContext context) {
  final bool isDark = HelperFunction.isDarkMode(context);

  showModalBottomSheet(
    context: context,
    showDragHandle: true,
    backgroundColor: isDark ? Colorr.darkSurface : Colorr.light,
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          NewsWidget(nightColor: Colorr.darkBackground),
          SizedBox(height: 20.h),
          Text(
            TextStrings.removeFromYourBookmark,
            style: Theme.of(
              context,
            ).textTheme.headlineMedium!.copyWith(fontSize: 15.sp),
          ),

          Row(
            children: [
              Expanded(
                child: MyOutlineButton(
                  onClick: () {
                    Navigator.pop(context);
                  },
                  btnText: TextStrings.cancel,
                ),
              ),
              SizedBox(width: 20.w),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => AppNavigator.pop(context),
                  child: Text(TextStrings.yesRemove),
                ),
              ),
            ],
          ).padSymmetric(vertical: 20.h),
        ],
      ).padSymmetric(horizontal: 20.w);
    },
  );
}
