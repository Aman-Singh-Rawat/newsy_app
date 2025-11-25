import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsy/app/config/app_config.dart';
import 'package:newsy/data/datasource/remote/news_api.dart';
import 'package:newsy/data/models/news_response.dart';
import 'package:newsy/data/repositories/news_repository.dart';
import 'package:newsy/presentations/features/home/viewmodel/news_viewmodel.dart';

// API Provider
final newsApiProvider = Provider(
  (ref) => NewsApi(AppConfig.baseUrl, apiKey: AppConfig.apiKey),
);

// Repository Provider
final NewsRepositoryProvider = Provider(
  (ref) => NewsRepository(ref.watch(newsApiProvider)),
);

final newsViewModelProvider =
    AsyncNotifierProvider<NewsViewmodel, NewsResponse?>(() {
      return NewsViewmodel();
    });
