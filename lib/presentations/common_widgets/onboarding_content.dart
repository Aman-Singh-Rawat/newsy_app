import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/app/config/app_colors.dart';
import 'package:newsy/app/config/custom_text_style.dart';
import 'package:newsy/data/models/onboarding_model.dart';

class OnboardingContent extends StatelessWidget {
  final OnboardingModel model;

  const OnboardingContent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image
        Positioned.fill(child: Image.asset(model.image, fit: BoxFit.cover)),

        // Gradient overlay
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(gradient: Colorr.imageForegroundGradient),
          ),
        ),

        // Centered text
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 175.h, left: 20.w, right: 20.w),
            child: RichText(
              text: TextSpan(
                style: CustomTextStyle.onboardingTextStyle,
                text: model.whiteText,
                children: [
                  TextSpan(
                    text: model.coloredText,
                    style: CustomTextStyle.onboardingTextStyle.copyWith(
                      color: Colorr.primaryColor[400],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
