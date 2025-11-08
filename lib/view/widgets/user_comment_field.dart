import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/utils/constants/text_strings.dart';
import 'package:newsy/core/utils/helpers/helper_function.dart';

class UserCommentField extends StatelessWidget {
  const UserCommentField({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = HelperFunction.isDarkMode(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius: 23.r,
          backgroundImage: NetworkImage(
            "https://media.istockphoto.com/id/1326417862/photo/young-woman-laughing-while-relaxing-at-home.jpg?s=612x612&w=0&k=20&c=cd8e6RBGOe4b8a8vTcKW0Jo9JONv1bKSMTKcxaCra8c=",
          ),
        ),

        SizedBox(width: 10.w),

        Expanded(
          child: TextFormField(
            style: TextStyle(
              fontSize: 13.sp,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),

            decoration: InputDecoration(
              hintText: TextStrings.addACommentHintText,
              filled: isDark,
              fillColor: isDark ? Colorr.darkBackground : null,
            ),
          ),
        ),
      ],
    );
  }
}
