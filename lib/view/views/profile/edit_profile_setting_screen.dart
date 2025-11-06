import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/view/widgets/appbar/appbar.dart';
import 'package:newsy/view/widgets/custom_btn.dart';
import 'package:newsy/view/widgets/text_field_with_label_widget.dart';

class EditProfileSettingScreen extends StatefulWidget {
  const EditProfileSettingScreen({super.key});

  @override
  State<EditProfileSettingScreen> createState() =>
      _EditProfileSettingScreenState();
}

class _EditProfileSettingScreenState extends State<EditProfileSettingScreen> {
  late TextEditingController fullNameController;
  late TextEditingController userNameController;
  late TextEditingController emailController;
  late TextEditingController aboutController;
  late TextEditingController websiteController;

  @override
  void initState() {
    fullNameController = TextEditingController();
    userNameController = TextEditingController();
    emailController = TextEditingController();
    aboutController = TextEditingController();
    websiteController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    userNameController.dispose();
    emailController.dispose();
    aboutController.dispose();
    websiteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(title: "Edit Profile"),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Column(
            children: [
              //ProfilePlaceholder(),
              Divider(
                color: Colors.grey.shade100,
              ).padOnly(top: 15.h, bottom: 20.h),
              CustomTextFieldWithLabel(
                label: "Full Name",
                hint: "Full Name ",
                controller: fullNameController,
              ),
              SizedBox(height: 20.h),
              CustomTextFieldWithLabel(
                label: "Username",
                hint: "Username",
                controller: userNameController,
              ),
              SizedBox(height: 20.h),
              CustomTextFieldWithLabel(
                label: "Email",
                hint: "Email",
                suffixIcon: Icons.email_rounded,
                controller: emailController,
              ),
              SizedBox(height: 20.h),
              CustomTextFieldWithLabel(
                label: "About",
                hint: "About",
                isRequired: false,
                controller: aboutController,
              ),
              SizedBox(height: 20.h),
              CustomTextFieldWithLabel(
                label: "Website",
                hint: "Website",
                isRequired: false,
                suffixIcon: Icons.language,
                textInputAction: TextInputAction.done,
                controller: websiteController,
              ),

              SizedBox(height: 25.h),

              CustomBtn(
                color: Colorr.primaryColor[400]!.withOpacity(0.9),
                btnText: "Save Changes",
                onTap: () {},
              ),
              SizedBox(height: 20.h),
            ],
          ).marginSymmetric(horizontal: 20.w),
        ),
      ),
    );
  }
}
