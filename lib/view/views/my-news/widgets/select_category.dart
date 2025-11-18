
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/theme/custom_text_style.dart';
import 'package:newsy/core/utils/constants.dart';
import 'package:newsy/core/utils/constants/text_strings.dart';
import 'package:newsy/core/utils/helpers/helper_function.dart';
import 'package:newsy/view/widgets/texts/text_field_title.dart';

class SelectCategory extends StatelessWidget {
  final Function(String?) onChanged;
  final bool isFieldEmpty;
  const SelectCategory({
    super.key,
    required this.onChanged,
    required this.isFieldEmpty,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = HelperFunction.isDarkMode(context);
    return Column(
      children: [
        TextFieldTitle(label: TextStrings.selectCategory),
        const SizedBox(height: 5),

        /// category dropdown
        DropdownButtonFormField<String>(
          style: CustomTextStyle.textFormFieldStyle.copyWith(
            color: isDark ? Colorr.light : Colorr.textPrimary,
          ),
          decoration: InputDecoration(
            enabledBorder: isDark
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.r),
                    borderSide: BorderSide(
                      color: isFieldEmpty
                          ? Colors.transparent
                          : Colorr.primaryColor[400]!,
                      width: 2.w,
                    ),
                  )
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.r),
                    borderSide: BorderSide(
                      color: isFieldEmpty
                          ? Colors.grey.shade200
                          : Colorr.primaryColor[400]!,
                      width: isFieldEmpty ? 1.5.w : 2.w,
                    ),
                  ),
            hintText: TextStrings.selectCategory,
            suffixIcon: Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: Icon(Icons.arrow_drop_down),
            ),
          ),
          dropdownColor: isDark ? Colorr.darkSurface : Colors.white,
          items: newsCategories.map((category) {
            return DropdownMenuItem<String>(
              value: category,

              child: Text(category),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
