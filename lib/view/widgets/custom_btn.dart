import 'package:flutter/material.dart';
import 'package:newsy/core/theme/app_colors.dart';

class CustomBtn extends StatelessWidget {
  final Color color;
  final String btnText;
  final VoidCallback onTap;
  final double width;
  final double height;

  const CustomBtn({
    super.key,
    required this.color,
    required this.btnText,
    required this.onTap,
    this.width = double.infinity,
    this.height = 47,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            btnText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
