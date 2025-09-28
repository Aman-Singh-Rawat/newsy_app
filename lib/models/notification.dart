import 'package:newsy/core/utils/enums.dart';

class Notification {
  final String notificationId;
  final String leadingImage;
  final String title;
  final String? description;
  final DateTime? createdAt;
  final NotificationType notificationType;
  final String? newsImage;

  const Notification({
    required this.notificationId,
    required this.leadingImage,
    required this.title,
    this.description,
    this.createdAt,
    required this.notificationType,
    this.newsImage,
  });

  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
      notificationId: json['notificationId'],
      leadingImage: json['leadingImage'],
      title: json['title'],
      description: json['description'],
      createdAt: DateTime.parse(json['createdAt']),
      notificationType: NotificationType.values.firstWhere(
        (e) => e.toString() == 'NotificationType.${json['notificationType']}',
      ),
      newsImage: json['newsImage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'notificationId': notificationId,
      'leadingImage': leadingImage,
      'title': title,
      'description': description,
      'createdAt': createdAt?.toIso8601String(),
      'notificationType': notificationType.toString().split('.').last,
      'newsImage': newsImage,
    };
  }

  Notification copyWith({
    String? notificationId,
    String? leadingImage,
    String? title,
    String? description,
    DateTime? createdAt,
    NotificationType? notificationType,
    String? newsImage,
  }) {
    return Notification(
      notificationId: notificationId ?? this.notificationId,

      leadingImage: leadingImage ?? this.leadingImage,
      title: title ?? this.title,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      notificationType: notificationType ?? this.notificationType,
      newsImage: newsImage ?? this.newsImage,
    );
  }

  @override
  String toString() {
    return 'Notification(notificationId: $notificationId, leadingImage: $leadingImage, title: $title, description: $description, createdAt: $createdAt, notificationType: $notificationType, newsImage: $newsImage)';
  }

  String get timeAgo {
    if (createdAt == null) return '';

    final now = DateTime.now();
    final difference = now.difference(createdAt!);

    if (difference.inMinutes < 60) {
      return "${difference.inMinutes} minutes ago";
    } else if (difference.inHours < 24) {
      return "${difference.inHours} hours ago";
    } else if (difference.inDays < 7) {
      return "${difference.inDays} days ago";
    } else if (difference.inDays < 30) {
      return "${(difference.inDays / 7).floor()} weeks ago";
    } else if (difference.inDays < 365) {
      return "${(difference.inDays / 30).floor()} months ago";
    } else {
      return "${(difference.inDays / 365).floor()} years ago";
    }
  }
}
