class Validator {
  Validator._();

  /// email validator
  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    const pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
    final regExp = RegExp(pattern);

    if (!regExp.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  // Password Validator
  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  /// Phone Number Validator
  static String? phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number required';
    }
    final regExp = RegExp(r'^[0-9]{10}$');
    if (!regExp.hasMatch(value)) {
      return 'Enter a valid 10-digit number';
    }
    return null;
  }

  /// Number validator
  static String? numberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Required';
    }

    final number = num.tryParse(value);
    if (number == null) {
      return 'Enter a valid number';
    }
    return null;
  }

  /// Confirm Password Validator
  static String? validateOtp(String? value) {
    if (value == null || value.isEmpty) return 'Pin required';
    return null;
  }

  /// Field Required
  static String? requiredValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }
}
