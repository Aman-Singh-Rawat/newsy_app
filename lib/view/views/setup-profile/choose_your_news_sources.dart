import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/utils/extension.dart';

import '../../../core/theme/app_colors.dart';
import '../../widgets/bottom_navigation_btn.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/search_view_widget.dart' show SearchViewWidget;

class ChooseYourNewsSources extends StatefulWidget {
  const ChooseYourNewsSources({super.key});

  @override
  State<ChooseYourNewsSources> createState() => _ChooseYourNewsSourcesState();
}

class _ChooseYourNewsSourcesState extends State<ChooseYourNewsSources> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: "Choose Your Topics",  context: context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10.h),
              SearchViewWidget(controller: _searchController,onButtonClick: (flag) {
                setState(() => flag ? _searchController.clear() : null);
              },),

              SizedBox(height: 15.h),

              /*GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: newsTopics.length,
                itemBuilder: (context, index) =>
                    ChooseTopicWidget(newsTopic: newsTopics[index]),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10
                ),
              ),*/
              SizedBox(height: 10.h),
            ],
          ).marginSymmetric(horizontal: 20.w),
        ),
      ),
      bottomNavigationBar: BottomNavigationBtn(
        btnColor: Colorr.primaryColor[400]!,
        btnText: "Next",
        onTap: () {},
      ),
    );
  }
}
