import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/navigation/app_navigation.dart';
import 'package:newsy/core/utils/constants.dart';
import 'package:newsy/core/utils/constants/text_strings.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/view/views/setup-profile/fill_your_profile_screen.dart';
import 'package:newsy/view/widgets/choose_your_news_widget.dart';

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
  late List<Map<String, String>> _filteredList;
  final List<String> _selectedSourceList = [];

  void _handleSearchClearBtnClick() {
    if (_searchController.text.trim().isNotEmpty) {
      setState(() => _searchController.text = "");
    }
  }

  void _handleNewsSourceSelection(int index) {
    final selectedItemName = _filteredList[index]["name"] as String;

    setState(() {
      if (_selectedSourceList.contains(selectedItemName)) {
        _selectedSourceList.remove(selectedItemName);
      } else {
        _selectedSourceList.add(selectedItemName);
      }
    });
  }

  @override
  void initState() {
    super.initState();

    _filteredList = newsChannels;

    _searchController.addListener(() {
      final searchText = _searchController.text.trim().toLowerCase();

      setState(() {
        if (searchText.isEmpty) {
          _filteredList = newsChannels;
        } else {
          _filteredList = newsChannels.where((channel) {
            final name = channel["name"]?.toLowerCase() ?? '';
            return name.contains(searchText);
          }).toList();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        title: TextStrings.chooseYourNewsSources,
        context: context,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 12.h),
              SearchViewWidget(
                controller: _searchController,
                isFieldEmpty: _searchController.text.trim().isEmpty,
                onButtonClick: _handleSearchClearBtnClick,
              ),

              SizedBox(height: 15.h),

              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _filteredList.length,
                itemBuilder: (context, index) => ChooseYourNewsWidget(
                  newsSource: _filteredList[index],
                  onTap: () => _handleNewsSourceSelection(index),
                  isSelected: _selectedSourceList.contains(
                    _filteredList[index]["name"] as String,
                  ),
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
      bottomNavigationBar: BottomNavigationBtn(
        btnText: TextStrings.next,
        onTap: _selectedSourceList.isNotEmpty
            ? () => AppNavigator.push(context, const FillYourProfileScreen())
            : null,
      ),
    );
  }
}
