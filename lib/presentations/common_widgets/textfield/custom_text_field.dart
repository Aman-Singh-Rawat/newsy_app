import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:newsy/app/config/app_colors.dart';
import 'package:newsy/core/utils/helper_function.dart';

class CustomTextField extends StatefulWidget {
  final bool isFieldEmpty;
  final TextInputAction textInputAction;
  final TextEditingController? controller;
  final bool isFieldTypePassword;
  final String hintText;
  final Function(String)? onFieldSubmitted;
  final IconData? suffixIcon;

  const CustomTextField({
    super.key,
    required this.isFieldEmpty,
    required this.textInputAction,
    this.controller,
    this.isFieldTypePassword = false,
    required this.hintText,
    this.suffixIcon,
    this.onFieldSubmitted,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    final bool isDark = HelperFunction.isDarkMode(context);
    return Material(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.r),
        side: widget.isFieldEmpty
            ? BorderSide.none
            : BorderSide(color: Colorr.primary, width: 2.r),
      ),
      child: TextFormField(
        onFieldSubmitted: widget.onFieldSubmitted,
        textInputAction: widget.textInputAction,
        style: Theme.of(
          context,
        ).textTheme.labelLarge!.copyWith(fontSize: 13.sp),
        controller: widget.controller,
        obscureText: widget.isFieldTypePassword ? isVisible : false,
        decoration: InputDecoration(
          hintText: widget.hintText,
          suffixIcon: widget.isFieldTypePassword
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
                  color: isDark ? Colorr.darkerGrey : Colors.grey,
                ),
        ),
      ),
    );
  }
}
