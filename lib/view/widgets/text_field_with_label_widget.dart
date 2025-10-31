import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/theme/custom_text_style.dart';
import 'package:newsy/core/utils/helpers/helper_function.dart';

class CustomTextFieldWithLabel extends StatefulWidget {
  final String label;
  final String hint;
  final bool isPassword;
  final bool isRequired;
  final IconData? suffixIcon;
  final bool isFieldEmpty;
  final TextInputAction textInputAction;
  final TextEditingController controller;

  const CustomTextFieldWithLabel({
    super.key,
    required this.label,
    required this.hint,
    this.suffixIcon,
    this.textInputAction = TextInputAction.next,
    this.isPassword = false,
    this.isFieldEmpty = true,
    required this.controller,
    this.isRequired = true,
  });

  @override
  State<CustomTextFieldWithLabel> createState() =>
      _CustomTextFieldWithLabelState();
}

class _CustomTextFieldWithLabelState extends State<CustomTextFieldWithLabel> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunction.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 10),
            Text(
              widget.label,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),
            ),
            if (widget.isRequired)
              Text(
                "*",
                style: TextStyle(
                  color: isDark ? Colors.redAccent.shade100 : Colors.red,
                  fontSize: 8.sp,
                  height: 1.2.h,
                  fontWeight: FontWeight.w900,
                ),
              ),
          ],
        ),
        const SizedBox(height: 5),
        Material(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.r),
            side: widget.isFieldEmpty
                ? BorderSide.none
                : BorderSide(color: Colorr.primary, width: 2.r),
          ),
          child: TextFormField(
            textInputAction: widget.textInputAction,
            style: Theme.of(
              context,
            ).textTheme.labelLarge!.copyWith(fontSize: 13.sp),
            controller: widget.controller,
            obscureText: widget.isPassword ? isVisible : false,
            decoration: InputDecoration(
              hintText: widget.hint,
              suffixIcon: widget.isPassword
                  ? GestureDetector(
                      onTap: () {
                        setState(() => isVisible = !isVisible);
                      },
                      child: Icon(
                        isVisible ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                        size: 20.r,
                      ),
                    )
                  : Icon(
                      widget.suffixIcon,
                      color: isDark ? Colorr.darkerTextColor : Colors.grey,
                    ),
            ),
          ),
        ),
        Visibility(
          visible: false,
          child: Container(
            margin: EdgeInsets.only(top: 6.h),
            decoration: BoxDecoration(
              color: isDark ? Colorr.iconBg : Colorr.primaryColor[20]!,
              borderRadius: BorderRadius.circular(20.r),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
            child: Row(
              children: [
                Icon(Icons.error, color: Colorr.primaryColor[700]!),
                const SizedBox(width: 5),
                Text(
                  "Invalid email",
                  style: TextStyle(
                    color: Colorr.primaryColor[700]!,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
