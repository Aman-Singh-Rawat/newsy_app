import 'package:flutter/material.dart';
import 'package:newsy/app/config/app_colors.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ImageShimmer extends StatelessWidget {
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;

  const ImageShimmer({super.key, this.width, this.height, this.borderRadius});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Shimmer(
      duration: const Duration(milliseconds: 1500),
      interval: Duration.zero,
      enabled: true,

      color: isDark ? Colors.white : Colors.black,
      colorOpacity: isDark ? 0.15 : 0.08,

      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(12),
          color: isDark
              ? Colorr.light.withOpacity(0.08)
              : Colorr.darkBackground.withOpacity(0.05),
        ),
      ),
    );
  }
}
