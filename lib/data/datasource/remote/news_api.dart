import 'dart:convert';
import 'dart:developer';

import 'package:newsy/data/models/news_response.dart';
import 'package:http/http.dart' as http;

class NewsApi {
  final String baseUrl;
  final String apiKey;
  NewsApi(this.baseUrl, {required this.apiKey});

  Future<NewsResponse> fetchNews() async {
    final url = Uri.parse("$baseUrl?apiKey=$apiKey");
    log("Debugg is:: $url");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return NewsResponse.fromJson(json);
    } else {
      throw Exception("Failed to fetch news");
    }
  }
}
