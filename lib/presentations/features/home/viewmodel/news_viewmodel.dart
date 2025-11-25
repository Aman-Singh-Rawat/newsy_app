import 'dart:async';
import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsy/data/models/news_response.dart';
import 'package:newsy/presentations/features/home/provider/news_provider.dart';

class NewsViewmodel extends AsyncNotifier<NewsResponse?> {
  @override
  Future<NewsResponse?> build() async {
    return null;
  }

  Future<void> loadNews() async {
    log("debugg:: loadNews of NewsViewModel");
    final repo = ref.read(NewsRepositoryProvider);

    state = const AsyncLoading();

    try {
      final response = await repo.getNews();
      state = AsyncData(response);
    } catch (error) {
      state = AsyncError(error, StackTrace.current);
    }
  }
}
