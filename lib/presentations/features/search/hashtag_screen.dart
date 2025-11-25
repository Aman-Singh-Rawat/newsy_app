import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/app/config/app_colors.dart';
import 'package:newsy/app/constants/text_strings.dart';

import 'package:newsy/core/utils/extensions.dart';
import 'package:newsy/core/utils/helper_function.dart';
import 'package:newsy/presentations/common_widgets/appbar/appbar.dart';
import 'package:newsy/presentations/common_widgets/buttons/btn_with_bg.dart';
import 'package:newsy/presentations/common_widgets/news_widget.dart';
import 'package:newsy/presentations/common_widgets/texts/text_container.dart';

class HashtagScreen extends StatefulWidget {
  final Map<String, String> hashtag;
  const HashtagScreen({super.key, required this.hashtag});

  @override
  State<HashtagScreen> createState() => _HashtagScreenState();
}

class _HashtagScreenState extends State<HashtagScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = HelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: TextStrings.hashtag,
        actions: [BtnWithBg(icon: Icons.more_vert_rounded)],
      ),
      body: Column(
        children: [
          // Hashtag header (fixed)
          SizedBox(height: 20.h),
          TextContainer(
            padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 10.h),
            child: Text(
              widget.hashtag["tag"]!,
              style: TextStyle(
                color: Colors.white,
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.hashtag["count"]!,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colorr.primaryColor[400],
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(width: 3.w),
              Text(
                TextStrings.news.toLowerCase(),
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Divider(
            color: isDark ? Colorr.darkSurface : Colors.grey.shade200,
          ).padOnly(top: 10.h, left: 20.h, right: 20.h, bottom: 10.h),

          // Tabs
          TabBar(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            controller: tabController,
            indicatorWeight: 3.5.h,
            tabs: const [
              Tab(text: TextStrings.top),
              Tab(text: TextStrings.recent),
            ],
          ),

          // Scrollable area
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                ListView.separated(
                  itemBuilder: (context, index) => NewsWidget(),
                  itemCount: 5,
                  separatorBuilder: (_, __) => SizedBox(height: 20.h),
                ).padOnly(top: 20.h, left: 20.w, right: 20.w),

                ListView.separated(
                  itemBuilder: (context, index) => NewsWidget(),
                  itemCount: 5,
                  separatorBuilder: (_, __) => SizedBox(height: 20.h),
                ).padOnly(top: 20.h, left: 20.w, right: 20.w),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
