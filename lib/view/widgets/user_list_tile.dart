import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/utils/helpers/helper_function.dart';
import 'package:newsy/models/users.dart';
import 'package:newsy/view/widgets/texts/follow_status_text.dart';

class UserListTile extends StatelessWidget {
  final User user;
  final VoidCallback onClick;
  const UserListTile({super.key, required this.user, required this.onClick});

  @override
  Widget build(BuildContext context) {
    final bool isDark = HelperFunction.isDarkMode(context);

    return InkWell(
      onTap: onClick,
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        decoration: BoxDecoration(
          color: isDark ? Colorr.darkSurface : Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(15.r)),
          border: !isDark
              ? Border.all(color: Colors.grey.shade200, width: 1.5.w)
              : null,
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
            style: Theme.of(context).textTheme.labelSmall,
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
