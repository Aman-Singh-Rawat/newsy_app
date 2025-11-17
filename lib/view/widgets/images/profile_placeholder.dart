import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/utils/constants/image_strings.dart';

class ProfilePlaceholder extends StatelessWidget {
  final ImageSource source;
  final File? selectedImage;
  final VoidCallback pickImage;

  const ProfilePlaceholder({
    super.key,
    required this.source,
    this.selectedImage,
    required this.pickImage,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 80.w,
          backgroundColor: Colors.transparent,
          backgroundImage: selectedImage != null
              ? FileImage(selectedImage!)
              : AssetImage(ImageStrings.imgProfilePlaceholder),
        ),

        Positioned(
          bottom: 0,
          right: 0,
          child: InkWell(
            onTap: pickImage,
            borderRadius: BorderRadius.circular(35.r),
            child: Container(
              height: 35.h,
              width: 35.w,
              decoration: BoxDecoration(
                color: Colorr.primaryColor[400],
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.edit, color: Colors.white, size: 18.sp),
            ),
          ),
        ),
      ],
    );
  }
}
