import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/view/widgets/btn_with_bg.dart';
import 'package:newsy/view/widgets/custom_btn.dart';
import 'package:newsy/view/widgets/get_screen_title_and_see_all';
import 'package:newsy/view/widgets/news_screen.dart';
import 'package:newsy/view/widgets/news_screen_widget.dart';
import 'package:newsy/view/widgets/search_view_widget.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.only(right: 20.w),
        title: Text("Berita"),
        actions: [BtnWithBg(icon: CupertinoIcons.bell_fill)],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Row(
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
              ).marginSymmetric(horizontal: 20.w),
          
              SizedBox(height: 20.h),
          
              // featured and see all
              getScreenTitleAndSeeAll(
                title: "Featured",
                onTextClick: () {},
              ).marginSymmetric(horizontal: 20.w),
          
              SizedBox(height: 20.h),
          
              SizedBox(
                width: double.maxFinite,
                height: 245.h,
                child: Stack(
                  fit: StackFit.loose,
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.r),
                        child: Image.network(
                          "https://english.cdn.zeenews.com/sites/default/files/2021/02/07/915333-tiger-shroff-pool.jpg?im=Resize=(1200,900)",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
          
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                    ),
          
                    Positioned(
                      bottom: 15.w,
                      left: 15.w,
                      right: 15.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Tiger Shroff in Press Confrences India",
                            style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
          
                          SizedBox(height: 10.h),
          
                          CustomBtn(
                            color: Colorr.primaryColor[400]!,
                            btnText: "Read Now",
                            onTap: () {},
                            width: 90.w,
                            height: 32.h,
                            btnSize: 11.sp,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ).marginSymmetric(horizontal: 20.w),
          
              /// News Screen section
              NewsScreenWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
