import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/theme/custom_text_style.dart';
import 'package:newsy/core/utils/constants.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/view/widgets/beautiful_comment_widget.dart';
import 'package:newsy/view/widgets/btn_with_bg.dart';
import 'package:newsy/view/widgets/get_screen_title_and_see_all';
import 'package:newsy/view/widgets/my_text_button.dart';
import 'package:newsy/view/widgets/news_widget.dart';
import 'package:newsy/view/widgets/user_list_tile.dart';

class NewsDetailScreen extends StatefulWidget {
  const NewsDetailScreen({super.key});

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(Icons.arrow_back),
        ),
        actionsPadding: EdgeInsets.symmetric(horizontal: 20.w),
        actions: [
          BtnWithBg(icon: Icons.share_rounded),
          SizedBox(width: 10.w),
          BtnWithBg(icon: Icons.bookmark_outline_rounded),
          SizedBox(width: 10.w),
          BtnWithBg(icon: Icons.more_vert_rounded),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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

            SizedBox(height: 10.h),
            Text(
              "Joe Biden at Press Confrence USA Announces New Political Policy",
              style: GoogleFonts.poppins(
                height: 1.6.h,
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: 10.h),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.r),
                    border: Border.all(
                      color: Colorr.primaryColor[400]!,
                      width: 1.5.w,
                    ),
                  ),
                  child: Text(
                    "Politics",
                    style: GoogleFonts.poppins(
                      color: Colorr.primaryColor[400],
                      fontSize: 11.sp,
                    ),
                  ),
                ),

                SizedBox(width: 15.w),

                // buttons
                MyTextButton(icon: Icons.visibility, text: "638.8k"),
                SizedBox(width: 10.w),

                MyTextButton(icon: Icons.thumb_up, text: "638.8k"),
                SizedBox(width: 10.w),
                MyTextButton(icon: Icons.message, text: "638.8k"),
              ],
            ),

            UserListTile(user: users[0], isBorder: false),

            // desc
            Text(
              "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi.",
              style: GoogleFonts.poppins(
                fontSize: 12.sp,
                height: 1.5.h,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
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
              style: CustomTextStyle.userCommentTextStyle,
            ),

            SizedBox(height: 10.h),

            Wrap(
              runSpacing: 2.h,
              spacing: 5.w,
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
                    return Chip(
                      label: Text(value),
                      backgroundColor: Colors.white,
                      labelStyle: GoogleFonts.poppins(
                        color: Colorr.primaryColor[400],
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.r),
                        side: BorderSide(
                          color: Colorr.primaryColor[400]!,
                          width: 1.7.w,
                        ),
                      ),
                    );
                  }).toList(),
            ),

            SizedBox(height: 20.sp),

            Row(
              children: [
                Text(
                  "Is this news helpful?",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ),
                ),

                Spacer(),
                MyTextButton(icon: Icons.thumb_up, text: "381.4k"),
                SizedBox(width: 10.w),
                MyTextButton(icon: Icons.thumb_down, text: "21.4k"),
              ],
            ),

            SizedBox(height: 20.h),

            // comment
            BeautifulCommentWidget(),

            Divider(color: Colors.grey.shade200).padSymmetric(vertical: 17.h),

            getScreenTitleAndSeeAll(title: "Related", onTextClick: () {}),
  
            SizedBox(height: 20.h),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => NewsWidget(),
              itemCount: 5,
            ),
          ],
        ).padSymmetric(horizontal: 18.w, vertical: 20.h),
      ),
    );
  }


}
