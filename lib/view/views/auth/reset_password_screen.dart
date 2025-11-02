import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/navigation/app_navigation.dart';

import 'package:newsy/core/utils/constants/image_strings.dart';
import 'package:newsy/core/utils/constants/text_strings.dart';
import 'package:newsy/core/utils/extension.dart';

import '../../../core/theme/app_colors.dart';
import '../../widgets/custom_btn.dart';
import '../../widgets/text_field_with_label_widget.dart';
import 'congratulation_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _emailController.addListener(() => setState(() {}));
    _passwordController.addListener(() => setState(() {}));
    super.initState();
  }

  get _isFieldEmpty =>
      _emailController.text.trim().isEmpty ||
      _passwordController.text.trim().isEmpty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      appBar: AppBar(title: Text(TextStrings.resetPassword)),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              ImageStrings.imgResetPassword,
              width: 300.w,
              height: 230.h,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(height: 30.h),

          Text(
            TextStrings.resetPasswordTitle,
            style: Theme.of(context).textTheme.headlineMedium,
          ),

          SizedBox(height: 22.h),

          /// new password field
          CustomTextFieldWithLabel(
            isFieldEmpty: _isFieldEmpty,
            label: TextStrings.newPassword,
            hint: TextStrings.newPassword,
            isPassword: true,
            controller: _emailController,
          ),

          SizedBox(height: 15.h),

          /// password field
          CustomTextFieldWithLabel(
            isFieldEmpty: _isFieldEmpty,
            label: TextStrings.confirmNewPass,
            hint: TextStrings.confirmNewPass,
            isPassword: true,
            controller: _passwordController,
            textInputAction: TextInputAction.done,
          ),

          Spacer(),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _isFieldEmpty
                  ? null
                  : () => AppNavigator.pushAndRemoveAll(
                      context,
                      const CongratulationScreen(),
                    ),
              child: Text(TextStrings.save),
            ),
          ),

          SizedBox(height: 20.h),
        ],
      ).padSymmetric(horizontal: 20.w),
    );
  }
}
