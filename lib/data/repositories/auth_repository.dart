import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:newsy/core/errors/auth_exception_handler.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn.instance;

  /// signup
  Future<User?> signup(String email, String password) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (error) {
      throw Exception(FirebaseErrorMapper.mapAuthError(error));
    }
  }

  /// login
  Future<User?> login(String email, String password) async {
    try {
      final credentials = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credentials.user;
    } on FirebaseAuthException catch (error) {
      throw Exception(FirebaseErrorMapper.mapAuthError(error));
    }
  }

  /// login with google
  Future<User?> loginWithGoogle() async {
    // TODO: also check is this user available in firebase or not if yes then sign in else follow sign up process;
    try {
      log("debugging:: befor initialize");

      /// initialize google
      await _googleSignIn.initialize();

      /// authenticate;
      final GoogleSignInAccount account = await _googleSignIn.authenticate(
        scopeHint: ['email'],
      );


      /// Obtain authentication details
      final GoogleSignInAuthentication googleAuth =
          await account.authentication;

      // Create credential for Firebase
      final OAuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(credential);

      return userCredential.user;
    } on GoogleSignInException catch (error) {
      log("debugging:: $error");
      throw Exception(error);
    } catch (error) {
      throw Exception(error);
    }
  }

  /// logout
  Future<void> logout() async {
    await _auth.signOut();
  }

  /// currentUser;
  User? get currentUser => _auth.currentUser;
}
