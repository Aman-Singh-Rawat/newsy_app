import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:newsy/app/navigation/app_navigation.dart';
import 'package:newsy/app/config/app_colors.dart';
import 'package:newsy/app/constants/text_strings.dart';
import 'package:newsy/core/utils/extensions.dart';
import 'package:newsy/core/utils/helper_function.dart';
import 'package:newsy/presentations/common_widgets/open_select_image_dialog.dart';

class AddCoverPhotosWidget extends StatefulWidget {
  const AddCoverPhotosWidget({super.key});

  @override
  State<AddCoverPhotosWidget> createState() => _AddCoverPhotosWidgetState();
}

class _AddCoverPhotosWidgetState extends State<AddCoverPhotosWidget> {
  File? _selectedImage;

  Future<void> _pickImage(ImageSource source) async {
    AppNavigator.pop(context);

    final XFile? pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      setState(() => _selectedImage = File(pickedFile.path));
    }
  }

  Stack _buildImageState(BuildContext context, bool isDark) {
    return Stack(
      children: [
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Image.file(
              _selectedImage!,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: () => openSelectingImageTypeDialog(
              context: context,
              onTextClick: _pickImage,
              isDark: isDark,
            ),
            child: Container(
              width: 60.w,
              height: 55.h,
              decoration: BoxDecoration(
                color: Colorr.primary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  bottomRight: Radius.circular(20.r),
                ),
              ),
              child: const Center(
                child: Icon(Icons.edit, size: 30, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Column _buildEmptyState(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.add, color: Colorr.primaryColor[400], size: 24),
        SizedBox(height: 5.0.h),
        Text(
          TextStrings.addCoverPhotos,
          style: TextStyle(
            color: isDark ? Colorr.slateGrey : Colors.grey,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = HelperFunction.isDarkMode(context);

    return GestureDetector(
      onTap: _selectedImage == null
          ? () => openSelectingImageTypeDialog(
              context: context,
              onTextClick: _pickImage,
              isDark: isDark,
            )
          : null,
      child: AspectRatio(
        aspectRatio: _selectedImage == null ? 16 / 7.8 : 4 / 3.3,
        child: Container(
          decoration: BoxDecoration(
            border: _selectedImage == null
                ? DashedBorder.fromBorderSide(
                    dashLength: 10,
                    side: BorderSide(
                      color: isDark
                          ? Colorr.borderCharcoalGrey
                          : Colors.grey.shade400,
                      width: 1.5,
                    ),
                  )
                : null,
            color: isDark
                ? Colorr.darkSurface
                : Colors.grey.shade100.withOpacity(0.6),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: _selectedImage == null
              ? _buildEmptyState(isDark)
              : _buildImageState(context, isDark),
        ),
      ).padOnly(top: 10.h),
    );
  }
}
