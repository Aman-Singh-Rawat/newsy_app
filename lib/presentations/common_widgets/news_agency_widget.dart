import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/app/config/app_colors.dart';
import 'package:newsy/core/utils/helper_function.dart';

class NewsAgencyWidget extends StatelessWidget {
  final bool isSelected;
  final Function(int) onClick;
  final bool isForgotPassword;
  final Map<String, dynamic> dataList;

  const NewsAgencyWidget({
    super.key,
    required this.isSelected,
    required this.onClick,
    required this.dataList,
    this.isForgotPassword = true,
  });

  TextStyle getHeadingStyle(BuildContext context) {
    if (isForgotPassword) {
      return Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 11.sp);
    } else {
      return Theme.of(
        context,
      ).textTheme.headlineMedium!.copyWith(fontSize: 14.sp);
    }
  }

  TextStyle getSubHeadingStyle(BuildContext context) {
    if (isForgotPassword) {
      return Theme.of(
        context,
      ).textTheme.headlineMedium!.copyWith(fontSize: 14.sp);
    } else {
      return Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 11.sp);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunction.isDarkMode(context);

    return GestureDetector(
      onTap: () {
        onClick(dataList["index"]);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        decoration: BoxDecoration(
          color: isDark ? Colorr.darkSurface : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 2.w,
            color: isSelected
                ? (Colorr.primaryColor[300]!)
                : isDark
                ? Colorr.darkSurface
                : Colors.grey.shade100,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 40,
                backgroundColor: isDark
                    ? Colorr.iconBg
                    : Colorr.primaryColor[20],
                child: Icon(
                  dataList["icon"],
                  size: 30.w,
                  color: isDark
                      ? Colorr.primaryColor[400]
                      : Colorr.primaryColor[400]!.withOpacity(0.8),
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(dataList["category"], style: getHeadingStyle(context)),

                  const SizedBox(height: 10),
                  Text(
                    dataList["description"],
                    style: getSubHeadingStyle(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
