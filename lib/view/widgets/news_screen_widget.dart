
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/view/widgets/get_screen_title_and_see_all';
import 'package:newsy/view/widgets/news_widget.dart';

class NewsScreenWidget extends StatefulWidget {
  const NewsScreenWidget({super.key});

  @override
  State<NewsScreenWidget> createState() => _NewsScreenWidgetState();
}

class _NewsScreenWidgetState extends State<NewsScreenWidget> {
  int _selectedIndex = 0;

  final List<String> newsCategories = [
    "Trending",
    "Latest",
    "Politics",
    "Business",
    "Technology",
    "Entertainment",
    "Sports",
    "Health",
    "Science",
    "Education",
    "World",
    "Lifestyle",
    "Travel",
    "Food",
    "Environment",
    "Crime",
    "Opinion",
    "Finance",
    "Culture",
  ];


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

        /// top filter list
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: newsCategories.asMap().entries.map((cat) {
              final isSelected = cat.key == _selectedIndex;

              return GestureDetector(
                onTap: () => setState(() => _selectedIndex = cat.key),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: isSelected ? 10.h : 6.h,
                  ),
                  margin: EdgeInsets.only(
                    right: 10.w,
                    left: cat.key == 0 ? 20.w : 0,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected ? Colorr.primaryColor[400] : Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                    border: !isSelected
                        ? Border.all(
                            width: 2.w,
                            color: Colorr.primaryColor[400]!,
                          )
                        : null,
                  ),
                  child: Text(
                    cat.value,
                    style: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: isSelected
                          ? Colors.white
                          : Colorr.primaryColor[400],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),

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
