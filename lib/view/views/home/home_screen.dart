import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/navigation/app_navigation.dart';
import 'package:newsy/core/utils/constants.dart';
import 'package:newsy/core/utils/constants/image_strings.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/view/views/home/featured_screen.dart';
import 'package:newsy/view/views/home/notification_screen.dart';
import 'package:newsy/view/widgets/appbar/appbar.dart';
import 'package:newsy/view/widgets/btn_with_bg.dart';
import 'package:newsy/view/widgets/category_widget.dart';
import 'package:newsy/view/widgets/featured_widget.dart';
import 'package:newsy/view/widgets/get_screen_title_and_see_all';
import 'package:newsy/view/widgets/news_widget.dart';
import 'package:newsy/view/widgets/search_view_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: Image.asset(ImageStrings.imgSix),
        showBackArrow: false,
        title: "Berita",
        actions: [
          BtnWithBg(
            icon: CupertinoIcons.bell_fill,
            onTap: () => AppNavigator.push(context, const NotificationScreen()),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
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

                BtnWithBg(icon: Icons.filter_list_outlined),
              ],
            ).padSymmetric(horizontal: 20.w, vertical: 10.h),
            Expanded(
              child: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                      return [
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 10.h,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ScreenTitleText(
                                  title: 'Featured',
                                  onClick: () => AppNavigator.push(
                                    context,
                                    const FeaturedScreen(),
                                  ),
                                ),

                                SizedBox(height: 20.h),

                                FeaturedWidget(),
                              ],
                            ),
                          ),
                        ),
                        
                        SliverAppBar(
                          automaticallyImplyLeading: false,
                          pinned: true,
                          backgroundColor: Theme.of(
                            context,
                          ).scaffoldBackgroundColor,
                          bottom: PreferredSize(
                            preferredSize: Size.fromHeight(58.h),
                            child: Column(
                              children: [
                                ScreenTitleText(
                                  title: "News",
                                  onClick: () {},
                                ).padSymmetric(horizontal: 20.w),

                                SizedBox(height: 20.h),

                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: newsCategories.asMap().entries.map((
                                      cat,
                                    ) {
                                      return CategoryWidget(
                                        categoryName: cat.value,
                                        index: cat.key,
                                        isSelected:
                                            _selectedCategoryIndex == cat.key,
                                        onCategoryChoose: () {
                                          log(
                                            "debugging $_selectedCategoryIndex",
                                          );
                                          setState(
                                            () => _selectedCategoryIndex =
                                                cat.key,
                                          );
                                        },
                                      );
                                    }).toList(),
                                  ),
                                ),

                                SizedBox(height: 20.h),
                              ],
                            ),
                          ),
                        ),
                      ];
                    },
                body: ListView.builder(
                  itemBuilder: (context, index) => NewsWidget(),
                  itemCount: 5,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                ).padSymmetric(horizontal: 20.w),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
