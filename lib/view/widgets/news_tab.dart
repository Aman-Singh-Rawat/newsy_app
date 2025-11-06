import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/utils/constants.dart';
import 'package:newsy/view/widgets/category_widget.dart';
import 'package:newsy/view/widgets/get_search_result_widget.dart';
import 'package:newsy/view/widgets/news_widget.dart';

class NewsTabWidget extends StatefulWidget {
  const NewsTabWidget({super.key});

  @override
  State<NewsTabWidget> createState() => _NewsTabWidgetState();
}

class _NewsTabWidgetState extends State<NewsTabWidget> {
  int _selectedIndex = 0;
  Widget getNews() {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) => NewsWidget(),
        itemCount: 5,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),

        // category widget
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: newsCategories.asMap().entries.map((cat) {
              return GestureDetector(
                onTap: () => setState(() => _selectedIndex = cat.key),
                child: CategoryWidget(
                  index: cat.key,
                  categoryName: cat.value,
                  isSelected: cat.key == _selectedIndex,
                  onCategoryChoose: () {},
                ),
              );
            }).toList(),
          ),
        ),

        SizedBox(height: 22.h),

        // search result -> found
        GetSearchResultWidget(),

        // empty widget
        //getEmptyWidget,
        /// news widget
        SizedBox(height: 16.h),

        getNews(),

        SizedBox(height: 15.h),
      ],
    );
  }
}
