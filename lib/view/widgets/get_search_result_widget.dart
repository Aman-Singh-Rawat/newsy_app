import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/utils/constants/text_strings.dart';
import 'package:newsy/core/utils/extension.dart';

class GetSearchResultWidget extends StatelessWidget {
  const GetSearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          TextStrings.searchResults,
          style: Theme.of(
            context,
          ).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w500),
        ),

        Text(
          "0 found",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colorr.primaryColor[400],
          ),
        ),
      ],
    ).padSymmetric(horizontal: 20.w);
  }
}
