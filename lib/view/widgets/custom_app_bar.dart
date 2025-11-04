import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/theme/app_colors.dart';

AppBar getAppBar({
  required String title,
  required BuildContext context,
  List<Widget>? actions,
  Widget? bottomWidget,
  double prefSize = 110,
  final bool showLeading = true
}) {
  return AppBar(
    leading: showLeading ? IconButton(
      onPressed: () => Navigator.pop(context),
      icon: Icon(Icons.arrow_back_rounded, color: Colorr.primary),
    ) : null
    ,
    actionsPadding: EdgeInsets.only(right: 20.w),
    title: Text(title),
    actions: actions,
    bottom: bottomWidget != null
        ? PreferredSize(
            preferredSize: Size(double.infinity, prefSize.h),
            child: bottomWidget,
          )
        : null,
  );
}
