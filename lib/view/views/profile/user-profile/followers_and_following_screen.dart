import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/view/widgets/btn_with_bg.dart';
import 'package:newsy/view/widgets/search_view_widget.dart';

class FollowersAndFollowingScreen extends StatefulWidget {
  const FollowersAndFollowingScreen({super.key});

  @override
  State<FollowersAndFollowingScreen> createState() =>
      _FollowersAndFollowingScreenState();
}

class _FollowersAndFollowingScreenState
    extends State<FollowersAndFollowingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
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
              padding: 9.0,
              iconSize: 26.0,
            ),
          ],
        ),
      ),
    );
  }
}
