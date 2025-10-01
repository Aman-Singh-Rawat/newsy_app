import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/theme/custom_text_style.dart';
import 'package:newsy/models/users.dart';

class UserListTile extends StatelessWidget {
  final User user;
  final bool isBorder;
  const UserListTile({super.key, required this.user, this.isBorder = true});

  Widget getButtonText(String btnText) {
    return Text(
      btnText,
      style: CustomTextStyle.followFollowingTextStyle.copyWith(
        color: user.isFollowing ? Colors.white : Colorr.primaryColor[400],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.r)),
        border: isBorder
            ? Border.all(color: Colors.grey.shade200, width: 1.5.w)
            : null,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 23.r,
          backgroundImage: NetworkImage(user.imageUrl),
        ),
        title: Text(
          user.name,
          maxLines: 1,
          style: GoogleFonts.poppins(
            color: isBorder ? Colors.black : Colorr.primaryColor[400],
            fontSize: 13.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          user.followers,
          maxLines: 1,
          style: GoogleFonts.poppins(
            color: Colors.black87,
            fontSize: 10.sp,
            height: 2.1.h,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
          onTap: () => {},
          child: AnimatedContainer(
            decoration: BoxDecoration(
              color: user.isFollowing ? Colorr.primaryColor[400] : Colors.white,
              border: user.isFollowing
                  ? null
                  : Border.all(width: 2.w, color: Colorr.primaryColor[400]!),
              borderRadius: BorderRadius.all(Radius.circular(20.r)),
            ),
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.5.h),
            duration: const Duration(microseconds: 200),
            child: user.isFollowing
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.add, color: Colors.white, size: 18.w),
                      getButtonText("Follow"),
                    ],
                  )
                : getButtonText("Following"),
          ),
        ),
      ),
    );
  }
}
