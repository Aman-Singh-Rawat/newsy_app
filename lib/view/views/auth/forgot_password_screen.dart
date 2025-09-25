import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newsy/core/theme/custom_text_style.dart';
import 'package:newsy/core/utils/assets.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/view/views/auth/otp_screen.dart';
import 'package:newsy/view/widgets/custom_btn.dart';
import 'package:newsy/view/widgets/news_agency_widget.dart';

import '../../../core/theme/app_colors.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  int _selectedIndex = 0;
  final List<Map<String, dynamic>> _forgotTypeList = [
    {
      "index": 0,
      "category": "via SMS:",
      "description": "+91 9876543210",
      "icon": Icons.message,
    },
    {
      "index": 1,
      "category": "via Email: ",
      "description": "am******at@gmail.com",
      "icon": Icons.email,
    },
  ];

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.h),
            SvgPicture.asset(
              Assets.icForgotPassword,
              height: 190.h,
              width: 150.w,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 15.h),
            Text(
              "Select which contact details should we use to reset your password",
              style: CustomTextStyle.screenDescTextStyle,
            ),

            SizedBox(height: 15.h),

            ..._forgotTypeList.asMap().entries.map(
              (forgotItem) => NewsAgencyWidget(
                isSelected: _selectedIndex == forgotItem.key,
                onClick: (selectedIndex) =>
                    setState(() => _selectedIndex = selectedIndex),
                dataList: forgotItem.value,
              ).marginOnly(bottom: 20.h),
            ),

            SizedBox(height: 25.h),
            CustomBtn(
              color: Colorr.primaryColor[400]!,
              btnText: "Continue",
              onTap: () => Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => OtpScreen())),
            ),
          ],
        ).padSymmetric(horizontal: 20.w),
      ),
    );
  }
}
