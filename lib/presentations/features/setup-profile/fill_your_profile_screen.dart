import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newsy/app/navigation/app_navigation.dart';
import 'package:newsy/app/constants/text_strings.dart';
import 'package:newsy/core/utils/extensions.dart';
import 'package:newsy/core/utils/helper_function.dart';
import 'package:newsy/presentations/common_widgets/appbar/appbar.dart';
import 'package:newsy/presentations/common_widgets/bottom_navigation_btn.dart';
import 'package:newsy/presentations/common_widgets/open_select_image_dialog.dart';
import 'package:newsy/presentations/common_widgets/images/profile_placeholder.dart';
import 'package:newsy/presentations/common_widgets/show_account_created_dialog.dart';
import 'package:newsy/presentations/common_widgets/text_field_with_label_widget.dart';

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
  File? _selectedImage;

  bool get _isFieldsEmpty {
    if (_usernameController.text.trim().toString().isEmpty ||
        _fullNameController.text.trim().toString().isEmpty ||
        _emailController.text.trim().toString().isEmpty ||
        _phoneController.text.trim().toString().isEmpty) {
      return true;
    }
    return false;
  }

  Future<void> _pickImage(ImageSource source) async {
    AppNavigator.pop(context);
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  void initState() {
    _usernameController.addListener(() => setState(() {}));
    _fullNameController.addListener(() => setState(() {}));
    _emailController.addListener(() => setState(() {}));
    _phoneController.addListener(() => setState(() {}));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = HelperFunction.isDarkMode(context);

    return Scaffold(
      appBar: CustomAppBar(title: TextStrings.fillYourProfile),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              SizedBox(height: 15.h),
              ProfilePlaceholder(
                source: ImageSource.gallery,
                pickImage: () => openSelectingImageTypeDialog(
                  context: context,
                  onTextClick: _pickImage,
                  isDark: isDark,
                ),
                selectedImage: _selectedImage,
              ),

              SizedBox(height: 25.h),

              CustomTextFieldWithLabel(
                label: TextStrings.userName,
                hint: TextStrings.userName,
                isPassword: false,
                controller: _usernameController,
              ),

              SizedBox(height: 20.h),

              CustomTextFieldWithLabel(
                label: TextStrings.fullName,
                hint: TextStrings.fullName,
                isPassword: false,
                controller: _fullNameController,
              ),

              SizedBox(height: 20.h),

              CustomTextFieldWithLabel(
                label: TextStrings.email,
                hint: TextStrings.email,
                isPassword: false,
                suffixIcon: Icons.email,
                controller: _emailController,
              ),

              SizedBox(height: 20.h),

              CustomTextFieldWithLabel(
                label: TextStrings.phoneNumber,
                hint: TextStrings.phoneNumber,
                isPassword: false,
                suffixIcon: Icons.phone,
                controller: _phoneController,
                textInputAction: TextInputAction.done,
              ),

              SizedBox(height: 10.h),
            ],
          ).marginSymmetric(horizontal: 20.w),
        ),
      ),
      bottomNavigationBar: BottomNavigationItemBg(
        child: ElevatedButton(
          onPressed: _isFieldsEmpty
              ? null
              : () => showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) =>
                      showAccountCreatedDialog(context: context),
                ),
          child: Text(TextStrings.continueText),
        ),
      ),
    );
  }
}
