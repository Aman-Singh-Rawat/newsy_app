import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:newsy/core/utils/helper_function.dart';
import 'package:newsy/data/models/users.dart';
import 'package:newsy/presentations/common_widgets/texts/follow_status_text.dart';

class UserListTile extends StatelessWidget {
  final User user;
  final Color? color;
  final VoidCallback onClick;
  final Border? border;
  const UserListTile({
    super.key,
    this.border,
    required this.user,
    required this.onClick,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = HelperFunction.isDarkMode(context);

    return InkWell(
      onTap: onClick,
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(15.r)),
          border: border,
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
          leading: CircleAvatar(
            radius: 23.r,
            backgroundImage: NetworkImage(user.imageUrl),
          ),
          title: Text(
            user.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(fontSize: 12.sp),
          ),
          subtitle: Text(
            user.followers,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 9.sp),
          ),
          trailing: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(20.r)),
            onTap: () {},
            child: FollowStatusText(isFollowingText: user.isFollowing),
          ),
        ),
      ),
    );
  }
}
