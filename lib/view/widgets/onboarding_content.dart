
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingContent extends StatelessWidget {
  final String image;
  final RichText titleWidget;

  const OnboardingContent({
    super.key,
    required this.image,
    required this.titleWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image
        Positioned.fill(child: Image.asset(image, fit: BoxFit.cover)),

        // Gradient overlay
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.transparent,
                  Colors.black12,
                  Colors.black87,
                  Colors.black,
                ],
              ),
            ),
          ),
        ),

        // Centered text
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 175.h, left: 20.w, right: 20.w),
            child: titleWidget,
          ),
        ),
      ],
    );
  }
}
