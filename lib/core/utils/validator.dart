class Validator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Email required';
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Invalid email';
    }
    return null;
  }

  static String? validateOtp(String? value) {
    if (value == null || value.isEmpty) return 'Pin required';
    return null;
  }
}
