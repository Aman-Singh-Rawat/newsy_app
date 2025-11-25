import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static const String baseUrl = "https://newsdata.io/api/1/latest";
  static String get apiKey => dotenv.env['API_KEY'] ?? "";
}
