import 'package:flutter/material.dart';

class MyNewsScreen extends StatelessWidget {
  const MyNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text("my news")),
    );
  }
}
