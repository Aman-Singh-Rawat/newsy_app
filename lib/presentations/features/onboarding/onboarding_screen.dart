import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/app/navigation/app_navigation.dart';
import 'package:newsy/app/config/app_colors.dart';
import 'package:newsy/app/config/custom_text_style.dart';
import 'package:newsy/app/constants/image_strings.dart';
import 'package:newsy/app/constants/text_strings.dart';
import 'package:newsy/presentations/features/onboarding/role_screen.dart';
import 'package:newsy/presentations/common_widgets/onboarding_content.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final colorr = Colorr.primaryColor;
  late List<Map<String, dynamic>> onBoardList;
  late PageController _pageController;
  int _selectedIndex = 0;

  void _handleNextButton(BuildContext context) {
    if (_selectedIndex == onBoardList.length - 1) {
      AppNavigator.push(context, const RoleScreen());
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    onBoardList = [
      {
        "image": ImageStrings.imgOnboardingOne,
        "title": RichText(
          text: TextSpan(
            style: CustomTextStyle.onboardingTextStyle,
            text: "Get the latest news from ",
            children: [
              TextSpan(
                text: "reliable sources",
                style: CustomTextStyle.onboardingTextStyle.copyWith(
                  color: colorr[400],
                ),
              ),
            ],
          ),
        ),
      },
      {
        "image": ImageStrings.imgOnboardingTwo,
        "title": RichText(
          text: TextSpan(
            style: CustomTextStyle.onboardingTextStyle,
            text: "Get actual news from ",
            children: [
              TextSpan(
                text: "around the world",
                style: CustomTextStyle.onboardingTextStyle.copyWith(
                  color: colorr[400],
                ),
              ),
            ],
          ),
        ),
      },
      {
        "image": ImageStrings.imgOnboardingThree,
        "title": RichText(
          text: TextSpan(
            style: CustomTextStyle.onboardingTextStyle,
            text: "Sport, politics, healthy, ",
            children: [
              TextSpan(
                text: "& anything",
                style: CustomTextStyle.onboardingTextStyle.copyWith(
                  color: colorr[400],
                ),
              ),
            ],
          ),
        ),
      },
    ];
    _pageController = PageController(viewportFraction: 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // PageView — only the image & title change
          PageView.builder(
            controller: _pageController,
            onPageChanged: (value) {
              setState(() => _selectedIndex = value);
            },
            itemCount: onBoardList.length,
            itemBuilder: (context, index) {
              final item = onBoardList[index];
              return OnboardingContent(
                image: item["image"],
                titleWidget: item["title"],
              );
            },
          ),

          // Fixed Bottom Controls
          Positioned(
            bottom: 20.h,
            left: 20.w,
            right: 20.w,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Page Indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(onBoardList.length, (index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 6.h,
                      width: 6.w,
                      margin: EdgeInsets.symmetric(horizontal: 6.w),
                      decoration: BoxDecoration(
                        color: _selectedIndex == index
                            ? Colorr.primaryColor[400]
                            : Colors.white,
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                    );
                  }),
                ),
                SizedBox(height: 20.h),

                // Skip button
                TextButton(
                  onPressed: () => AppNavigator.push(context, const RoleScreen()) ,
                  child: Text(TextStrings.skip),
                ),
                SizedBox(height: 15.h),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => _handleNextButton(context),
                    child: Text(
                      _selectedIndex == onBoardList.length - 1
                          ? TextStrings.getStarted
                          : TextStrings.next,
                    ),
                  ),
                ),

                // Next button
              ],
            ),
          ),
        ],
      ),
    );
  }

  
}
