import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/app/config/app_colors.dart';

class TextContainer extends StatelessWidget {
  final Color color;
  final Border? border;
  final Widget? child;
  final EdgeInsets padding;
  const TextContainer({
    super.key,
    this.color = Colorr.primary,
    this.border,
    this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 6.5),
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: BoxDecoration(
        color: color,
        border: border,
        borderRadius: BorderRadius.all(Radius.circular(20.r)),
      ),
      padding: padding,
      duration: const Duration(microseconds: 200),
      child: child,
    );
  }
}
