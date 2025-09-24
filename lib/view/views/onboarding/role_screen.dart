import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/view/views/auth/sign_up_screen.dart';
import 'package:newsy/view/widgets/custom_btn.dart';
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
      'category': 'News Agency',
      'description':
          'You will need further verification if you are a news agency company.',
      'icon': Icons.business_center,
    },
    {
      "index": 1,
      'category': 'Personal',
      'description':
          'Suitable for those of you who use this application to read news (you can still make your own news).',
      'icon': Icons.person,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_rounded),
        title: Text("Do You?"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: 10),
          Text(
            "Choose the role that best describes you right now, whether you're a news agency or a personal.",
            style: GoogleFonts.poppins(
              fontSize: 13,
              height: 1.5,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 25),

          ..._roleDataList.asMap().entries.map((item) {
            return NewsAgencyWidget(
              isSelected: item.key == _selectedItemIndex,
              onClick: (selectedIndex) {
                setState(() => _selectedItemIndex = selectedIndex);
              },
              roleDataList: item.value,
            ).marginOnly(bottom: 15);
          }),

          Spacer(),
          CustomBtn(
            color: Colorr.primaryColor[400]!,
            btnText: "Continue",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AuthScreen()),
              );
            },
          ),
          const SizedBox(height: 20),
        ],
      ).padSymmetric(horizontal: 20.w),
    );
  }
}
