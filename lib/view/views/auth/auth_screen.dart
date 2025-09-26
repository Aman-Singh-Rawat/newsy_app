import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsy/core/theme/app_colors.dart';
import 'package:newsy/core/utils/assets.dart';
import 'package:newsy/core/utils/extension.dart';
import 'package:newsy/view/views/auth/forgot_password_screen.dart';
import 'package:newsy/view/views/profile/select_your_country.dart';
import 'package:newsy/view/widgets/custom_btn.dart';
import 'package:newsy/view/widgets/remember_me_widget.dart';
import 'package:newsy/view/widgets/social_btn.dart';
import 'package:newsy/view/widgets/text_field_with_label_widget.dart';

class AuthScreen extends StatefulWidget {
  final bool isSignIn;

  const AuthScreen({super.key, this.isSignIn = false});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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

  void _handleSignUp() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => SelectYourCountry()),
    );
  }

  void _handleSignIn() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => SelectYourCountry()),
    );
  }

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
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              /// top image
              Image.asset(
                Assets.imgSplash,
                height: 200.h,
                width: 200.w,
                fit: BoxFit.cover,
              ),

              /// top heading
              Text(
                widget.isSignIn ? "Let's Sign You In" : "Create an Account",
                style: GoogleFonts.poppins(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),

              SizedBox(height: 20.h),

              /// email field
              CustomTextFieldWithLabel(
                label: "Email",
                hint: "Email",
                isPassword: false,
                controller: _emailController,
              ),

              SizedBox(height: 10.h),

              /// password field
              CustomTextFieldWithLabel(
                label: "Password",
                hint: "Password",
                isPassword: true,
                controller: _passwordController,
              ),
  
              SizedBox(height: 2.h),

              /// for remember the user
              RememberMeWidget(
                isRememberMe: _isRememberMe,
                onChanged: (value) {
                  setState(() => _isRememberMe = value!);
                },
              ),

              SizedBox(height: 10.h),

              // custom button for sign in or sign up
              CustomBtn(
                isClickable: !_isFieldEmpty,
                color: _isFieldEmpty
                    ? Colorr.primaryColor[200]!
                    : Colorr.primaryColor[400]!,
                btnText: widget.isSignIn ? "Sign in" : "Sign up",
                onTap: () =>
                    widget.isSignIn ? _handleSignIn() : _handleSignUp(),
              ),

              /// if user is sign in then show forgot password
              if (widget.isSignIn) ...[
                SizedBox(height: 15.h),
                InkWell(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ForgotPasswordScreen(),
                    ),
                  ),
                  child: Text(
                    "Forgot the password?",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colorr.primaryColor[500],
                    ),
                  ),
                ),
              ],

              SizedBox(height: 15.h),

              /// or continue with
              Text(
                "or continue with",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),

              SizedBox(height: 20.h),

              /// login with social media
              Row(
                children: [
                  Expanded(
                    child: SocialBtn(
                      icon: Assets.ic_meta,
                      onTap: () {},
                      btnText: "Facebook",
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Expanded(
                    child: SocialBtn(
                      icon: Assets.ic_google,
                      onTap: () {},
                      btnText: "Google",
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.h),

              /// bottom navigation text
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
