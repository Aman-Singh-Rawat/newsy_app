import 'package:newsy/data/datasource/local/onboarding_local_datasource.dart';

class OnboardingRepository {
  final OnboardingLocalDataSource local;

  OnboardingRepository(this.local);

  Future<void> setSeen() async {
    await local.setOnboardingSeen();
  }

  bool getSeen() {
    return local.isOnboardingSeen();
  }
}
