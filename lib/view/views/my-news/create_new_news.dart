import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/theme/custom_text_style.dart';
import 'package:newsy/core/utils/assets.dart';
import 'package:newsy/core/utils/constants.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/view/widgets/btn_with_bg.dart';
import 'package:newsy/view/widgets/custom_app_bar.dart';
import 'package:newsy/view/widgets/custom_btn.dart';
import 'package:newsy/view/widgets/html_editor.dart';
import 'package:newsy/view/widgets/text_field_with_label_widget.dart';

class CreateNewNews extends StatefulWidget {
  const CreateNewNews({super.key});

  @override
  State<CreateNewNews> createState() => _CreateNewNewsState();
}

class _CreateNewNewsState extends State<CreateNewNews> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController chipController = TextEditingController();
  final List<String> chipList = [];
  String? selectedCategory = "Politics";

  Widget bottomButton({IconData? icon, String? imagePath}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Colorr.primaryColor[50],
      ),
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
      child: icon == null
          ? SvgPicture.asset(imagePath!, width: 30.w, height: 30.h)
          : Icon(icon, color: Colorr.primaryColor[400], size: 27.w),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: getAppBar(title: "Create New News", context: context),
      body: SafeArea(
        child: SingleChildScrollView(
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
                  Text(
                    "Select Category",
                    style: CustomTextStyle.fieldLabelStyle,
                  ),

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
              SizedBox(height: 20.h),
              Row(
                children: [
                  const SizedBox(width: 10),
                  Text(
                    "Add News/Article",
                    style: CustomTextStyle.fieldLabelStyle,
                  ),

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
              Container(
                height: 300,
                margin: EdgeInsets.only(top: 6, bottom: 20.h),
                child: MyHtmlEditor(),
              ),

              Row(
                children: [
                  const SizedBox(width: 10),
                  Text("Add Tag", style: CustomTextStyle.fieldLabelStyle),

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

              TextFormField(
                controller: chipController,
                onFieldSubmitted: (value) {
                  setState(() {
                    chipList.add(value);
                    chipController.clear();
                  });
                },
              ).padOnly(top: 6.h, bottom: 20.h),

              Wrap(
                spacing: 10.w,
                children: chipList.map((chipItem) {
                  return Chip(
                    label: Text(
                      chipItem,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    deleteIcon: Icon(
                      Icons.cancel_outlined,
                      color: Colors.white,
                    ),
                    chipAnimationStyle: ChipAnimationStyle(
                      enableAnimation: AnimationStyle(
                        duration: const Duration(milliseconds: 300),
                      ),
                    ),
                    onDeleted: () {
                      setState(() {
                        chipList.remove(chipItem);
                      });
                    },
                    color: WidgetStatePropertyAll(Colorr.primaryColor[400]),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Colorr.primaryColor[400]!),
                    ),
                  );
                }).toList(),
              ),

              if (chipList.isNotEmpty) SizedBox(height: 20.h),
            ],
          ).padSymmetric(horizontal: 20.w),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.r),
            topRight: Radius.circular(25.r),
          ),
          border: Border.symmetric(
            horizontal: BorderSide(width: 1.5, color: Colors.grey.shade200),
          ),
        ),
        child: Row(
          children: [
            bottomButton(imagePath: Assets.icSave),
            SizedBox(width: 10.w),
            bottomButton(icon: Icons.calendar_today),
            SizedBox(width: 10.w),
            Expanded(
              child: CustomBtn(
                color: Colorr.primaryColor[400]!,
                btnText: "Publish Now",
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
