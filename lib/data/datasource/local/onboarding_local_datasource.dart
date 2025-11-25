import 'package:newsy/data/datasource/local/shared_pref_service.dart';

class OnboardingLocalDataSource {
  static const String key = "onboarding_seen";

  Future<bool> setOnboardingSeen() async {
    return await SharedPrefService.instance.set<bool>(key, true);
  }

  bool isOnboardingSeen() {
    return SharedPrefService.instance.get<bool>(key) ?? false;
  }
}
