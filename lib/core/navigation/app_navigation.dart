import 'package:flutter/material.dart';

class AppNavigator {
  // Push a new screen (keeps old screens)
  static void push(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  // Replace the current screen
  static void pushReplacement(BuildContext context, Widget page) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  // Remove all previous screens and go to new screen
  static void pushAndRemoveAll(BuildContext context, Widget page) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => page),
      (route) => false, 
    );
  }

  // Pop the current screen
  static void pop(BuildContext context) {
    Navigator.pop(context);
  }
}
