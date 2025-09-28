import 'package:newsy/core/utils/enums.dart';
import 'package:newsy/models/notification.dart';
import 'package:newsy/models/notification_group.dart';

final List<Map<String, String>> newsChannels = [
  {
    "name": "BBC",
    "logo":
        "https://logos-world.net/wp-content/uploads/2023/04/Al-Jazeera-Logo.png",
  },
  {
    "name": "Firstpost",
    "logo":
        "https://cdn-1.webcatalog.io/catalog/firstpost/firstpost-icon-filled-256.webp?v=1714779960691",
  },
  {
    "name": "CNN",
    "logo":
        "https://logos-world.net/wp-content/uploads/2023/04/Al-Jazeera-Logo.png",
  },
  {
    "name": "Al Jazeera",
    "logo":
        "https://logos-world.net/wp-content/uploads/2023/04/Al-Jazeera-Logo.png",
  },
  {
    "name": "BBC",
    "logo":
        "https://logos-world.net/wp-content/uploads/2023/04/Al-Jazeera-Logo.png",
  },
  {
    "name": "Firstpost",
    "logo":
        "https://cdn-1.webcatalog.io/catalog/firstpost/firstpost-icon-filled-256.webp?v=1714779960691",
  },
  {
    "name": "CNN",
    "logo":
        "https://logos-world.net/wp-content/uploads/2023/04/Al-Jazeera-Logo.png",
  },
  {
    "name": "Al Jazeera",
    "logo":
        "https://logos-world.net/wp-content/uploads/2023/04/Al-Jazeera-Logo.png",
  },
];

final List<NotificationGroup> notificationGroups = [
  NotificationGroup(
    notificationGroupId: "1",
    notifications: [
      Notification(
        notificationId: "1",
        leadingImage:
            "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        title: "Yung is now following you",
        createdAt: DateTime.now(),
        notificationType: NotificationType.isFollowingYou,
      ),

      Notification(
        notificationId: "2",
        leadingImage:
            "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        title: "New Features Available",
        description: "You can now invite your friends directly",
        notificationType: NotificationType.message,
      ),
    ],
  ),
  NotificationGroup(
    notificationGroupId: "2",
    dateTime: DateTime.now().subtract(Duration(days: 1)),
    notifications: [
      Notification(
        notificationId: "3",
        leadingImage:
            "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        title:
            "CNN has posted new politics news \"Joe Biden in Press Conference\"",
        createdAt: DateTime.now().subtract(Duration(days: 1, hours: 2)),
        notificationType: NotificationType.news,
        newsImage:
            "https://images.unsplash.com/photo-1580130379624-3a069adbffc5?q=80&w=726&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      ),

      Notification(
        notificationId: "4",
        leadingImage:
            "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        title: "Onboarding Successful",
        description: "Congatulations! Now you can read & create your own news!",
        notificationType: NotificationType.message,
      ),
    ],
  ),
  NotificationGroup(
    notificationGroupId: "3",
    dateTime: DateTime.now().subtract(Duration(days: 2, hours: 4)),
    notifications: [
      Notification(
        notificationId: "5",
        leadingImage:
            "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        title: "Michael replied to your comment on the news",
        createdAt: DateTime.now().subtract(Duration(days: 2, hours: 4)),
        notificationType: NotificationType.news,
        newsImage:
            "https://images.unsplash.com/photo-1580130379624-3a069adbffc5?q=80&w=726&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      ),
    ],
  ),
];
