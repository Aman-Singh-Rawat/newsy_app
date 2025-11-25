import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  SharedPrefService._();

  static final SharedPrefService instance = SharedPrefService._();

  SharedPreferences? _prefs;

  Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Get
  T? get<T>(String key) {
    return _prefs?.get(key) as T?;
  }

  // Set
  Future<bool> set<T>(String key, T value) async {
    if (value is bool) return await _prefs!.setBool(key, value);
    if (value is int) return await _prefs!.setInt(key, value);
    if (value is double) return await _prefs!.setDouble(key, value);
    if (value is String) return await _prefs!.setString(key, value);
    if (value is List<String>) return await _prefs!.setStringList(key, value);

    throw Exception("Unsupported type");
  }
}
