import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/view/widgets/custom_app_bar.dart';
import 'package:newsy/view/widgets/custom_btn.dart';
import 'package:newsy/view/widgets/text_field_with_label_widget.dart';

class ContactUsSettingScreen extends StatefulWidget {
  const ContactUsSettingScreen({super.key});

  @override
  State<ContactUsSettingScreen> createState() => _ContactUsSettingScreenState();
}

class _ContactUsSettingScreenState extends State<ContactUsSettingScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: "Contact us", context: context),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Column(
            children: [
              CustomTextFieldWithLabel(
                label: "Full Name",
                hint: "e.g.Aman Singh",
                controller: _nameController,
              ),

              SizedBox(height: 20.h),

              CustomTextFieldWithLabel(
                label: "Email",
                hint: "e.g.amanrawat6767@gmail.com",
                suffixIcon: Icons.mail,
                controller: _emailController,
              ),

              SizedBox(height: 20.h),
              Row(
                children: [
                  Text(
                    "Message",
                    style: GoogleFonts.poppins(
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                      fontSize: 13.sp,
                    ),
                  ),

                  const Text(
                    "*",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                    ),
                  ),

                  Spacer(),

                  Text(
                    "Max 250 words",
                    style: GoogleFonts.poppins(
                      color: Colors.black54,
                      fontWeight: FontWeight.w400,
                      fontSize: 13.sp,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              TextFormField(
                maxLines: 6,
                textInputAction: TextInputAction.done,
                style: GoogleFonts.poppins(
                  fontSize: 13.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
                maxLength: 250,
                controller: _messageController,
                decoration: InputDecoration(hintText: "Message"),
              ),

              Spacer(),

              CustomBtn(
                color: Colorr.primaryColor[400]!,
                btnText: "Send Message",
                onTap: () {},
                icon: Icons.send,
              ),

              SizedBox(height: 20.h),
            ],
          ).padSymmetric(horizontal: 20.w),
        ),
      ),
    );
  }
}
