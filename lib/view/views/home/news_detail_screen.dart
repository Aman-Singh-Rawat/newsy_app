import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/navigation/app_navigation.dart';

import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/theme/custom_text_style.dart';
import 'package:newsy/core/utils/constants.dart';
import 'package:newsy/core/utils/constants/text_strings.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/core/utils/helpers/helper_function.dart'
    show HelperFunction;
import 'package:newsy/view/views/home/news_agency_profile_screen.dart';
import 'package:newsy/view/widgets/appbar/appbar.dart';
import 'package:newsy/view/widgets/beautiful_comment_widget.dart';
import 'package:newsy/view/widgets/btn_with_bg.dart';
import 'package:newsy/view/widgets/get_screen_title_and_see_all';
import 'package:newsy/view/widgets/my_text_button.dart';
import 'package:newsy/view/widgets/news_widget.dart';
import 'package:newsy/view/widgets/texts/text_container.dart';
import 'package:newsy/view/widgets/user_list_tile.dart';

class NewsDetailScreen extends StatefulWidget {
  const NewsDetailScreen({super.key});

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final bool isDark = HelperFunction.isDarkMode(context);
    final currentPrimaryColor = isDark
        ? Colorr.primaryColor[300]
        : Colorr.primaryColor[400];

    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          /// share button
          BtnWithBg(icon: Icons.share_rounded),
          SizedBox(width: 10.w),

          /// bookmark
          BtnWithBg(icon: Icons.bookmark_outline_rounded),
          SizedBox(width: 10.w),

          /// more
          BtnWithBg(icon: Icons.more_vert_rounded),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// News Image
            SizedBox(
              height: 243.h,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Image.network(
                  "https://images.unsplash.com/photo-1759244336115-c68d0adf6f57?q=80&w=1171&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SizedBox(height: 20.h),

            /// Title
            Text(
              "Joe Biden at Press Confrence USA Announces New Political Policy",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w600,
                height: 1.4.h,
                fontSize: 17.sp,
              ),
            ),

            SizedBox(height: 22.h),

            /// Action Buttons and topic
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextContainer(
                  border: Border.all(color: currentPrimaryColor!),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4.h),
                  color: Colors.transparent,
                  child: Text(
                    "Politics",
                    style: TextStyle(
                      color: currentPrimaryColor,
                      fontSize: 9.sp,
                    ),
                  ),
                ),

                SizedBox(width: 15.w),

                // Views
                ActionButton(icon: Icons.visibility, text: "638.8k"),
                SizedBox(width: 15.w),

                /// likes
                ActionButton(icon: Icons.thumb_up, text: "638.8k"),
                SizedBox(width: 15.w),

                /// comments
                ActionButton(icon: Icons.message, text: "638.8k"),
              ],
            ),

            SizedBox(height: 15.h),

            /// user
            UserListTile(
              user: users[0],

              color: Colors.transparent,
              onClick: () =>
                  AppNavigator.push(context, const NewsAgencyProfileScreen()),
            ),

            // desc
            Text(
              "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi.",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.w400,
                height: 1.6.h,
              ),
            ),
            SizedBox(height: 20.h),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Image.network(
                  "https://plus.unsplash.com/premium_photo-1698405316329-fd9c43d7e11c?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SizedBox(height: 20.h),
            Text(
              "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi.",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.w400,
                height: 1.6.h,
              ),
            ),

            SizedBox(height: 10.h),

            Wrap(
              runSpacing: 1.h,
              spacing: 10.w,
              children:
                  [
                    "#politics",
                    "#usa",
                    "#news",
                    "#kuchV",
                    "#flutter",
                    "#android",
                    "#flutter",
                  ].map((value) {
                    return Chip(label: Text(value));
                  }).toList(),
            ),

            SizedBox(height: 22.sp),

            Row(
              children: [
                Text(
                  TextStrings.isThisNewsHelpful,
                  style: Theme.of(
                    context,
                  ).textTheme.headlineMedium!.copyWith(fontSize: 14.sp),
                ),

                Spacer(),
                ActionButton(icon: Icons.thumb_up, text: "381.4k"),
                SizedBox(width: 15.w),
                ActionButton(icon: Icons.thumb_down, text: "21.4k"),
              ],
            ),

            SizedBox(height: 22.h),

            // comment
            BeautifulCommentWidget(),

            Divider().padSymmetric(vertical: 17.h),

            ScreenTitleText(title: TextStrings.related, onClick: () {}),

            SizedBox(height: 20.h),
            ListView.separated(
              shrinkWrap: true,
              itemCount: 5,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => NewsWidget(),
              separatorBuilder: (context, index) => SizedBox(height: 15.h),
            ),
          ],
        ).padSymmetric(horizontal: 18.w, vertical: 20.h),
      ),
    );
  }
}
