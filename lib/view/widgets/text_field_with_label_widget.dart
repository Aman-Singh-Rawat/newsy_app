import 'package:flutter/material.dart';

import 'package:newsy/core/utils/helpers/helper_function.dart';
import 'package:newsy/view/widgets/text_field_error_widget.dart';
import 'package:newsy/view/widgets/textfield/custom_text_field.dart';
import 'package:newsy/view/widgets/texts/text_field_title.dart';

class CustomTextFieldWithLabel extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final isDark = HelperFunction.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Text field title
        TextFieldTitle(label: label, isRequired: isRequired),
        const SizedBox(height: 5),

        /// Custom text field
        CustomTextField(
          isFieldEmpty: isFieldEmpty,
          textInputAction: textInputAction,
          isFieldTypePassword: isPassword,
          hintText: hint,
          controller: controller,
          suffixIcon: suffixIcon,
        ),

        /// text field error
        TextFieldErrorWidget(isDark: isDark),
      ],
    );
  }
}
