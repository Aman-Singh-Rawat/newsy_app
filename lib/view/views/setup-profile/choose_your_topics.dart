import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/navigation/app_navigation.dart';
import 'package:newsy/core/utils/constants.dart';
import 'package:newsy/core/utils/constants/text_strings.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/view/views/setup-profile/choose_your_news_sources.dart';
import 'package:newsy/view/widgets/appbar/appbar.dart';
import 'package:newsy/view/widgets/choose_topic_widget.dart';
import 'package:newsy/view/widgets/searchview/search_view_widget.dart';

import '../../widgets/bottom_navigation_btn.dart';

class ChooseYourTopics extends StatefulWidget {
  const ChooseYourTopics({super.key});

  @override
  State<ChooseYourTopics> createState() => _ChooseYourTopicsState();
}

class _ChooseYourTopicsState extends State<ChooseYourTopics> {
  final TextEditingController _searchController = TextEditingController();
  late List<Map<String, String>> _filteredList;
  final List<String> _selectedCategoryList = [];

  void _handleTopicSelection(int index) {
    final selectedItemName = _filteredList[index]["topic"] as String;

    setState(() {
      if (_selectedCategoryList.contains(selectedItemName)) {
        _selectedCategoryList.remove(selectedItemName);
      } else {
        _selectedCategoryList.add(selectedItemName);
      }
    });
  }

  @override
  void initState() {
    super.initState();

    _filteredList = newsTopics;

    _searchController.addListener(() {
      final searchText = _searchController.text.trim().toLowerCase();

      setState(() {
        if (searchText.isEmpty) {
          _filteredList = newsTopics;
        } else {
          _filteredList = newsTopics.where((topic) {
            final name = topic["topic"]?.toLowerCase() ?? '';
            return name.contains(searchText);
          }).toList();
        }
      });
    });
  }

  void _handleSearchClearBtnClick() {
    if (_searchController.text.trim().isNotEmpty) {
      setState(() => _searchController.text = "");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: TextStrings.chooseYourTopics),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 12.h),
              SearchViewWidget(
                isFieldEmpty: _searchController.text.trim().isEmpty,
                controller: _searchController,
                onButtonClick: _handleSearchClearBtnClick,
              ),

              SizedBox(height: 15.h),

              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _filteredList.length,
                itemBuilder: (context, index) => ChooseTopicWidget(
                  newsTopic: _filteredList[index],
                  isSelected: _selectedCategoryList.contains(
                    _filteredList[index]["topic"] as String,
                  ),
                  onTap: () => _handleTopicSelection(index),
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.w,
                  mainAxisExtent: 140.h,
                  mainAxisSpacing: 16.h,
                ),
              ),

              SizedBox(height: 10.h),
            ],
          ).marginSymmetric(horizontal: 20.w),
        ),
      ),
      bottomNavigationBar: BottomNavigationItemBg(
        child: ElevatedButton(
          onPressed: _selectedCategoryList.isNotEmpty
              ? () => AppNavigator.push(context, const ChooseYourNewsSources())
              : null,
          child: Text(TextStrings.next),
        ),
      ),
    );
  }
}
