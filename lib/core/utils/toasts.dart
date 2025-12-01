import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/app/config/app_colors.dart';
import 'package:toastification/toastification.dart';

class Toasts {
  static ToastificationItem successToast({required String msg}) =>
      Toastification().show(
        style: ToastificationStyle.minimal,
        type: ToastificationType.success,
        title: Text(
          msg,
          maxLines: 5,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
        ),
        autoCloseDuration: const Duration(seconds: 3),
        primaryColor: Colorr.successColor,
        showProgressBar: false,
      );

  static ToastificationItem errorToast({required String err}) =>
      Toastification().show(
        style: ToastificationStyle.minimal,
        type: ToastificationType.error,
        title: Text(
          err,
          maxLines: 5,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
        ),
        autoCloseDuration: const Duration(seconds: 3),
        primaryColor: Colorr.dangerColor,
        showProgressBar: false,
      );

  static ToastificationItem warningToast({required String waring}) =>
      Toastification().show(
        style: ToastificationStyle.minimal,
        type: ToastificationType.warning,
        title: Text(
          waring,
          maxLines: 5,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
        ),
        autoCloseDuration: const Duration(seconds: 3),
        primaryColor: Colorr.warningColor,
        showProgressBar: false,
      );
}
