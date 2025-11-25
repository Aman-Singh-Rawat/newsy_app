import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/app/config/app_colors.dart';
import 'package:newsy/app/constants/text_strings.dart';
import 'package:newsy/core/utils/helper_function.dart';

class SearchViewWidget extends StatelessWidget {
  final bool isFieldEmpty;
  final VoidCallback onButtonClick;
  final TextEditingController controller;

  const SearchViewWidget({
    super.key,
    this.isFieldEmpty = true,
    required this.controller,
    required this.onButtonClick,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = HelperFunction.isDarkMode(context);

    return TextFormField(
      controller: controller,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 13.sp),
      decoration: InputDecoration(
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 20.w),
        fillColor: isDark ? Colorr.darkSurface : Colorr.lightGrey,
        hintText: TextStrings.search,
        hintStyle: Theme.of(context).textTheme.bodyMedium,
        suffixIcon: IconButton(
          onPressed: onButtonClick,
          icon: Icon(
            isFieldEmpty ? Icons.search : Icons.clear,
            color: Colorr.darkerGrey,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(25.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(25.r),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
