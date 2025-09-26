import 'package:flutter/material.dart';

AppBar getAppBar({required String title, required BuildContext context}) {
  return AppBar(
    leading: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back_rounded)),
    title: Text(title),
  );
} 