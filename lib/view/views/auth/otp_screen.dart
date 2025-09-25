import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/theme/custom_text_style.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/view/views/auth/reset_password_screen.dart';
import 'package:newsy/view/widgets/custom_btn.dart';
import 'package:newsy/view/widgets/otp_pin_field.dart';

import '../../../core/theme/app_colors.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  int _counter = 59;
  late Timer _timer;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _counter = 59; // Or any starting value
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() => _counter--);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_rounded),
        ),
        title: Text("Forgot Password"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          Text(
            "Code has been sent to +91 761844**67",
            style: CustomTextStyle.screenDescTextStyle,
          ),

          SizedBox(height: 30.h),
          MyOtpPinField(),
          SizedBox(height: 30.h),
          RichText(
            text: TextSpan(
              text: "Resend code in ",
              style: CustomTextStyle.screenDescTextStyle,
              children: [
                TextSpan(
                  text: "$_counter",
                  style: CustomTextStyle.screenDescTextStyle.copyWith(
                    color: Colorr.primaryColor[400],
                  ),
                ),
                TextSpan(
                  text: " s",
                  style: CustomTextStyle.screenDescTextStyle,
                ),
              ],
            ),
          ),
          Spacer(),
          CustomBtn(
            color: Colorr.primaryColor[400]!,
            btnText: "Verify",
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ResetPasswordScreen()),
            ),
          ),

          SizedBox(height: 20.h),
        ],
      ).padSymmetric(horizontal: 20.w),
    );
  }
}
