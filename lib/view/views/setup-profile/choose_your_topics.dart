import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/view/views/setup-profile/fill_your_profile_screen.dart';
import 'package:newsy/view/widgets/choose_topic_widget.dart';
import 'package:newsy/view/widgets/custom_app_bar.dart';
import 'package:newsy/view/widgets/search_view_widget.dart';

import '../../../core/theme/app_colors.dart';
import '../../widgets/bottom_navigation_btn.dart';

class ChooseYourTopics extends StatefulWidget {
  const ChooseYourTopics({super.key});

  @override
  State<ChooseYourTopics> createState() => _ChooseYourTopicsState();
}

class _ChooseYourTopicsState extends State<ChooseYourTopics> {
  final List<Map<String, String>> newsTopics = [
    {
      'topic': 'Technology',
      'imageUrl':
          'https://images.unsplash.com/photo-1485827404703-89b55fcc595e?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    },
    {
      'topic': 'Sports',
      'imageUrl':
          'https://images.unsplash.com/photo-1461896836934-ffe607ba8211?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    },
    {
      'topic': 'Business',
      'imageUrl':
          'https://images.unsplash.com/photo-1444653614773-995cb1ef9efa?q=80&w=1176&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    },
    {
      'topic': 'Entertainment',
      'imageUrl':
          'https://images.unsplash.com/photo-1603190287605-e6ade32fa852?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    },
    {
      'topic': 'Health',
      'imageUrl':
          'https://plus.unsplash.com/premium_photo-1669446008968-f7a3e88da218?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    },
    {
      'topic': 'Science',
      'imageUrl':
          'https://plus.unsplash.com/premium_photo-1661436689263-e40739ea8bc2?q=80&w=1172&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    },
    {
      'topic': 'Politics',
      'imageUrl':
          'https://images.unsplash.com/photo-1541872703-74c5e44368f9?q=80&w=1106&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    },
    {
      'topic': 'Art',
      'imageUrl':
          'https://images.unsplash.com/flagged/photo-1572392640988-ba48d1a74457?q=80&w=764&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    },
  ];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    _searchController.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: "Choose Your Topics", context: context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10.h),
              SearchViewWidget(
                isFieldEmpty: _searchController.text.trim().isEmpty,
                controller: _searchController,
                onButtonClick: () {}
              ),

              SizedBox(height: 15.h),

              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: newsTopics.length,
                itemBuilder: (context, index) =>
                    ChooseTopicWidget(newsTopic: newsTopics[index]),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
              ),

              SizedBox(height: 10.h),
            ],
          ).marginSymmetric(horizontal: 20.w),
        ),
      ),
      bottomNavigationBar: BottomNavigationBtn(
        btnText: "Next",
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => FillYourProfileScreen()),
          );
        },
      ),
    );
  }
}
