import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialStatsWidget extends StatelessWidget {
  final String category;
  final String value;
  const SocialStatsWidget({
    super.key,
    required this.category,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          value,
          maxLines: 1,
          style: Theme.of(context).textTheme.headlineMedium,
        ),

        SizedBox(height: 6.h),

        Text(
          category,
          maxLines: 1,
          style: Theme.of(
            context,
          ).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
