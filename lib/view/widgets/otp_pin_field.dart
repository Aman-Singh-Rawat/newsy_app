import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/utils/helpers/helper_function.dart';
import 'package:pinput/pinput.dart';

class MyOtpPinField extends StatelessWidget {
  const MyOtpPinField({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = HelperFunction.isDarkMode(context);

    final defaultPinTheme = PinTheme(
      width: 66.w,
      height: 55.h,
      margin: EdgeInsets.symmetric(horizontal: 3.w),
      textStyle: Theme.of(context).textTheme.headlineMedium,
      decoration: BoxDecoration(
        color: isDark ? Colorr.darkSurface : Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: isDark ? Colors.transparent : Colors.grey.shade200,
          width: 1.5.w,
        ),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      borderRadius: BorderRadius.circular(16.r),
      border: Border.all(
        color: Colorr.primaryColor[400]!,
        width: isDark ? 1.w : 1.5.w,
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: Colorr.primaryColor[300]!,
          width: isDark ? 1.w : 1.5.w,
        ),
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
