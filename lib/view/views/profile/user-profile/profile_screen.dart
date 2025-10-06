import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/view/views/profile/settings_screen.dart';
import 'package:newsy/view/widgets/btn_with_bg.dart';
import 'package:newsy/view/widgets/my_outline_button.dart';
import 'package:newsy/view/widgets/news_widget.dart';
import 'package:newsy/view/widgets/profile_placeholder.dart';
import 'package:newsy/view/widgets/social_stats_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
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
      appBar: AppBar(
        title: Text("My Profile"),
        actionsPadding: EdgeInsets.only(right: 20.w),
        actions: [
          BtnWithBg(icon: Icons.edit).padOnly(right: 20.w),

          BtnWithBg(
            icon: Icons.settings,
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
              ProfilePlaceholder(),

              SizedBox(height: 15.h),

              // name
              Text(
                "Adam Smith",
                style: GoogleFonts.poppins(
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
                style: GoogleFonts.poppins(
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

                    SocialStatsWidget(category: "Followers", value: "2.279"),

                    VerticalDivider(),

                    SocialStatsWidget(category: "Following", value: "178"),
                  ],
                ),
              ),

              Divider().padSymmetric(vertical: 20.h),

              MyOutlineButton(onClick: () {}, btnText: "Website", icon: Icons.language,)

            ,

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
