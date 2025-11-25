import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/app/navigation/app_navigation.dart';
import 'package:newsy/app/config/custom_text_style.dart';
import 'package:newsy/app/constants/text_strings.dart';
import 'package:newsy/core/utils/extensions.dart';
import 'package:newsy/core/utils/helper_function.dart';
import 'package:newsy/presentations/features/auth/reset_password_screen.dart';
import 'package:newsy/presentations/common_widgets/appbar/appbar.dart';
import 'package:newsy/presentations/common_widgets/otp_pin_field.dart';

import '../../../app/config/app_colors.dart';

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
    final bool isDark = HelperFunction.isDarkMode(context);

    _isCounterMinus = _counter == -1;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(title: TextStrings.forgotPassword),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,

        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Text(
              "${TextStrings.otpTitle} +91 7618447467",
              style: Theme.of(
                context,
              ).textTheme.bodyLarge!.copyWith(fontSize: 13.sp),
            ),

            SizedBox(height: 60.h),
            MyOtpPinField(),
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _isCounterMinus
                      ? TextStrings.didNotRecieveCode
                      : TextStrings.otpResendCode,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge!.copyWith(fontSize: 13.sp),
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
                    _isCounterMinus ? TextStrings.resend : " s",
                    style: Theme.of(context).textTheme.bodyLarge!
                        .copyWith(fontSize: 13.sp)
                        .copyWith(
                          color: _counter == -1
                              ? Colorr.primaryColor[400]
                              : isDark
                              ? Colors.white
                              : Colors.black,
                        ),
                  ),
                ),
              ],
            ),

            Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => AppNavigator.pushAndRemoveAll(
                  context,
                  const ResetPasswordScreen(),
                ),
                child: Text(TextStrings.verify),
              ),
            ),

            SizedBox(height: 20.h),
          ],
        ).padSymmetric(horizontal: 20.w),
      ),
    );
  }
}
