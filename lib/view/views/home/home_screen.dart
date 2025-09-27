import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/view/views/home/featured_screen.dart';
import 'package:newsy/view/widgets/btn_with_bg.dart';
import 'package:newsy/view/widgets/featured_widget.dart';
import 'package:newsy/view/widgets/get_screen_title_and_see_all';
import 'package:newsy/view/widgets/news_screen_widget.dart';
import 'package:newsy/view/widgets/search_view_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isTopWidgetShown = true;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      // This code runs whenever the scroll position changes
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // User has scrolled to the very bottom

        log("Reached bottom of the scroll view!");
      } else if (_scrollController.position.pixels ==
          _scrollController.position.minScrollExtent) {
        setState(() {
          isTopWidgetShown = true;
        });
        // User has scrolled to the very top
        log("Reached top of the scroll view!");
      } else {
        // User is scrolling somewhere in between
        setState(() {
          isTopWidgetShown = false;
        });
        log("Scrollinafafafg...");
      }
      // You can also access the current scroll position:
      // print("Current scroll position: ${_scrollController.position.pixels}");
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.only(right: 20.w),
        title: Text("Berita"),
        actions: [BtnWithBg(icon: CupertinoIcons.bell_fill)],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    child: SearchViewWidget(
                      controller: TextEditingController(),
                      onButtonClick: () {},
                    ),
                  ),

                  SizedBox(width: 10.w),

                  BtnWithBg(icon: Icons.filter_list_outlined),
                ],
              ).marginSymmetric(horizontal: 20.w),

              if (isTopWidgetShown) ...[
                SizedBox(height: 20.h),

                // featured and see all
                getScreenTitleAndSeeAll(
                  title: "Featured",
                  onTextClick: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => FeaturedScreen()),
                    );
                  },
                ).marginSymmetric(horizontal: 20.w),

                SizedBox(height: 20.h),

                FeaturedWidget().marginSymmetric(horizontal: 20.w),
              ],

              /// News Screen section
              NewsScreenWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
