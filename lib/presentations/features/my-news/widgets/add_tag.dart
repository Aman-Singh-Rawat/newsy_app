import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:newsy/app/config/app_colors.dart';
import 'package:newsy/app/constants/text_strings.dart';
import 'package:newsy/core/utils/extensions.dart';
import 'package:newsy/presentations/common_widgets/textfield/custom_text_field.dart';
import 'package:newsy/presentations/common_widgets/texts/text_field_title.dart';

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
