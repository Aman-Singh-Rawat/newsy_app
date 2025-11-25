import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/app/constants/constants.dart';
import 'package:newsy/core/utils/extensions.dart';
import 'package:newsy/presentations/common_widgets/get_search_result_widget.dart';
import 'package:newsy/presentations/common_widgets/hashtag_widget.dart';

class HashtagTab extends StatelessWidget {
  const HashtagTab({super.key});

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
            itemCount: hashtags.length,
            itemBuilder: (context, index) =>
                HashtagWidget(hashtag: hashtags[index]),
          ),
        ),
      ],
    ).padSymmetric(horizontal: 20.w);
  }
}
