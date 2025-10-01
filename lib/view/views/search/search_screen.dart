import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/theme/custom_text_style.dart';
import 'package:newsy/core/utils/assets.dart';
import 'package:newsy/core/utils/constants.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/view/widgets/btn_with_bg.dart';
import 'package:newsy/view/widgets/category_widget.dart';
import 'package:newsy/view/widgets/custom_app_bar.dart';
import 'package:newsy/view/widgets/hashtag_widget.dart';
import 'package:newsy/view/widgets/news_widget.dart';
import 'package:newsy/view/widgets/search_view_widget.dart';
import 'package:newsy/view/widgets/user_list_tile.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  TabBar myTabBar() {
    return TabBar(
      controller: tabController,
      indicatorWeight: 3.5.h,
      tabs: [
        Tab(text: "News"),
        Tab(text: "People"),
        Tab(text: "Hashtag"),
      ],
    );
  }

  Widget get getEmptyWidget {
    return Column(
      children: [
        Image.asset(
          Assets.imgNoResultFound,
          fit: BoxFit.cover,
          width: 200.w,
          height: 200.h,
        ),
        Text("No Results Found", style: CustomTextStyle.emptyTextStyle),

        SizedBox(height: 12.h),
        Text(
          "Please try another keyword",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
        ),
      ],
    ).padSymmetric(horizontal: 20.w);
  }

  Widget get getNews {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) => NewsWidget(),
        itemCount: 5,
      ),
    );
  }

  Widget get getSearchResultWidget {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Search Results",
          style: GoogleFonts.poppins(
            color: Colors.black54,
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
          ),
        ),

        Text(
          "0 found",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colorr.primaryColor[400],
          ),
        ),
      ],
    ).padSymmetric(horizontal: 20.w);
  }

  Widget get getNewsTab {
    return Column(
      children: [
        SizedBox(height: 20.h),

        // category widget
        CategoryWidget(),

        SizedBox(height: 22.h),
        // search result -> found
        getSearchResultWidget,

        // empty widget
        //getEmptyWidget,
        /// news widget
        SizedBox(height: 16.h),

        getNews,

        SizedBox(height: 15.h),
      ],
    );
  }

  Widget get getPeopleTab {
    return Column(
      children: [
        SizedBox(height: 20.h),

        // search text
        getSearchResultWidget,

        SizedBox(height: 20.h),

        Expanded(
          child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) => UserListTile(user: users[index]),
          ).padSymmetric(horizontal: 20.w),
        ),
      ],
    );
  }

  Widget get getHashtag {
    return Column(
      children: [
        SizedBox(height: 20.h),

        // search text
        getSearchResultWidget,

        SizedBox(height: 20.h),

        Expanded(
          child: ListView.builder(
            itemCount: hashtags.length,
            itemBuilder: (context, index) =>
                HashtagWidget(hashtag: hashtags[index]),
          ),
        ),
      ],
    ).padSymmetric(horizontal: 20.w);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: getAppBar(
        title: "Search",
        context: context,
        bottomWidget: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: SearchViewWidget(
                    controller: TextEditingController(),
                    onButtonClick: () {},
                  ),
                ),

                SizedBox(width: 10.w),

                BtnWithBg(
                  icon: Icons.filter_list_rounded,
                  padding: 9.0,
                  iconSize: 26.0,
                ),
              ],
            ),

            SizedBox(height: 10.h),

            myTabBar(),
          ],
        ).padSymmetric(horizontal: 20.w),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // searchview and filter
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  // News Tab
                  getNewsTab,

                  // People Tab
                  getPeopleTab,

                  // hashtag tab
                  getHashtag,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
