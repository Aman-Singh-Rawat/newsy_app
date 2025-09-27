import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/theme/custom_text_style.dart';
import 'package:newsy/core/utils/assets.dart';
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
    onBoardList = [
      {
        "image": Assets.imgGandhiJi,
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
        "image": Assets.imgSharukhan,
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
        "image": Assets.imgRonaldo,
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (value) {
          setState(() => _selectedIndex = value);
        },
        itemCount: onBoardList.length,
        itemBuilder: (context, index) {
          onBoardList[index]["title"];
          return Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  filterQuality: FilterQuality.high,
                  onBoardList[index]["image"]!,
                  fit: BoxFit.cover,
                  colorBlendMode: BlendMode.color,
                ),
              ),
              Container(color: Colors.black.withOpacity(0.2)),
              Positioned(
                bottom: 20.h,
                left: 20.w,
                right: 20.w,
                child: Column(
                  children: [
                    onBoardList[index]["title"]!,
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(onBoardList.length, (index) {
                        return AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          height: 5.h,
                          width: 5.w,
                          margin: EdgeInsets.symmetric(horizontal: 5.w),
                          decoration: BoxDecoration(
                            color: _selectedIndex == index
                                ? Colorr.primaryColor[400]
                                : Colors.white,
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      child: Text(
                        "Skip",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: colorr[400]!,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => RoleScreen()),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomBtn(
                      color: colorr[400]!,
                      btnText: "Next",
                      onTap: () {
                        if (_selectedIndex == onBoardList.length - 1) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => RoleScreen()),
                          );
                        } else {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
