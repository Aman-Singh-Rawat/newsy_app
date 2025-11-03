import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/theme/custom_text_style.dart';
import 'package:newsy/core/utils/constants/image_strings.dart';
import 'package:newsy/core/utils/constants.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/view/widgets/btn_with_bg.dart';
import 'package:newsy/view/widgets/category_widget.dart';
import 'package:newsy/view/widgets/custom_btn.dart';
import 'package:newsy/view/widgets/news_widget.dart';
import 'package:newsy/view/widgets/search_view_and_filter.dart';
import 'package:newsy/view/widgets/show_bookmark_remove_bottom_sheet.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  int _selectedIndex = 0;
  Widget getNews() {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) => NewsWidget(
          onBookmarkClick: () => showBookmarkRemoveBottomSheet(context),
        ),
        itemCount: 5,
      ).padSymmetric(horizontal: 20.w),
    );
  }

  Widget getEmptyBookmark() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SvgPicture.asset(ImageStrings.icBookmark, width: 180.w, height: 180.h),
              SizedBox(height: 20),
              Text(
                "You have No bookmarked news",
                style: CustomTextStyle.emptyTextStyle,
              ),
            ],
          ),
        ),

        CustomBtn(
          color: Colorr.primaryColor[400]!,
          btnText: "Explore News",
          onTap: () {},
        ).padSymmetric(vertical: 20.h),
      ],
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
        leading: Image.asset(ImageStrings.imgSix),
        actionsPadding: EdgeInsets.only(right: 20.w),
        title: Text("My Bookmark"),
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
    );
  }
}
