import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:newsy/data/datasource/local/role_local_datasource.dart';
import 'package:newsy/data/datasource/remote/user_firestore.dart';
import 'package:newsy/data/repositories/auth_repository.dart';
import 'package:newsy/presentations/features/auth/viewmodel/auth_viewmodel.dart';

// Repository Provider
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});

// Local DB Provider (Role)
final roleLocalDataSourceProvider = Provider<RoleLocalDataSource>((ref) {
  return RoleLocalDataSource();
});

// Firestore Provider
final userFirestoreProvider = Provider<UserFirestore>((ref) {
  return UserFirestore();
});

// StateNotifier Provider (AuthViewModel)
final authViewModelProvider = StateNotifierProvider<AuthViewmodel, String?>((
  ref,
) {
  return AuthViewmodel(
    ref.read(authRepositoryProvider),
    ref.read(userFirestoreProvider),
    ref.read(roleLocalDataSourceProvider),
  );
});
