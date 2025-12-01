import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsy/app/navigation/app_navigation.dart';

import 'package:newsy/app/constants/image_strings.dart';
import 'package:newsy/app/constants/text_strings.dart';
import 'package:newsy/core/utils/extensions.dart';
import 'package:newsy/core/utils/helper_function.dart';
import 'package:newsy/core/utils/show_loading_dialog.dart';
import 'package:newsy/core/utils/toasts.dart';
import 'package:newsy/core/utils/validator.dart';
import 'package:newsy/presentations/features/auth/forgot_password_screen.dart';
import 'package:newsy/presentations/features/auth/provider/auth_providers.dart';
import 'package:newsy/presentations/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:newsy/presentations/features/setup-profile/select_your_country.dart';
import 'package:newsy/presentations/common_widgets/remember_me_widget.dart';
import 'package:newsy/presentations/common_widgets/social_btn.dart';
import 'package:newsy/presentations/common_widgets/text_field_with_label_widget.dart';
import 'package:newsy/presentations/root/main_screen.dart';

class AuthScreen extends ConsumerStatefulWidget {
  final bool isSignIn;

  const AuthScreen({super.key, this.isSignIn = false});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late final String? authState;
  late final AuthViewmodel _authVM;
  bool _isRememberMe = false;
  String? emailError;
  String? passwordError;

  void _handleAuthNavigation() {
    if (widget.isSignIn) {
      AppNavigator.pop(context);
    } else {
      AppNavigator.push(context, const AuthScreen(isSignIn: true));
    }
  }

  void _handleSignUp() async {
    /// if user not fill all text fields
    if (!_formKey.currentState!.validate()) {
      Toasts.warningToast(waring: "Please correct the highlighted fields");
      return;
    }

    /// showing dialog
    showLoadingDialog(context);

    /// signup
    final signupResult = await _authVM.signUp(
      _emailController.text.trim(),
      _passwordController.text.trim(),
    );

    if (!context.mounted) return;

    /// removing showLoading
    AppNavigator.pop(context);

    /// if account successfully created
    if (signupResult == true && authState == null) {
      Toasts.successToast(msg: "Your account has been created successfully.");
      AppNavigator.pushAndRemoveAll(context, const SelectYourCountry());
    } else {
      /// showing error
      Toasts.errorToast(err: authState.toString());
    }
  }

  void _handleSignIn() async {
    /// if user not fill all text fields
    if (!_formKey.currentState!.validate()) {
      Toasts.warningToast(waring: "Please correct the highlighted fields");
      return;
    }

    /// showing dialog
    showLoadingDialog(context);

    /// signup
    final signupResult = await _authVM.login(
      _emailController.text.trim(),
      _passwordController.text.trim(),
    );

    if (!context.mounted) return;

    /// removing showLoading
    AppNavigator.pop(context);

    /// if account successfully created
    if (signupResult == true && authState == null) {
      Toasts.successToast(msg: "Great to see you again! 👋");
      AppNavigator.pushAndRemoveAll(context, const MainScreen());
    } else {
      /// showing error
      Toasts.errorToast(err: authState.toString());
    }
  }

 void _handleGoogleSignIn() async {
  final result = await _authVM.loginWithGoogle();
  log("debugging:: $result");

  if (!context.mounted) return;

  final error = ref.read(authViewModelProvider); 

  if (result == true && error == null) {
    Toasts.successToast(msg: "Great to see you again! 👋");
    AppNavigator.pushAndRemoveAll(context, const MainScreen());
  } else {
    Toasts.errorToast(err: error.toString()); // will show real error
  }
}


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    authState = ref.read(authViewModelProvider);
    _authVM = ref.read(authViewModelProvider.notifier);
    _emailController.addListener(() => setState(() {}));
    _passwordController.addListener(() => setState(() {}));
    super.initState();
  }

  get _isFieldEmpty =>
      _emailController.text.trim().isEmpty ||
      _passwordController.text.trim().isEmpty;

  @override
  Widget build(BuildContext context) {
    final bool isDark = HelperFunction.isDarkMode(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// top image
                Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: Image.asset(
                    isDark
                        ? ImageStrings.imgSplashDark
                        : ImageStrings.imgSplash,
                    height: 200.h,
                    width: 200.w,
                    fit: BoxFit.cover,
                  ),
                ),

                /// top heading
                Text(
                  widget.isSignIn
                      ? TextStrings.signInTitle
                      : TextStrings.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),

                SizedBox(height: 20.h),

                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      /// email field
                      CustomTextFieldWithLabel(
                        label: TextStrings.email,
                        hint: TextStrings.email,
                        isFieldEmpty: _emailController.text.trim().isEmpty,
                        isPassword: false,
                        controller: _emailController,
                        error: emailError,
                        validator: (value) {
                          setState(() {
                            emailError = Validator.emailValidator(value);
                          });
                          return emailError;
                        },
                      ),

                      SizedBox(height: 20.h),

                      /// password field
                      CustomTextFieldWithLabel(
                        label: TextStrings.password,
                        hint: TextStrings.password,
                        isPassword: true,
                        isFieldEmpty: _passwordController.text.trim().isEmpty,
                        textInputAction: TextInputAction.done,
                        controller: _passwordController,
                        error: passwordError,
                        validator: (value) {
                          setState(() {
                            passwordError = Validator.passwordValidator(value);
                          });
                          return passwordError;
                        },
                      ),
                    ],
                  ),
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
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isFieldEmpty
                        ? null
                        : widget.isSignIn
                        ? _handleSignIn
                        : _handleSignUp,

                    child: Text(
                      widget.isSignIn
                          ? TextStrings.signIn
                          : TextStrings.signupBtnText,
                    ),
                  ),
                ),

                /// if user is sign in then show forgot password
                if (widget.isSignIn) ...[
                  SizedBox(height: 12.h),
                  TextButton(
                    onPressed: () =>
                        AppNavigator.push(context, ForgotPasswordScreen()),
                    child: Text(TextStrings.forgetThePassword),
                  ),
                ],

                SizedBox(height: widget.isSignIn ? 19.h : 30.h),

                /// or continue with
                Text(
                  TextStrings.orContinueWith,
                  style: Theme.of(context).textTheme.labelLarge,
                ),

                SizedBox(height: 25.h),

                /// login with social media
                Row(
                  children: [
                    Expanded(
                      child: SocialBtn(
                        icon: ImageStrings.ic_meta,
                        onTap: _handleSignIn,
                        btnText: TextStrings.facebook,
                      ),
                    ),
                    SizedBox(width: 15.w),
                    Expanded(
                      child: SocialBtn(
                        icon: ImageStrings.ic_google,
                        onTap: _handleGoogleSignIn,
                        btnText: TextStrings.google,
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
                          ? TextStrings.dontHaveAnAccount
                          : TextStrings.alreadyHaveAnAccount,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextButton(
                      onPressed: _handleAuthNavigation,
                      child: Text(
                        widget.isSignIn
                            ? TextStrings.signupBtnText
                            : TextStrings.signIn,
                      ),
                    ),
                  ],
                ),
              ],
            ).padSymmetric(horizontal: 20.w),
          ),
        ),
      ),
    );
  }
}
