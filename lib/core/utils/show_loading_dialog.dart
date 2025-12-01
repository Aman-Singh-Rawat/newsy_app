import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:newsy/app/config/app_colors.dart';

Future<void> showLoadingDialog(BuildContext ctx) {
  return showDialog(
    context: ctx,
    barrierDismissible: false,
    builder: (context) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SpinKitCircle(color: Colorr.primary, size: 60.w),
            const SizedBox(height: 12),
            Material(
              color: Colors.transparent,
              child: Text(
                'Loading...',
                style: TextStyle(
                  color: Colorr.light,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
