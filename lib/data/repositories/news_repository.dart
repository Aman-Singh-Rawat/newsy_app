import 'dart:developer';

import 'package:newsy/data/datasource/remote/news_api.dart';
import 'package:newsy/data/models/news_response.dart';

class NewsRepository {
  final NewsApi api;

  NewsRepository(this.api);

  Future<NewsResponse> getNews() {
    log("debugg:: getNews of NewsRepo");
    return api.fetchNews();
  }
}
