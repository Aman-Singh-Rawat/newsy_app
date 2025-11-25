import 'package:flutter/material.dart';
 
import 'package:newsy/app/config/app_colors.dart';

class ScreenTitleText extends StatelessWidget {
  final String title;
  final VoidCallback? onClick;
  const ScreenTitleText({required this.title, this.onClick, super.key});

  @override Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.w600
          )
        ),

        if (onClick != null)
        GestureDetector(
          onTap: onClick,
          child: Text(
            "See all",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colorr.primaryColor[400],
            ),
          ),
        ),
      ],
    );
  }
}
