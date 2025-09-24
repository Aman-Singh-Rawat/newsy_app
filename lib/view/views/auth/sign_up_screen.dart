import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/view/widgets/custom_btn.dart';
import 'package:newsy/view/widgets/social_btn.dart';
import 'package:newsy/view/widgets/text_field_with_label_widget.dart';

class AuthScreen extends StatefulWidget {
  final bool isSignIn;

  const AuthScreen({super.key, this.isSignIn = false});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isRememberMe = false;

  void _handleAuthNavigation() {
    if (widget.isSignIn) {
      Navigator.pop(context);
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => AuthScreen(isSignIn: true)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.isSignIn ? "Let's Sign You In" : "Create an Account",
                style: GoogleFonts.poppins(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),

              SizedBox(height: 22.h),

              /// email field
              CustomTextFieldWithLabel(
                label: "Email",
                hint: "Email",
                isPassword: false,
              ),

              SizedBox(height: 20.h),

              /// password field
              CustomTextFieldWithLabel(
                label: "Password",
                hint: "Password",
                isPassword: true,
              ),

              SizedBox(height: 10.h),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    side: BorderSide(color: Colorr.primaryColor[400]!),
                    value: _isRememberMe,
                    onChanged: (value) {setState(() => _isRememberMe = value!);},
                    activeColor: Colorr.primaryColor[400]!,
                  ),

                  Text(
                    "Remember me",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              CustomBtn(
                color: Colorr.primaryColor[400]!,
                btnText: "Sign up",
                onTap: () {},
              ),

              if (widget.isSignIn) ...[
                SizedBox(height: 15.h),
                Text(
                  "Forgot the password?",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colorr.primaryColor[500],
                  ),
                ),
              ],

              SizedBox(height: 25.h),

              Text(
                "or continue with",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),

              SizedBox(height: 20.h),

              Row(
                children: [
                  Expanded(
                    child: SocialBtn(
                      icon: Icons.facebook,
                      onTap: () {},
                      btnText: "Facebook",
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Expanded(
                    child: SocialBtn(
                      icon: Icons.facebook,
                      onTap: () {},
                      btnText: "Google",
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.isSignIn
                        ? "Don't have an account? "
                        : "Already have an account? ",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  InkWell(
                    onTap: _handleAuthNavigation,
                    child: Text(
                      widget.isSignIn ? "Sign up" : "Sign in",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colorr.primaryColor[500]!,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ).padSymmetric(horizontal: 20.w),
        ),
      ),
    );
  }
}
