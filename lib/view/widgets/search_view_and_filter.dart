import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/view/widgets/btn_with_bg.dart';
import 'package:newsy/view/widgets/search_view_widget.dart';

class SearchViewAndFilter extends StatelessWidget {
  const SearchViewAndFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SearchViewWidget(
            controller: TextEditingController(),
            onButtonClick: () {},
          ),
        ),

        SizedBox(width: 10.w),

        BtnWithBg(
          icon: Icons.filter_list_rounded,
          padding: EdgeInsets.all(10.0),
          iconSize: 20.0,
        ),
      ],
    );
  }
}
