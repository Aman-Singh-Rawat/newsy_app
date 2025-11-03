import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/utils/constants/text_strings.dart';


class RememberMeWidget extends StatelessWidget {
  final bool isRememberMe;
  final ValueChanged<bool?> onChanged;

  const RememberMeWidget({
    super.key,
    required this.isRememberMe,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(value: isRememberMe, onChanged: onChanged),

        Text(
          TextStrings.rememberMe,
          style: Theme.of(
            context,
          ).textTheme.displaySmall!.copyWith(fontSize: 12.sp),
        ),
      ],
    );
  }
}
