import 'package:flutter/material.dart';

class FaqSettingScreen extends StatefulWidget {
  const FaqSettingScreen({super.key});

  @override
  State<FaqSettingScreen> createState() => _FaqSettingScreenState();
}

class _FaqSettingScreenState extends State<FaqSettingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}