import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/utils/constants.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/models/users.dart';
import 'package:newsy/view/views/home/news_agency_detail_screen.dart';
import 'package:newsy/view/widgets/btn_with_bg.dart';
import 'package:newsy/view/widgets/custom_app_bar.dart';
import 'package:newsy/view/widgets/search_view_widget.dart';
import 'package:newsy/view/widgets/user_list_tile.dart';

class FollowersAndFollowingScreen extends StatefulWidget {
  final String title;
  const FollowersAndFollowingScreen({super.key, this.title = "Followers"});

  @override
  State<FollowersAndFollowingScreen> createState() =>
      _FollowersAndFollowingScreenState();
}

class _FollowersAndFollowingScreenState
    extends State<FollowersAndFollowingScreen> {
  late List<User> usersList;

  @override
  void initState() {
    if (widget.title == "Followers") {
      usersList = users;
    } else {
      usersList = users.where((user) => !user.isFollowing).toList();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        title: widget.title,
        context: context,
        actions: [BtnWithBg(icon: Icons.more_vert_rounded)],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
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
            ).padOnly(top: 10.h, bottom: 20.h),

            Expanded(
              child: ListView.builder(
                itemCount: usersList.length,
                itemBuilder: (context, index) => UserListTile(
                  user: usersList[index],
                  onClick: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => NewsAgencyDetailScreen(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ).padSymmetric(horizontal: 20.w),
      ),
    );
  }
}
