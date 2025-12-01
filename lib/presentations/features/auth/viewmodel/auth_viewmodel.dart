import 'dart:developer';

import 'package:flutter_riverpod/legacy.dart';
import 'package:newsy/data/datasource/local/role_local_datasource.dart';
import 'package:newsy/data/datasource/remote/user_firestore.dart';
import 'package:newsy/data/repositories/auth_repository.dart';

class AuthViewmodel extends StateNotifier<String?> {
  final AuthRepository _authRepo;
  final UserFirestore _userDb;
  final RoleLocalDataSource _roleDb;

  AuthViewmodel(this._authRepo, this._userDb, this._roleDb) : super(null);

  Future<bool> signUp(String email, String password) async {
    try {
      state = null;
      final user = await _authRepo.signup(email, password);
      if (user != null) {
        // TODO:: save in _userDb;
        return true;
      }
      return false;
    } catch (error) {
      state = error.toString();
      return false;
    }
  }

  Future<bool> login(String email, String password) async {
    try {
      state = null;
      final user = await _authRepo.login(email, password);
      return user != null;
    } catch (error) {
      state = error.toString();
      return false;
    }
  }

  /// google login
  Future<bool> loginWithGoogle() async {
    try {
      log("debugging:: call");
      state = null;
      final user = await _authRepo.loginWithGoogle();
      return user != null;
    } catch (error) {
      log("debugging:: 49 $error");
      state = error.toString();
      return false;
    }
  }
}
