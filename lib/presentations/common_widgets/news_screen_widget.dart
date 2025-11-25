import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/app/constants/constants.dart';
import 'package:newsy/core/utils/extensions.dart';
import 'package:newsy/presentations/common_widgets/category_widget.dart';
import 'package:newsy/presentations/common_widgets/texts/screen_title_text.dart';
import 'package:newsy/presentations/common_widgets/news_widget.dart';

class NewsScreenWidget extends StatefulWidget {
  const NewsScreenWidget({super.key});

  @override
  State<NewsScreenWidget> createState() => _NewsScreenWidgetState();
}

class _NewsScreenWidgetState extends State<NewsScreenWidget> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.h),

        /// news and see all
        ScreenTitleText(
          title: "News",
          onClick: () {},
        ).marginSymmetric(horizontal: 20.w, vertical: 15.h),

        /// top category list
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: newsCategories.asMap().entries.map((cat) {
              return GestureDetector(
                onTap: () => setState(() => _selectedIndex = cat.key),
                child: CategoryChip(
                  label: cat.value,
                  isSelected: cat.key == _selectedIndex,
                  onTap: () {},
                ),
              );
            }).toList(),
          ),
        ).padOnly(left: 20.w),

        SizedBox(height: 5.h),

        /// news widget
        ListView.builder(
          itemBuilder: (context, index) => NewsWidget(),
          itemCount: 5,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
        ).padSymmetric(horizontal: 20.w),

        SizedBox(height: 15.h),
      ],
    );
  }
}
