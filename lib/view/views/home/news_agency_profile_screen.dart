import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/navigation/app_navigation.dart';

import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/utils/constants/text_strings.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/view/views/profile/settings_screen.dart';
import 'package:newsy/view/views/profile/user-profile/followers_and_following_screen.dart';
import 'package:newsy/view/widgets/appbar/appbar.dart';
import 'package:newsy/view/widgets/btn_with_bg.dart';
import 'package:newsy/view/widgets/custom_btn.dart';
import 'package:newsy/view/widgets/my_outline_button.dart';
import 'package:newsy/view/widgets/news_widget.dart';
import 'package:newsy/view/widgets/social_stats_widget.dart';

class NewsAgencyProfileScreen extends StatefulWidget {
  const NewsAgencyProfileScreen({super.key});

  @override
  State<NewsAgencyProfileScreen> createState() =>
      _NewsAgencyProfileScreenState();
}

class _NewsAgencyProfileScreenState extends State<NewsAgencyProfileScreen>
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
      appBar: CustomAppBar(
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
      body: SizedBox(
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
              style: Theme.of(
                context,
              ).textTheme.headlineMedium!.copyWith(fontSize: 17.sp),
            ),

            SizedBox(height: 15.h),

            // profile desc
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelMedium,
            ),

            SizedBox(height: 25.h),

            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SocialStatsWidget(category: TextStrings.news, value: "156"),

                  VerticalDivider(),

                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => FollowersAndFollowingScreen(),
                      ),
                    ),
                    child: SocialStatsWidget(
                      category: TextStrings.followers,
                      value: "2.279",
                    ),
                  ),

                  VerticalDivider(),

                  GestureDetector(
                    onTap: () => AppNavigator.push(
                      context,
                      const FollowersAndFollowingScreen(
                        title: TextStrings.following,
                      ),
                    ),
                    child: SocialStatsWidget(
                      category: TextStrings.following,
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
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colorr.primary,
                    ),
                    onPressed: () {},
                    label: Text(TextStrings.follow),
                    icon: Icon(Icons.person_add),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: MyOutlineButton(
                    onClick: () {},
                    btnText: TextStrings.website,
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
                tabs: [Text(TextStrings.topNews), Text(TextStrings.recent)],
                controller: tabController,
              ),
            ),

            SizedBox(height: 15.h),

            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  ListView.separated(
                    itemCount: 5,
                    itemBuilder: (context, index) => NewsWidget(),
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 15.h),
                  ),

                  ListView.separated(
                    itemCount: 5,
                    itemBuilder: (context, index) => NewsWidget(),
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 15.h),
                  ),
                ],
              ),
            ),
          ],
        ).marginSymmetric(horizontal: 20.w),
      ),
    );
  }
}
