import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/theme/custom_text_style.dart';
import 'package:newsy/core/utils/constants/image_strings.dart';
import 'package:newsy/core/utils/constants.dart';
import 'package:newsy/core/utils/constants/text_strings.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/view/widgets/appbar/appbar.dart';
import 'package:newsy/view/widgets/buttons/btn_with_bg.dart';
import 'package:newsy/view/widgets/category_widget.dart';
import 'package:newsy/view/widgets/custom_btn.dart';
import 'package:newsy/view/widgets/news_widget.dart';
import 'package:newsy/view/widgets/searchview/searchview_with_filter.dart';
import 'package:newsy/view/views/bookmark/widgets/show_bookmark_remove_bottom_sheet.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  int _selectedIndex = 0;
  Widget getNews() {
    return Expanded(
      child: ListView.separated(
        itemCount: 5,
        itemBuilder: (context, index) => NewsWidget(
          onBookmarkClick: () => showBookmarkRemoveBottomSheet(context),
        ),
        separatorBuilder: (context, index) => SizedBox(height: 12.h),
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
              Image.asset(
                ImageStrings.imgBookmark,
                width: 190.w,
                height: 190.h,
              ),
              SizedBox(height: 20),
              Text(
                TextStrings.youHaveNoBookmarkNews,
                style: CustomTextStyle.emptyTextStyle,
              ),
            ],
          ),
        ),

        CustomBtn(
          color: Colorr.primaryColor[400]!,
          btnText: TextStrings.exploreNews,
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
                  onCategoryChoose: () {},
                ),
              );
            }).toList(),
          ),
        ).padOnly(left: 20.w),

        SizedBox(height: 16.h),

        getNews(),

        SizedBox(height: 15.h),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: false,
        leading: Padding(
          padding: EdgeInsets.only(left: 14.w),
          child: Image.asset(ImageStrings.imgSix),
        ),
        title: TextStrings.myBookmark,
        actions: [BtnWithBg(icon: Icons.more_vert_rounded)],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 15.h),
            SearchViewWithFilter().padSymmetric(horizontal: 20.w),

            Expanded(child: getMyBookmarkNews()),
          ],
        ),
      ),
    );
  }
}
