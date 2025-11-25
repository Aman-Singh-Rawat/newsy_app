class NewsArticle {
  final String articleId;
  final String link;
  final String title;
  final String? description;
  final String? content;
  final List<String>? keywords;
  final List<String>? creator;
  final String language;
  final List<String>? country;
  final List<String>? category;
  final String pubDate;
  final String? imageUrl;
  final String sourceId;
  final String sourceIcon;
  final String sourceName;
  final bool duplicate;
  final int likesCount;
  final int commentsCount;
  final DateTime? createdAt;

  NewsArticle({
    required this.articleId,
    required this.link,
    required this.title,
    required this.language,
    required this.pubDate,
    required this.sourceId,
    required this.sourceName,
    required this.sourceIcon,
    required this.duplicate,
    this.description,
    this.content,
    this.keywords,
    this.creator,
    this.country,
    this.category,
    this.imageUrl,
    this.likesCount = 0,
    this.commentsCount = 0,
    this.createdAt,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      articleId: json['article_id'] ?? "",
      link: json['link'] ?? "",
      title: json['title'] ?? "",
      description: json['description'],
      content: json['content'],
      keywords: json['keywords'] != null
          ? List<String>.from(json['keywords'])
          : null,
      creator: json['creator'] != null
          ? List<String>.from(json['creator'])
          : null,
      language: json['language'] ?? "",
      country: json['country'] != null
          ? List<String>.from(json['country'])
          : null,
      category: json['category'] != null
          ? List<String>.from(json['category'])
          : null,
      likesCount: json["likesCount"] ?? 0,
      commentsCount: json["commentsCount"] ?? 0,
      createdAt: json["createdAt"] != null
    ? DateTime.tryParse(json["createdAt"])
    : null,

      pubDate: json['pubDate'] ?? "",
      imageUrl: json['image_url'],
      sourceId: json['source_id'] ?? "",
      sourceName: json['source_name'] ?? "",
      duplicate: json['duplicate'] ?? false,
      sourceIcon: json["source_icon"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    'article_id': articleId,
    'link': link,
    'title': title,
    'description': description,
    'content': content,
    'keywords': keywords,
    'creator': creator,
    'language': language,
    'country': country,
    'category': category,
    'pubDate': pubDate,
    'image_url': imageUrl,
    'source_id': sourceId,
    'source_name': sourceName,
    'duplicate': duplicate,
    "source_icon": sourceIcon,
    "likesCount": likesCount,
    "commentsCount": commentsCount,
    "createdAt": createdAt,
  };
}
