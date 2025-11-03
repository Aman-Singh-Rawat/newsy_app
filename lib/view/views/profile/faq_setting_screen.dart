import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/theme/custom_text_style.dart';
import 'package:newsy/core/utils/constants.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/view/widgets/category_widget.dart';
import 'package:newsy/view/widgets/custom_app_bar.dart';

class FaqSettingScreen extends StatefulWidget {
  const FaqSettingScreen({super.key});

  @override
  State<FaqSettingScreen> createState() => _FaqSettingScreenState();
}

class _FaqSettingScreenState extends State<FaqSettingScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: "FAQ", context: context),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20.h),

            // category widget
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: faqCategories.asMap().entries.map((cat) {
                  return GestureDetector(
                    onTap: () => setState(() => _selectedIndex = cat.key),
                    child: CategoryWidget(
                      index: cat.key,
                      categoryName: cat.value,
                      isSelected: cat.key == _selectedIndex,
                    ),
                  );
                }).toList(),
              ),
            ),

            SizedBox(height: 20.h),

            Expanded(
              child: ListView.builder(
                itemCount: faqData.length,
                itemBuilder: (context, index) {
                  final faq = faqData[index];
                  return ExpansionTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      side: BorderSide(color: Colorr.primaryColor[400]!),
                    ),
                    collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      side: BorderSide(color: Colors.grey.shade200),
                    ),
                    title: Text(
                      faq["question"] as String,
                      style: CustomTextStyle.settingScreenItemTitleStyle,
                    ),
                    trailing: Icon(
                      Icons.arrow_drop_down_rounded,
                      color: Colorr.primaryColor[400],
                    ),
                    children: [
                      Divider().padOnly(bottom: 10.h),
                      Text(
                        faq["answer"] as String,

                        style: TextStyle(
                          height: 1.5.h,
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w500,
                          fontSize: 11.sp,
                        ),
                      ).padSymmetric(horizontal: 20.w),
                      SizedBox(height: 20.h),
                    ],
                  ).padOnly(bottom: 20.h);
                },
              ).padSymmetric(horizontal: 20.w),
            ),
          ],
        ),
      ),
    );
  }
}
