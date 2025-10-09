import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/theme/custom_text_style.dart';
import 'package:newsy/core/utils/constants.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/view/widgets/custom_app_bar.dart';
import 'package:newsy/view/widgets/text_field_with_label_widget.dart';

class CreateNewNews extends StatefulWidget {
  const CreateNewNews({super.key});

  @override
  State<CreateNewNews> createState() => _CreateNewNewsState();
}

class _CreateNewNewsState extends State<CreateNewNews> {
  String? selectedCategory = "Politics";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: "Create New News", context: context),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 8,
              child: Container(
                decoration: BoxDecoration(
                  border: DashedBorder.fromBorderSide(
                    dashLength: 10,
                    side: BorderSide(color: Colors.grey.shade400, width: 2),
                  ),
                  color: Colors.grey.shade100.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, color: Colorr.primaryColor[300]),
                    Text(
                      "Add Cover Photos",
                      style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ).padOnly(top: 10.h),

            Divider().padSymmetric(vertical: 20.h),

            Text(
              "News Details",
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: 20.h),
            CustomTextFieldWithLabel(
              label: "Title",
              hint: "Title",
              controller: TextEditingController(),
            ),

            SizedBox(height: 20.h),

            Row(
              children: [
                const SizedBox(width: 10),
                Text("Select Category", style: CustomTextStyle.fieldLabelStyle),

                const Text(
                  "*",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            DropdownButtonFormField<String>(
              hint: Text("data"),

              style: CustomTextStyle.fieldFormStyle,
              decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: Icon(Icons.arrow_drop_down),
                ),
              ),
              dropdownColor: Colors.white,
              items: newsCategories.map((category) {
                return DropdownMenuItem<String>(
                  value: category,

                  child: Text(category),
                );
              }).toList(),
              onChanged: (value) {
                setState(() => selectedCategory = value);
              },
            ),
          ],
        ).padSymmetric(horizontal: 20.w),
      ),
    );
  }
}
