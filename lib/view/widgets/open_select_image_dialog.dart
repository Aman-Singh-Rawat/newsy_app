import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void openSelectingImageTypeDialog({
  required BuildContext context,
  required Function(bool) isImageViaCamera,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        actions: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width - 20,
            child: Column(
              children: [
                Divider(color: Colors.grey.shade100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      onPressed: () => isImageViaCamera(true),
                      label: const Text(
                        "Camera",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      icon: const Icon(Icons.camera, size: 28),
                    ),
                    TextButton.icon(
                      onPressed: () => isImageViaCamera(false),
                      label: const Text(
                        "Gallery",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
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
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    },
  );
}
