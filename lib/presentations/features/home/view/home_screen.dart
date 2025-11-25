import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/app/navigation/app_navigation.dart';
import 'package:newsy/app/constants/constants.dart';
import 'package:newsy/app/constants/image_strings.dart';
import 'package:newsy/core/utils/extensions.dart';
import 'package:newsy/presentations/features/home/provider/news_provider.dart';
import 'package:newsy/presentations/features/home/view/featured_screen.dart';
import 'package:newsy/presentations/features/home/notification_screen.dart';
import 'package:newsy/presentations/common_widgets/appbar/appbar.dart';
import 'package:newsy/presentations/common_widgets/buttons/btn_with_bg.dart';
import 'package:newsy/presentations/common_widgets/category_widget.dart';
import 'package:newsy/presentations/common_widgets/featured_widget.dart';
import 'package:newsy/presentations/common_widgets/news_widget.dart';
import 'package:newsy/presentations/common_widgets/searchview/searchview_with_filter.dart';
import 'package:newsy/presentations/common_widgets/texts/screen_title_text.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _selectedCategoryIndex = 0;

  @override
  void initState() {
    super.initState();
    // TODO:: please learn why we use Future.microTask()
    Future.microtask(() {
      ref.read(newsViewModelProvider.notifier).loadNews();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(newsViewModelProvider);

    return Scaffold(
      appBar: CustomAppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 14.w),
          child: Image.asset(ImageStrings.imgSix),
        ),
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
            SearchViewWithFilter().padSymmetric(
              horizontal: 20.w,
              vertical: 10.h,
            ),
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
                                      return CategoryChip(
                                        label: cat.value,
                                        isSelected:
                                            _selectedCategoryIndex == cat.key,
                                        onTap: () {
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
                                ).padOnly(left: 20.w),

                                SizedBox(height: 20.h),
                              ],
                            ),
                          ),
                        ),
                      ];
                    },
                body: state.when(
                  data: (news) {
                    if (news == null) {
                      // Todo bro implement load news widget
                      return Text("data is not here");
                    }

                    final newsList = news.results;
                    return ListView.separated(
                      itemBuilder: (context, index) =>
                          NewsWidget(article: newsList[index]),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 15.h),
                      itemCount: 5,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                    ).padSymmetric(horizontal: 20.w);
                  },
                  error: (err, _) => Center(child: Text(err.toString())),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
