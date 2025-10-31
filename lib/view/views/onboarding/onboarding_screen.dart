import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/theme/custom_text_style.dart';
import 'package:newsy/core/utils/constants/image_strings.dart';
import 'package:newsy/core/utils/constants/text_strings.dart';
import 'package:newsy/view/views/onboarding/role_screen.dart';
import 'package:newsy/view/widgets/custom_btn.dart';

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

  @override
  void initState() {
    super.initState();
    onBoardList = [
      {
        "image": ImageStrings.imgGandhiJi,
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
        "image": ImageStrings.imgSharukhan,
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
        "image": ImageStrings.imgRonaldo,
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
            bottom: 35.h,
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
                SizedBox(height: 25.h),

                // Skip button
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const RoleScreen()),
                    );
                  },
                  child: Text(
                    TextStrings.skip,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colorr.primaryColor[300],
                    ),
                  ),
                ),
                SizedBox(height: 20.h),

                // Next button
                CustomBtn(
                  color: Colorr.primaryColor[400]!,
                  btnText: _selectedIndex == onBoardList.length - 1
                      ? TextStrings.getStarted
                      : TextStrings.next,
                  onTap: () {
                    if (_selectedIndex == onBoardList.length - 1) {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const RoleScreen()),
                      );
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Widget for image + text content
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
                  Colorr.dark.withOpacity(0.002),
                  Colorr.dark.withOpacity(0.2),
                  Colorr.dark,
                ],
              ),
            ),
          ),
        ),

        // Centered text
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 180.h, left: 20.w, right: 20.w),
            child: titleWidget,
          ),
        ),
      ],
    );
  }
}
