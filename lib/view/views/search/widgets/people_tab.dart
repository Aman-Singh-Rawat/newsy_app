import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/utils/constants.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/view/views/home/news_agency_detail_screen.dart';
import 'package:newsy/view/widgets/get_search_result_widget.dart';
import 'package:newsy/view/widgets/user_list_tile.dart';

class PeopleTab extends StatelessWidget {
  const PeopleTab({super.key});

  @override
  Widget build(BuildContext context) {
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
              onClick: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => NewsAgencyDetailScreen(),
                ),
              ),
            ),
          ).padSymmetric(horizontal: 20.w),
        ),
      ],
    );
  }
}
