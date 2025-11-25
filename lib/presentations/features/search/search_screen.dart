import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:newsy/app/constants/text_strings.dart';
import 'package:newsy/core/utils/extensions.dart';
import 'package:newsy/presentations/features/search/widgets/hashtag_tab.dart';
import 'package:newsy/presentations/features/search/widgets/news_list_tab.dart';
import 'package:newsy/presentations/features/search/widgets/people_tab.dart';
import 'package:newsy/presentations/common_widgets/appbar/appbar.dart';
import 'package:newsy/presentations/common_widgets/searchview/searchview_with_filter.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(title: TextStrings.search),
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
                    Tab(text: TextStrings.news),
                    Tab(text: TextStrings.people),
                    Tab(text: TextStrings.hashtag),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: tabController,
            children: [NewsListTab(), PeopleTab(), HashtagTab()],
          ),
        ),
      ),
    );
  }
}
