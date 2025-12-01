import 'package:firebase_auth/firebase_auth.dart';

class FirebaseErrorMapper {
  static String mapAuthError(FirebaseAuthException error) {
    switch (error.code) {
      case "email-already-in-use":
        return "This email is already registered.";
      case "invalid-email":
        return "Please enter a valid email.";
      case "weak-password":
        return "Password must be at least 6 characters long.";
      case "user-not-found":
        return "No user found with this email.";
      case "wrong-password":
        return "Incorrect password. Try again.";
      case "network-request-failed":
        return "No internet connection.";
      case "too-many-requests":
        return "Too many attempts. Please try again later.";
      default:
        return "Authentication error occurred.";
    }
  }
}
