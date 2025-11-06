import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/theme/custom_text_style.dart';
import 'package:newsy/core/utils/constants.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/view/widgets/appbar/appbar.dart';

class InviteFriendsSettingScreen extends StatelessWidget {
  const InviteFriendsSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Invite Friends"),
      body: SafeArea(
        child: ListView.builder(
          itemCount: inviteUser.length,
          itemBuilder: (context, index) {
            final user = inviteUser[index];
            return Container(
              height: 70.h,
              margin: EdgeInsets.only(bottom: 20.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12.r)),
                border: Border.all(color: Colors.grey.shade200, width: 1.5.w),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.r),
                      bottomLeft: Radius.circular(12.r),
                    ),
                    child: Image.network(
                      user["imageUrl"] as String,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          user["name"] as String,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyle.userNameTextStyle,
                        ),
                        Text(
                          user["phone"] as String,
                          maxLines: 1,
                          style: CustomTextStyle.userNameSubTextStyle,
                        ),
                      ],
                    ).padSymmetric(horizontal: 20.w),
                  ),

                  InkWell(
                    borderRadius: BorderRadius.all(Radius.circular(20.r)),
                    onTap: () => {},
                    child: AnimatedContainer(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          width: 2.w,
                          color: Colorr.primaryColor[400]!,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20.r)),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 13.w,
                        vertical: 6.h,
                      ),
                      duration: const Duration(microseconds: 200),
                      child: Text(
                        "invite",
                        style: CustomTextStyle.followFollowingTextStyle
                            .copyWith(color: Colorr.primaryColor[400]),
                      ),
                    ),
                  ),

                  SizedBox(width: 10.w),
                ],
              ),
            );
          },
        ).padOnly(left: 20.w, right: 20.w, top: 10.h),
      ),
    );
  }
}
