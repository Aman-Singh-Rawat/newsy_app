import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/theme/app_colors.dart';

import 'package:newsy/core/theme/custom_text_style.dart';
import 'package:newsy/core/utils/constants/image_strings.dart';
import 'package:newsy/core/utils/constants.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/view/views/home/news_agency_detail_screen.dart';
import 'package:newsy/view/views/search/widgets/news_list_tab.dart';
import 'package:newsy/view/widgets/appbar/appbar.dart';
import 'package:newsy/view/widgets/category_widget.dart';
import 'package:newsy/view/widgets/get_search_result_widget.dart';
import 'package:newsy/view/widgets/hashtag_widget.dart';
import 'package:newsy/view/widgets/news_tab.dart';
import 'package:newsy/view/widgets/searchview/searchview_with_filter.dart';
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

  Widget getPeopleTab() {
    return Column(
      children: [
        SizedBox(height: 20.h),

        // search text
        GetSearchResultWidget(),

        SizedBox(height: 20.h),

        Expanded(
          child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) => UserListTile(
              user: users[index],
              onClick: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => NewsAgencyDetailScreen(),
                ),
              ),
            ),
          ).padSymmetric(horizontal: 20.w),
        ),
      ],
    );
  }

  Widget hashtagTab() {
    return Column(
      children: [
        SizedBox(height: 20.h),

        // search text
        GetSearchResultWidget(),

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
      appBar: CustomAppBar(title: "Search"),
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, _) {
            return [
              SliverAppBar(
                pinned: true,
                flexibleSpace: SearchViewWithFilter().padSymmetric(
                  horizontal: 20.w,
                ),
                bottom: TabBar(
                  controller: tabController,
                  indicatorWeight: 3.5.h,
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  tabs: [
                    Tab(text: "News"),
                    Tab(text: "People"),
                    Tab(text: "Hashtag"),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: tabController,
            children: [NewsListTab(), getPeopleTab(), hashtagTab()],
          ),
        ),
      ),
    );
  }
}
