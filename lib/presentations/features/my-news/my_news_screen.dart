import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/app/navigation/app_navigation.dart';
import 'package:newsy/app/config/app_colors.dart';
import 'package:newsy/app/constants/image_strings.dart';
import 'package:newsy/app/constants/constants.dart';
import 'package:newsy/app/constants/text_strings.dart';
import 'package:newsy/core/utils/extensions.dart';
import 'package:newsy/presentations/features/my-news/create_new_news.dart';
import 'package:newsy/presentations/common_widgets/appbar/appbar.dart';
import 'package:newsy/presentations/common_widgets/buttons/btn_with_bg.dart';
import 'package:newsy/presentations/common_widgets/category_widget.dart';
import 'package:newsy/presentations/common_widgets/news_widget.dart';
import 'package:newsy/presentations/common_widgets/searchview/searchview_with_filter.dart';
import 'package:newsy/presentations/features/bookmark/widgets/show_bookmark_remove_bottom_sheet.dart';

class MyNewsScreen extends StatefulWidget {
  const MyNewsScreen({super.key});

  @override
  State<MyNewsScreen> createState() => _MyNewsScreenState();
}

class _MyNewsScreenState extends State<MyNewsScreen> {
  int _selectedIndex = 0;

  Widget newsList() {
    return Expanded(
      child: ListView.separated(
        itemCount: 5,
        itemBuilder: (context, index) => NewsWidget(
          onEdit: () {},
          onBookmarkClick: () => showBookmarkRemoveBottomSheet(context),
        ),
        separatorBuilder: (context, index) => SizedBox(height: 12.h),
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
                child: CategoryChip(
                  label: cat.value,
                  isSelected: cat.key == _selectedIndex,
                  onTap: () {},
                ),
              );
            }).toList(),
          ),
        ).padOnly(left: 20.w),

        SizedBox(height: 16.h),

        newsList(),

        SizedBox(height: 15.h),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 14.w),
          child: Image.asset(ImageStrings.imgSix),
        ),
        showBackArrow: false,
        title: TextStrings.myNews,
        actions: [
          BtnWithBg(
            imgPath: ImageStrings.icSave,
            iconSize: 25.w,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          ),

          SizedBox(width: 10.w),

          BtnWithBg(icon: Icons.more_vert_rounded),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 15.h),
          SearchViewWithFilter().padSymmetric(horizontal: 20.w),
          Expanded(child: getMyBookmarkNews()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => AppNavigator.push(context, const CreateNewNews()),
        backgroundColor: Colorr.primaryColor[400],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.r),
        ),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
