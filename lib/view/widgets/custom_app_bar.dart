import 'package:flutter/material.dart';

AppBar getAppBar({required String title}) {
  return AppBar(
    leading: Icon(Icons.arrow_back_rounded),
    title: Text(title),
  );
}