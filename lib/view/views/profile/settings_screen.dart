import 'package:flutter/material.dart';
import 'package:newsy/view/widgets/custom_app_bar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: "Settings", context: context),
    );
  }
}
