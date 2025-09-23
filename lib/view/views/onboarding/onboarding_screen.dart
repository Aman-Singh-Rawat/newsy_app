import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/models/on_board.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<Map<String, String>> onBoardList = [
    {
      "image": "assets/images/img_gandhi_ji.png",
      "title":
          "Gandhi Ji showed us that courage is in truth, and power lies in peace",
    },
    {
      "image": "assets/images/img_sharukhan.png",
      "title": "Success is not a good teacher, failure makes you humble",
    },
    {
      "image": "assets/images/img_ronaldo.png",
      "title":
          "Dreams are not what you see in your sleep, dreams are things which do not let you sleep",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemBuilder: (context, index) {
          onBoardList[index]["title"];
          return Stack(
            children: [
              Positioned.fill(
                child: Image.asset(onBoardList[index]["image"]!, fit: BoxFit.cover),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding:  EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.black12, Colors.black26, Colors.black26],
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        onBoardList[index]["title"]!,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
