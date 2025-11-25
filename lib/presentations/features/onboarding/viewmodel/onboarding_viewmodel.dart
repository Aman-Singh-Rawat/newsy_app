import 'package:flutter_riverpod/legacy.dart';
import 'package:newsy/data/repositories/onboarding_repository.dart';

class OnboardingViewModel extends StateNotifier<bool> {
  final OnboardingRepository repository;

  OnboardingViewModel(this.repository) : super(repository.getSeen());

  Future<void> completeOnboarding() async {
    await repository.setSeen();
    state = true;
  }
}
