import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/app/config/app_colors.dart';
import 'package:newsy/app/constants/constants.dart';
import 'package:newsy/core/utils/extensions.dart';
import 'package:newsy/core/utils/helper_function.dart';
import 'package:newsy/presentations/features/home/view/news_agency_profile_screen.dart';
import 'package:newsy/presentations/common_widgets/get_search_result_widget.dart';
import 'package:newsy/presentations/common_widgets/user_list_tile.dart';

class PeopleTab extends StatelessWidget {
  const PeopleTab({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = HelperFunction.isDarkMode(context);
    return Column(
      children: [
        SizedBox(height: 20.h),

        // search text
        GetSearchResultWidget(),

        SizedBox(height: 20.h),

        Expanded(
          child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) => UserListTile(
              user: users[index],
              border: !isDark
                  ? Border.all(color: Colors.grey.shade200, width: 1.5.w)
                  : null,
              color: isDark ? Colorr.darkSurface : Colors.transparent,
              onClick: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => NewsAgencyProfileScreen(),
                ),
              ),
            ),
          ).padSymmetric(horizontal: 20.w),
        ),
      ],
    );
  }
}
