import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/utils/assets.dart';
import 'package:newsy/core/utils/constants.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/view/widgets/btn_with_bg.dart';
import 'package:newsy/view/widgets/category_widget.dart';
import 'package:newsy/view/widgets/news_widget.dart';
import 'package:newsy/view/widgets/search_view_and_filter.dart';
import 'package:newsy/view/widgets/show_bookmark_remove_bottom_sheet.dart';

class MyNewsScreen extends StatefulWidget {
  const MyNewsScreen({super.key});

  @override
  State<MyNewsScreen> createState() => _MyNewsScreenState();
}

class _MyNewsScreenState extends State<MyNewsScreen> {
  int _selectedIndex = 0;

  Widget getNews() {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) => NewsWidget(
          onEdit: () {},
          onBookmarkClick: () => showBookmarkRemoveBottomSheet(context),
        ),
        itemCount: 5,
      ).padSymmetric(horizontal: 20.w),
    );
  }

  Widget getMyBookmarkNews() {
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
                ),
              );
            }).toList(),
          ),
        ),

        SizedBox(height: 16.h),

        getNews(),

        SizedBox(height: 15.h),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(Assets.imgSix),
        actionsPadding: EdgeInsets.only(right: 20.w),
        title: Text("My News"),
        actions: [BtnWithBg(icon: Icons.more_vert_rounded)],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 15.h),
            SearchViewAndFilter().padSymmetric(horizontal: 20.w),
            Expanded(child: getMyBookmarkNews()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colorr.primaryColor[400],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.r),
        ),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
