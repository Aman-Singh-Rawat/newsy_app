import 'package:newsy/models/notification.dart';

class NotificationGroup {
  final String notificationGroupId;
  final DateTime dateTime;
  final List<Notification> notifications;

  NotificationGroup({
    required this.notificationGroupId,
    required this.notifications,
    DateTime? dateTime,
  }) : dateTime = dateTime ?? DateTime.now() ;
}

