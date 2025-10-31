import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/view/views/profile/settings_screen.dart';
import 'package:newsy/view/views/profile/user-profile/followers_and_following_screen.dart';
import 'package:newsy/view/widgets/btn_with_bg.dart';
import 'package:newsy/view/widgets/custom_app_bar.dart';
import 'package:newsy/view/widgets/custom_btn.dart';
import 'package:newsy/view/widgets/my_outline_button.dart';
import 'package:newsy/view/widgets/news_widget.dart';
import 'package:newsy/view/widgets/profile_placeholder.dart';
import 'package:newsy/view/widgets/social_stats_widget.dart';

class NewsAgencyDetailScreen extends StatefulWidget {
  const NewsAgencyDetailScreen({super.key});

  @override
  State<NewsAgencyDetailScreen> createState() => _NewsAgencyDetailScreenState();
}

class _NewsAgencyDetailScreenState extends State<NewsAgencyDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        title: "",
        context: context,
        actions: [
          BtnWithBg(icon: Icons.share).padOnly(right: 20.w),

          BtnWithBg(
            icon: Icons.more_vert,
            onTap: () => Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => SettingsScreen())),
          ),
        ],
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 15.h),

              // perons image
              CircleAvatar(
                radius: 55.r,
                backgroundImage: NetworkImage(
                  "https://plus.unsplash.com/premium_photo-1690406382707-16d9cc7a83d5?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDR8fHxlbnwwfHx8fHw%3D",
                ),
              ),

              SizedBox(height: 15.h),

              // name
              Text(
                "Adam Smith",
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),

              SizedBox(height: 15.h),

              // profile desc
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(height: 25.h),

              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SocialStatsWidget(category: "News", value: "156"),

                    VerticalDivider(),

                    GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => FollowersAndFollowingScreen(),
                        ),
                      ),
                      child: SocialStatsWidget(
                        category: "Followers",
                        value: "2.279",
                      ),
                    ),

                    VerticalDivider(),

                    GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              FollowersAndFollowingScreen(title: "Following"),
                        ),
                      ),
                      child: SocialStatsWidget(
                        category: "Following",
                        value: "178",
                      ),
                    ),
                  ],
                ),
              ),

              Divider().padSymmetric(vertical: 18.h),

              Row(
                children: [
                  Expanded(
                    child: CustomBtn(
                      color: Colorr.primaryColor[400]!,
                      btnText: "Follow",
                      onTap: () {},
                      isPrefixIcon: true,
                      icon: Icons.person_add,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: MyOutlineButton(
                      onClick: () {},
                      btnText: "Website",
                      icon: Icons.language,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.h),

              // tab layout
              SizedBox(
                height: 40.h,
                child: TabBar(
                  indicatorWeight: 3.5.h,
                  tabs: [Text("Top News"), Text("Recent")],
                  controller: tabController,
                ),
              ),

              SizedBox(height: 15.h),

              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    ListView.builder(
                      itemBuilder: (context, index) => NewsWidget(),
                      itemCount: 5,
                    ),

                    ListView.builder(
                      itemBuilder: (context, index) => NewsWidget(),
                      itemCount: 5,
                    ),
                  ],
                ),
              ),
            ],
          ).marginSymmetric(horizontal: 20.w),
        ),
      ),
    );
  }
}
