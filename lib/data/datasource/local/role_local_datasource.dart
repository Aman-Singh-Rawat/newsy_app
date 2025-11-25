import 'package:newsy/data/datasource/local/shared_pref_service.dart';

class RoleLocalDataSource {
  static const key = 'user_role';

  Future<void> saveRole(int roleIndex) async {
    await SharedPrefService.instance.set<int>(key, roleIndex);
  }

  int? getRole() {
    return SharedPrefService.instance.get<int>(key);
  }
}
