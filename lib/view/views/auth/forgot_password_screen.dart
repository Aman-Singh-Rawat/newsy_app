import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newsy/core/navigation/app_navigation.dart';
import 'package:newsy/core/theme/custom_text_style.dart';
import 'package:newsy/core/utils/constants/image_strings.dart';
import 'package:newsy/core/utils/constants/text_strings.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/view/views/auth/otp_screen.dart';
import 'package:newsy/view/widgets/custom_app_bar.dart';
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
      "category": TextStrings.forgotPassItemTitle1,
      "description": "+91 9876543210",
      "icon": Icons.message,
    },
    {
      "index": 1,
      "category": TextStrings.forgotPassItemTitle2,
      "description": "am******at@gmail.com",
      "icon": Icons.email,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: TextStrings.forgotPassword, context: context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.h),
              SvgPicture.asset(
                ImageStrings.icForgotPassword,
                height: 190.h,
                width: 150.w,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 25.h),
              Text(
                TextStrings.forgotPassTitle,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge!.copyWith(fontSize: 13.sp),
              ),

              SizedBox(height: 20.h),

              ..._forgotTypeList.asMap().entries.map(
                (forgotItem) => NewsAgencyWidget(
                  isSelected: _selectedIndex == forgotItem.key,
                  onClick: (selectedIndex) =>
                      setState(() => _selectedIndex = selectedIndex),
                  dataList: forgotItem.value,
                ).marginOnly(bottom: 20.h),
              ),

              SizedBox(height: 40.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () =>
                      AppNavigator.push(context, const OtpScreen()),
                  child: Text(TextStrings.continueText),
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ).padSymmetric(horizontal: 20.w),
        ),
      ),
    );
  }
}
