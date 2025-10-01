
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/view/widgets/category_widget.dart';
import 'package:newsy/view/widgets/get_screen_title_and_see_all';
import 'package:newsy/view/widgets/news_widget.dart';

class NewsScreenWidget extends StatelessWidget {
  const NewsScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.h,),

        /// news and see all
        getScreenTitleAndSeeAll(
          title: "News",
          onTextClick: () {},
        ).marginSymmetric(horizontal: 20.w, vertical: 15.h),

        /// top category list
        CategoryWidget(),

        SizedBox(height: 5.h,),

        /// news widget
        ListView.builder(
          itemBuilder: (context, index) => NewsWidget(),
          itemCount: 5,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
        ),

        SizedBox(height: 15.h,)
      ],
    );
  }
}
