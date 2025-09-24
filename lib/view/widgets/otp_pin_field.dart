import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/view/views/auth/auth_screen.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

class MyOtpPinField extends StatelessWidget {
  const MyOtpPinField({super.key});

  @override
  Widget build(BuildContext context) {
    ///  Otp pin Controller
    final _otpPinFieldController = GlobalKey<OtpPinFieldState>();

    return OtpPinField(

      key: _otpPinFieldController,

      ///in case you want to enable autoFill
      autoFillEnable: false,

      ///for Ios it is not needed as the SMS autofill is provided by default, but not for Android, that's where this key is useful.
      textInputAction: TextInputAction.done,
      fieldHeight: 48.h,
      fieldWidth: 65.w,
      ///in case you want to change the action of keyboard
      /// to clear the Otp pin Controller
      onSubmit: (text) {
        print('Entered pin is $text');

        /// return the entered pin
      },
      onChange: (text) {
        print('Enter on change pin is $text');

        /// return the entered pin
      },
      onCodeChanged: (code) {
        print('onCodeChanged  is $code');
      },

      /// to decorate your Otp_Pin_Field
      otpPinFieldStyle: OtpPinFieldStyle(
        fieldBorderRadius: 16.r,
        textStyle: GoogleFonts.poppins(
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),

        defaultFieldBorderColor: Colors.grey.shade200,
        activeFieldBorderColor: Colorr.primaryColor[400]!,
        filledFieldBorderColor: Colorr.primaryColor[400]!,
      ),
      maxLength: 4,

      /// no of pin field
      showCursor: true,
      cursorColor: Colorr.primaryColor[400]!,
      cursorWidth: 3.w,
      mainAxisAlignment: MainAxisAlignment.center,

      otpPinFieldDecoration: OtpPinFieldDecoration.custom,
    );
  }
}
