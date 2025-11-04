import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/view/widgets/bottom_navigation_btn.dart';
import 'package:newsy/view/widgets/custom_app_bar.dart';
import 'package:newsy/view/widgets/profile_placeholder.dart';
import 'package:newsy/view/widgets/show_account_created_dialog.dart';
import 'package:newsy/view/widgets/text_field_with_label_widget.dart';

class FillYourProfileScreen extends StatefulWidget {
  const FillYourProfileScreen({super.key});

  @override
  State<FillYourProfileScreen> createState() => _FillYourProfileScreenState();
}

class _FillYourProfileScreenState extends State<FillYourProfileScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    _usernameController.addListener(() => setState(() {}));
    _fullNameController.addListener(() => setState(() {}));
    _emailController.addListener(() => setState(() {}));
    _phoneController.addListener(() => setState(() {}));

    super.initState();
  }

  bool get getIsFieldsEmpty {
    if (_usernameController.text.trim().toString().isEmpty ||
        _fullNameController.text.trim().toString().isEmpty ||
        _emailController.text.trim().toString().isEmpty ||
        _phoneController.text.trim().toString().isEmpty) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: getAppBar(title: "Fill Your Profile", context: context),
      body: Column(
        children: [
          SizedBox(height: 15.h),
          ProfilePlaceholder(),

          SizedBox(height: 25.h),

          CustomTextFieldWithLabel(
            label: "Username",
            hint: "Username",
            isPassword: false,
            controller: _usernameController,
          ),

          SizedBox(height: 20.h),

          CustomTextFieldWithLabel(
            label: "Full Name",
            hint: "fullname",
            isPassword: false,
            controller: _fullNameController,
          ),

          SizedBox(height: 20.h),

          CustomTextFieldWithLabel(
            label: "Email",
            hint: "Email",
            isPassword: false,
            suffixIcon: Icons.email,
            controller: _emailController,
          ),

          SizedBox(height: 20.h),

          CustomTextFieldWithLabel(
            label: "Phone Number",
            hint: "Phone Number",
            isPassword: false,
            suffixIcon: Icons.phone,
            controller: _phoneController,
          ),

          SizedBox(height: 10.h),
        ],
      ).marginSymmetric(horizontal: 20.w),
      bottomNavigationBar: BottomNavigationBtn(
        btnText: "Continue",
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => showAccountCreatedDialog(context: context),
          );
        },
      ),
    );
  }
}
