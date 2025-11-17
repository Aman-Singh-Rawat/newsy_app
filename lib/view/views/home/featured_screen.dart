import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/view/widgets/appbar/appbar.dart';
import 'package:newsy/view/widgets/buttons/btn_with_bg.dart';
import 'package:newsy/view/widgets/featured_widget.dart';

class FeaturedScreen extends StatelessWidget {
  const FeaturedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Featured News',
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
