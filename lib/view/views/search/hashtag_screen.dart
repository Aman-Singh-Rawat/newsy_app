import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/view/widgets/btn_with_bg.dart';
import 'package:newsy/view/widgets/custom_app_bar.dart';
import 'package:newsy/view/widgets/news_widget.dart';

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
    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        title: ((widget.hashtag["tag"] as String).substring(1)),
        context: context,
        actions: [BtnWithBg(icon: Icons.more_vert_rounded)],
        prefSize: 190,
        bottomWidget: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colorr.primaryColor[400],
                    borderRadius: BorderRadius.circular(25.sp),
                  ),
                  child: Center(
                    child: Text(
                      widget.hashtag["tag"] as String,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 13.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.hashtag["count"] as String,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    color: Colorr.primaryColor[400],
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(width: 3.w),
                Text(
                  "news",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),

            SizedBox(height: 22.h),

            Divider(color: Colors.grey.shade200),

            SizedBox(height: 10.h),

            TabBar(
              controller: tabController,
              indicatorWeight: 3.5.h,
              tabs: [
                Tab(text: "Top"),
                Tab(text: "Recent"),
              ],
            ),
          ],
        ).padSymmetric(horizontal: 20.w),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          ListView.builder(
            itemBuilder: (context, index) => NewsWidget(),
            itemCount: 5,
          ).padOnly(top: 20.h),

          // another tab item
          ListView.builder(
            itemBuilder: (context, index) => NewsWidget(),
            itemCount: 5,
          ).padOnly(top: 20.h),
        ],
      ),
    );
  }
}
