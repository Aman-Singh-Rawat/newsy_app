import 'news_article.dart';

class NewsResponse {
  final String status;
  final int totalResults;
  final List<NewsArticle> results;

  NewsResponse({
    required this.status,
    required this.totalResults,
    required this.results,
  });

  factory NewsResponse.fromJson(Map<String, dynamic> json) {
    return NewsResponse(
      status: json['status'] ?? "",
      totalResults: json['totalResults'] ?? 0,
      results: (json['results'] as List)
          .map((item) => NewsArticle.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'totalResults': totalResults,
        'results': results.map((e) => e.toJson()).toList(),
      };
}
