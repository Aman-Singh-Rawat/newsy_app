import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/app/config/custom_text_style.dart';
import 'package:newsy/app/constants/constants.dart';
import 'package:newsy/app/constants/image_strings.dart';
import 'package:newsy/app/constants/text_strings.dart';
import 'package:newsy/core/utils/extensions.dart';
import 'package:newsy/presentations/common_widgets/category_widget.dart';
import 'package:newsy/presentations/common_widgets/get_search_result_widget.dart';
import 'package:newsy/presentations/common_widgets/news_widget.dart';

class NewsListTab extends StatefulWidget {
  const NewsListTab({super.key});

  @override
  State<NewsListTab> createState() => _NewsListTabState();
}

class _NewsListTabState extends State<NewsListTab> {
  int _catSelectedIndex = 0;

  Widget emptyWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          ImageStrings.imgNoResultFound,
          fit: BoxFit.cover,
          width: 200.w,
          height: 200.h,
        ),
        Text(TextStrings.noResultFound, style: CustomTextStyle.emptyTextStyle),

        SizedBox(height: 12.h),
        Text(
          TextStrings.pleaseTryAnotherKeyword,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ],
    ).padSymmetric(horizontal: 20.w);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: newsCategories.asMap().entries.map((cat) {
                return CategoryChip(
                  label: cat.value,
                  isSelected: _catSelectedIndex == cat.key,
                  onTap: () {
                    setState(() => _catSelectedIndex = cat.key);
                  },
                );
              }).toList(),
            ),
          ).padOnly(left: 20.w),

          SizedBox(height: 20.h),

          GetSearchResultWidget(),

          SizedBox(height: 20.h),

          ListView.separated(
            itemBuilder: (context, index) => NewsWidget(),
            separatorBuilder: (context, index) => SizedBox(height: 15.h),
            itemCount: 5,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
          ).padSymmetric(horizontal: 20.w),
        ],
      ).padSymmetric(vertical: 25.h),
    );
  }
}
