import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/utils/helpers/helper_function.dart';

import '../../core/theme/app_colors.dart';

class SelectYourWidget extends StatefulWidget {
  final Map<String, String> country;
  final Function(String) onTap;
  final bool isSelected;

  const SelectYourWidget({
    super.key,
    required this.country,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<SelectYourWidget> createState() => _SelectYourWidgetState();
}

class _SelectYourWidgetState extends State<SelectYourWidget> {
  get getSelectedItemColor {
    if (widget.isSelected) {
      return Colorr.primaryColor[400];
    } else {
      return Colorr.primaryColor[300];
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = HelperFunction.isDarkMode(context);

    return GestureDetector(
      onTap: () => widget.onTap(widget.country["code"] as String),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: isDark ? Colorr.darkSurface : Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: widget.isSelected
                ? Colorr.primaryColor[400]!
                : isDark
                ? Colorr.darkSurface
                : Colors.grey.shade200,
            width: widget.isSelected ? 2.w : 1.4.w,
          ),
        ),
        child: Row(
          children: [
            Text(
              widget.country["flag"] as String,
              style: TextStyle(fontSize: 25.sp),
            ),

            SizedBox(width: 15.w),

            Text(
              widget.country["code"] as String,
              style: TextStyle(
                fontSize: 11.sp,
                color: Colors.grey,
                fontWeight: FontWeight.w400,
              ),
            ),

            SizedBox(width: 15.w),

            Text(
              widget.country["name"] as String,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const Spacer(),

            Icon(
              size: 18.w,
              widget.isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_off,
              color: getSelectedItemColor,
            ),
          ],
        ),
      ),
    );
  }
}
