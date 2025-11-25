import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:newsy/data/datasource/local/onboarding_local_datasource.dart';
import 'package:newsy/data/repositories/onboarding_repository.dart';
import 'package:newsy/presentations/features/onboarding/viewmodel/onboarding_viewmodel.dart';

final onboardingLocalDataSourceProvider = Provider(
  (ref) => OnboardingLocalDataSource(),
);

final onboardingRepositoryProvider = Provider(
  (ref) => OnboardingRepository(ref.read(onboardingLocalDataSourceProvider)),
);

final onboardingViewModelProvider =
    StateNotifierProvider<OnboardingViewModel, bool>(
      (ref) => OnboardingViewModel(ref.read(onboardingRepositoryProvider)),
    );
