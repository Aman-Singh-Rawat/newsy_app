
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/view/widgets/btn_with_bg.dart';
import 'package:newsy/view/widgets/searchview/search_view_widget.dart';

class SearchViewWithFilter extends StatelessWidget {
  const SearchViewWithFilter({
    super.key,
  });

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
    
        BtnWithBg(icon: Icons.filter_list_outlined),
      ],
    );
  }
}