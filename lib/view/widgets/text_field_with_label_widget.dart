import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/theme/custom_text_style.dart';

class CustomTextFieldWithLabel extends StatefulWidget {
  final String label;
  final String hint;
  final bool isPassword;
  final bool isRequired;
  final IconData? suffixIcon;
  final TextInputAction textInputAction;
  final TextEditingController controller;

  const CustomTextFieldWithLabel({
    super.key,
    required this.label,
    required this.hint,
    this.suffixIcon,
    this.textInputAction = TextInputAction.next,
    this.isPassword = false,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const SizedBox(width: 10),
            Text(widget.label, style: CustomTextStyle.fieldLabelStyle),
            if (widget.isRequired)
              const Text(
                "*",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                ),
              ),
          ],
        ),
        const SizedBox(height: 5),
        TextFormField(
          textInputAction: widget.textInputAction,
          style: CustomTextStyle.fieldFormStyle,
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
                : Icon(widget.suffixIcon, color: Colors.grey),
          ),
        ),
        Visibility(
          visible: false,
          child: Container(
            margin: EdgeInsets.only(top: 10.h),
            decoration: BoxDecoration(
              color: Colorr.primaryColor[20]!,
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
