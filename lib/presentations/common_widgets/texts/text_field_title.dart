import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/utils/helper_function.dart';

class TextFieldTitle extends StatelessWidget {
  const TextFieldTitle({
    super.key,
    required this.label,
    this.isRequired = true,
  });

  final String label;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    final bool isDark = HelperFunction.isDarkMode(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 10),
        Text(
          label,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),
        ),
        if (isRequired)
          Text(
            "*",
            style: TextStyle(
              color: isDark
                  ? Colors.redAccent.shade100.withOpacity(0.6)
                  : Colors.red,
              fontSize: 8.sp,
              height: 1.2.h,
              fontWeight: FontWeight.w900,
            ),
          ),
      ],
    );
  }
}
