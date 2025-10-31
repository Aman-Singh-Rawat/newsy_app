import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:newsy/core/theme/app_colors.dart';

class ChooseTopicWidget extends StatefulWidget {
  final Map<String, String> newsTopic;

  const ChooseTopicWidget({super.key, required this.newsTopic});

  @override
  State<ChooseTopicWidget> createState() => _ChooseTopicWidgetState();
}

class _ChooseTopicWidgetState extends State<ChooseTopicWidget> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => setState(() => _isSelected = !_isSelected),
          child: Container(
            width: double.infinity,
            height: 130.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.r),
              border: _isSelected
                  ? Border.all(color: Colorr.primaryColor[400]!, width: 2.5.w)
                  : null,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25.r),
              clipBehavior: Clip.hardEdge,
              child: Image.network(
                widget.newsTopic["imageUrl"] as String,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        Positioned(
          bottom: 20.h,
          left: 10.w,
          child: Text(
            widget.newsTopic["topic"] as String,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),

        // checkbox
        Positioned(
          top: 5.h,
          right: 5.w,
          child: Checkbox(
            value: _isSelected,

            activeColor: Colorr.primaryColor[400],
            fillColor: WidgetStatePropertyAll(
              _isSelected ? Colorr.primaryColor[400] : Colors.white,
            ),
            onChanged: (value) => setState(() => _isSelected = value!),
          ),
        ),
      ],
    );
  }
}
