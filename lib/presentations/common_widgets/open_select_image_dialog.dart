import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newsy/app/config/app_colors.dart';

void openSelectingImageTypeDialog({
  required BuildContext context,
  required bool isDark,
  required Function(ImageSource) onTextClick,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: isDark ? Colorr.darkSurface : Colorr.light,
        actions: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width - 20,
            child: Column(
              children: [
                Divider(
                  color: isDark ? Colorr.darkDivider : Colors.grey.shade100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      onPressed: () => onTextClick(ImageSource.camera),
                      label: Text(
                        "Camera",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      icon: const Icon(Icons.camera, size: 28),
                    ),
                    TextButton.icon(
                      onPressed: () => onTextClick(ImageSource.gallery),
                      label: Text(
                        "Gallery",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      icon: const Icon(Icons.photo, size: 28),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
        title: Text(
          "Choose Image",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      );
    },
  );
}
