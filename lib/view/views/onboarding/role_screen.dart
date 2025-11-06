import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/navigation/app_navigation.dart';
import 'package:newsy/core/utils/constants/text_strings.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/core/utils/helpers/helper_function.dart';
import 'package:newsy/view/views/auth/auth_screen.dart';
import 'package:newsy/view/widgets/appbar/appbar.dart';
import 'package:newsy/view/widgets/news_agency_widget.dart';

class RoleScreen extends StatefulWidget {
  const RoleScreen({super.key});

  @override
  State<RoleScreen> createState() => _RoleScreenState();
}

class _RoleScreenState extends State<RoleScreen> {
  int _selectedItemIndex = 0;
  final List<Map<String, dynamic>> _roleDataList = [
    {
      "index": 0,
      'category': TextStrings.newsAgencyItemTitle1,
      'description': TextStrings.newsAgencyItemSubtitle1,
      'icon': Icons.business_center,
    },
    {
      "index": 1,
      'category': TextStrings.newsAgencyItemTitle2,
      'description': TextStrings.newsAgencyItemSubtitle2,
      'icon': Icons.person,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunction.isDarkMode(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: TextStrings.newsAgencyAppBarText,
        showBackArrow: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: 10),
          Text(
            TextStrings.newsAgencyTitle,
            style: Theme.of(context).textTheme.titleSmall,
          ),

          const SizedBox(height: 25),

          ..._roleDataList.asMap().entries.map((item) {
            return NewsAgencyWidget(
              isForgotPassword: false,
              isSelected: item.key == _selectedItemIndex,
              onClick: (selectedIndex) {
                setState(() => _selectedItemIndex = selectedIndex);
              },
              dataList: item.value,
            ).marginOnly(bottom: 15);
          }),

          Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () =>
                  AppNavigator.pushAndRemoveAll(context, const AuthScreen()),
              child: Text(TextStrings.continueText),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ).padSymmetric(horizontal: 20.w),
    );
  }
}
