import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsy/core/theme/app_colors.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
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
    return SingleChildScrollView(
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
                    ? Border.all(width: 2.w, color: Colorr.primaryColor[400]!)
                    : null,
              ),
              child: Text(
                cat.value,
                style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? Colors.white : Colorr.primaryColor[400],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
