import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/theme/custom_text_style.dart';
import 'package:newsy/core/utils/constants/image_strings.dart';
import 'package:newsy/core/utils/constants.dart';
import 'package:newsy/core/utils/constants/text_strings.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/core/utils/helpers/helper_function.dart';
import 'package:newsy/view/views/my-news/widgets/add_cover_photos_widget.dart';
import 'package:newsy/view/widgets/appbar/appbar.dart';
import 'package:newsy/view/widgets/bottom_navigation_btn.dart';
import 'package:newsy/view/widgets/buttons/create_news_bottom_Btn_background.dart';
import 'package:newsy/view/widgets/custom_btn.dart';
import 'package:newsy/view/widgets/html_editor.dart';
import 'package:newsy/view/widgets/text_field_with_label_widget.dart';
import 'package:newsy/view/widgets/textfield/custom_text_field.dart';
import 'package:newsy/view/widgets/texts/screen_title_text.dart';
import 'package:newsy/view/widgets/texts/text_field_title.dart';

class AddTag extends StatefulWidget {
  final TextEditingController chipController;
  final bool isFieldEmpty;

  const AddTag({
    super.key,
    required this.chipController,
    this.isFieldEmpty = false,
  });

  @override
  State<AddTag> createState() => _AddTagState();
}

class _AddTagState extends State<AddTag> {
  final List<String> chipList = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldTitle(label: TextStrings.addTag),

        CustomTextField(
          controller: widget.chipController,
          isFieldEmpty: widget.isFieldEmpty,
          textInputAction: TextInputAction.done,
          isFieldTypePassword: false,
          hintText: TextStrings.addTag,
          onFieldSubmitted: (value) {
            setState(() {
              chipList.add(value);
              widget.chipController.clear();
            });
          },
        ).padOnly(top: 6.h, bottom: chipList.isNotEmpty ? 12.h : 20.h),

        Wrap(
          spacing: 10.w,
          children: chipList.map((chipItem) {
            return Chip(
              label: Text(
                chipItem,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              deleteIcon: Icon(Icons.cancel_outlined, color: Colors.white),
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
    );
  }
}
