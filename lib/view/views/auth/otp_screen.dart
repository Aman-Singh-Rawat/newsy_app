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
  bool _isCounterMinus = false;
  int _counter = 10;
  late Timer _timer;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _counter = 10; // Or any starting value
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_counter > -1) setState(() => _counter--);
    });
  }

  @override
  Widget build(BuildContext context) {
    _isCounterMinus = _counter == -1;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_rounded),
        ),
        title: Text("Forgot Password"),
      ),
      body: GestureDetector(
                behavior: HitTestBehavior.opaque,

         onTap: () => FocusScope.of(context).requestFocus( FocusNode()),
        child: Column(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _isCounterMinus ? "Didn't Receive otp? " : "Resend code in ",
                  style: CustomTextStyle.screenDescTextStyle,
                ),
                if (!_isCounterMinus)
                  Text(
                    _counter.toString(),
                    style: CustomTextStyle.screenDescTextStyle.copyWith(
                      color: Colorr.primaryColor[400],
                    ),
                  ),
                InkWell(
                  onTap: _isCounterMinus
                      ? () => setState(() => _counter = 10)
                      : null,
                  child: Text(
                    _isCounterMinus ? "Resend" : " s",
                    style: CustomTextStyle.screenDescTextStyle.copyWith(
                      color: _counter == -1
                          ? Colorr.primaryColor[400]
                          : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
        
            Spacer(),
            CustomBtn(
              color: Colorr.primaryColor[400]!,
              btnText: "Verify",
              onTap: () => Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => ResetPasswordScreen()),
                (Route<dynamic> route) => false,
              ),
            ),
        
            SizedBox(height: 20.h),
          ],
        ).padSymmetric(horizontal: 20.w),
      ),
    );
  }
}
