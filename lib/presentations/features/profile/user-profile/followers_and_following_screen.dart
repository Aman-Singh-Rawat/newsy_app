import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/app/navigation/app_navigation.dart';
import 'package:newsy/app/constants/constants.dart';
import 'package:newsy/app/constants/text_strings.dart';
import 'package:newsy/core/utils/extensions.dart';
import 'package:newsy/data/models/users.dart';
import 'package:newsy/presentations/features/home/view/news_agency_profile_screen.dart';
import 'package:newsy/presentations/common_widgets/appbar/appbar.dart';
import 'package:newsy/presentations/common_widgets/buttons/btn_with_bg.dart';
import 'package:newsy/presentations/common_widgets/searchview/searchview_with_filter.dart';
import 'package:newsy/presentations/common_widgets/user_list_tile.dart';

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
    if (widget.title == TextStrings.followers) {
      usersList = users;
    } else {
      usersList = users.where((user) => !user.isFollowing).toList();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.title,
        actions: [BtnWithBg(icon: Icons.more_vert_rounded)],
      ),
      body: Column(
        children: [
          SearchViewWithFilter().padOnly(top: 10.h, bottom: 20.h),

          Expanded(
            child: ListView.builder(
              itemCount: usersList.length,
              itemBuilder: (context, index) => UserListTile(
                user: usersList[index],
                onClick: () =>
                    AppNavigator.push(context, const NewsAgencyProfileScreen()),
              ),
            ),
          ),
        ],
      ).padSymmetric(horizontal: 20.w),
    );
  }
}
