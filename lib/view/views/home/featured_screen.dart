import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/view/widgets/btn_with_bg.dart';
import 'package:newsy/view/widgets/custom_app_bar.dart';
import 'package:newsy/view/widgets/featured_widget.dart';

class FeaturedScreen extends StatelessWidget {
  const FeaturedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        title: 'Featured News',
        context: context,
        actions: [BtnWithBg(icon: Icons.more_vert_rounded)],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) =>
            FeaturedWidget().padOnly(bottom: 16.h, top: index == 0 ? 13.h : 0),
        itemCount: 10,
      ).padSymmetric(horizontal: 20.w),
    );
  }
}
