import 'package:flutter/material.dart';
import 'package:newsy/view/widgets/custom_app_bar.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        title: "Notification",
        context: context,
        actions: [Icon(Icons.more_vert_rounded)],
      ),
    );
  }
}
