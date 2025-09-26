import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/theme/app_colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final Function(int) onTap;
  final int currentBottomSelectedIndex;

  const CustomBottomNavigationBar({
    super.key,
    required this.onTap,
    required this.currentBottomSelectedIndex,
  });

  Widget getBottomNavBarItem({
    required IconData icon,
    required bool isSelected,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.r),
        color: isSelected
            ? Colorr.primaryColor[400]
            : Colorr.primaryColor[100]!.withOpacity(0.5),
      ),
      child: Icon(icon),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(width: 2, color: Colors.grey.shade200)),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.r),
          topRight: Radius.circular(25.r),
        ),
      ),
      child: BottomNavigationBar(
        iconSize: 25.w,
        backgroundColor: Colors.transparent,
        elevation: 0,
        onTap: onTap,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: IconThemeData(color: Colors.white),
        unselectedIconTheme: IconThemeData(color: Colorr.primaryColor[400]),
        currentIndex: currentBottomSelectedIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: getBottomNavBarItem(
              icon: Icons.home,
              isSelected: currentBottomSelectedIndex == 0,
            ),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: getBottomNavBarItem(
              icon: Icons.search,
              isSelected: currentBottomSelectedIndex == 1,
            ),
            label: "Search",
          ),

          BottomNavigationBarItem(
            icon: getBottomNavBarItem(
              icon: CupertinoIcons.bookmark,
              isSelected: currentBottomSelectedIndex == 2,
            ),

            label: "Bookmark",
          ),

          BottomNavigationBarItem(
            icon: getBottomNavBarItem(
              icon: CupertinoIcons.list_bullet,
              isSelected: currentBottomSelectedIndex == 3,
            ),
            label: "List",
          ),

          BottomNavigationBarItem(
            icon: getBottomNavBarItem(
              icon: Icons.person,
              isSelected: currentBottomSelectedIndex == 4,
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
