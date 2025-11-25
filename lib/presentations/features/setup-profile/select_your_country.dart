import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/app/navigation/app_navigation.dart';
import 'package:newsy/app/constants/constants.dart';
import 'package:newsy/app/constants/text_strings.dart';
import 'package:newsy/core/utils/extensions.dart';
import 'package:newsy/presentations/features/setup-profile/choose_your_topics.dart';
import 'package:newsy/presentations/common_widgets/appbar/appbar.dart';
import 'package:newsy/presentations/common_widgets/bottom_navigation_btn.dart';
import 'package:newsy/presentations/common_widgets/searchview/search_view_widget.dart';
import 'package:newsy/presentations/common_widgets/select_your_widget.dart';

class SelectYourCountry extends StatefulWidget {
  const SelectYourCountry({super.key});

  @override
  State<SelectYourCountry> createState() => _SelectYourCountryState();
}

class _SelectYourCountryState extends State<SelectYourCountry> {
  String selectedItemCode = "";
  final _searchController = TextEditingController();
  late List<Map<String, String>> filteredList;

  @override
  void initState() {
    super.initState();

    filteredList = countries;

    _searchController.addListener(() {
      final searchText = _searchController.text.trim().toLowerCase();

      setState(() {
        if (searchText.isEmpty) {
          filteredList = countries;
        } else {
          filteredList = countries.where((country) {
            final name = country["name"]?.toLowerCase() ?? '';
            final code = country["code"]?.toLowerCase() ?? '';
            return name.contains(searchText) || code.contains(searchText);
          }).toList();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: false,
        title: TextStrings.selectYourCountry,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.h),
            SearchViewWidget(
              isFieldEmpty: _searchController.text.trim().isEmpty,
              controller: _searchController,
              onButtonClick: () {
                _searchController.text = "";
              },
            ),

            SizedBox(height: 20.h),

            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => SizedBox(height: 10.h),
              itemBuilder: (context, index) => SelectYourWidget(
                country: filteredList[index],
                isSelected: selectedItemCode == filteredList[index]["code"],
                onTap: (String itemCode) =>
                    setState(() => selectedItemCode = itemCode),
              ),
              itemCount: filteredList.length,
            ),
          ],
        ),
      ).padSymmetric(horizontal: 20.w),
      bottomNavigationBar: BottomNavigationItemBg(
        child: ElevatedButton(
          onPressed: selectedItemCode.isNotEmpty
              ? () => AppNavigator.push(context, const ChooseYourTopics())
              : null,
          child: Text(TextStrings.next),
        ),
      ),
    );
  }
}
