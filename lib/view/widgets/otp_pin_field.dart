import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:newsy/core/theme/app_colors.dart';
import 'package:pinput/pinput.dart';

class MyOtpPinField extends StatelessWidget {
  const MyOtpPinField({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 65.w,
      height: 50.h,
      margin: EdgeInsets.symmetric(horizontal: 2.w),
      textStyle: TextStyle(
        fontSize: 20.sp,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: Colors.grey.shade200, width: 1.5.w),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      borderRadius: BorderRadius.circular(14.r),
      border: Border.all(color: Colorr.primaryColor[400]!, width: 1.5.w),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: Colorr.primaryColor[400]!, width: 1.5.w),
      ),
    );

    return Pinput(
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      keyboardType: TextInputType.number,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      onCompleted: (pin) => print(pin),
    );
  }
}
