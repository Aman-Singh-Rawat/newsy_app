import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsy/core/utils/assets.dart';
import 'package:newsy/core/utils/extension.dart';

import '../../../core/theme/app_colors.dart';
import '../../widgets/custom_btn.dart';
import '../../widgets/remember_me_widget.dart';
import '../../widgets/text_field_with_label_widget.dart';
import 'congratulation_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool _isRememberMe = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _emailController.addListener(() => setState(() {}));
    _passwordController.addListener(() => setState(() {}));
    super.initState();
  }

  get _isFieldEmpty =>
      _emailController.text.trim().isEmpty ||
      _passwordController.text.trim().isEmpty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_rounded),
        ),
        title: Text("Reset Password"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              Assets.imgResetPassword,
              width: 300.w,
              height: 230.h,
              fit: BoxFit.cover,
            ),
            Text(
              "Create a new password",
              style: GoogleFonts.poppins(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),

            SizedBox(height: 22.h),

            /// new password field
            CustomTextFieldWithLabel(
              label: "New Password",
              hint: "New Password",
              isPassword: true,
              controller: _emailController,
            ),

            SizedBox(height: 15.h),

            /// password field
            CustomTextFieldWithLabel(
              label: "Confirm New Password",
              hint: "Confirm New Password",
              isPassword: true,
              controller: _passwordController,
            ),

            SizedBox(height: 5.h),

            /// for remember the user
            RememberMeWidget(
              isRememberMe: _isRememberMe,
              onChanged: (value) {
                setState(() => _isRememberMe = value!);
              },
            ),

            SizedBox(height: 20.h),

            CustomBtn(
              isClickable: !_isFieldEmpty,
              color: _isFieldEmpty
                  ? Colorr.primaryColor[200]!
                  : Colorr.primaryColor[400]!,
              btnText: "Save",
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CongratulationScreen(),
                ),
              ),
            ),
          ],
        ).padSymmetric(horizontal: 20.w),
      ),
    );
  }
}
