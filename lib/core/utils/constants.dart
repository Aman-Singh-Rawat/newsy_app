import 'package:flutter/material.dart' hide Notification;
import 'package:newsy/core/utils/enums.dart';
import 'package:newsy/models/notification.dart';
import 'package:newsy/models/notification_group.dart';
import 'package:newsy/models/users.dart';
import 'package:newsy/view/views/profile/about_us_setting_screen.dart';
import 'package:newsy/view/views/profile/appearance_setting_screen.dart';
import 'package:newsy/view/views/profile/contact_us_setting_screen.dart';
import 'package:newsy/view/views/profile/edit_profile_setting_screen.dart';
import 'package:newsy/view/views/profile/faq_setting_screen.dart';
import 'package:newsy/view/views/profile/help_setting_screen.dart';
import 'package:newsy/view/views/profile/invite_friends_setting_screen.dart';
import 'package:newsy/view/views/profile/notification_setting_screen.dart';
import 'package:newsy/view/views/profile/security_setting_screen.dart';

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
    // object of NotificationGroup
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

final List<User> users = [
  User(
    name: "Jenny Wilson",
    followers: "79.19K Followers",
    isFollowing: true,
    imageUrl: "https://randomuser.me/api/portraits/women/1.jpg",
  ),
  User(
    name: "Darrell Steward",
    followers: "82.12K Followers",
    isFollowing: true,
    imageUrl: "https://randomuser.me/api/portraits/men/2.jpg",
  ),
  User(
    name: "Theresa Webb",
    followers: "86.67K Followers",
    isFollowing: false,
    imageUrl: "https://randomuser.me/api/portraits/women/3.jpg",
  ),
  User(
    name: "Courtney Henry",
    followers: "84.59K Followers",
    isFollowing: false,
    imageUrl: "https://randomuser.me/api/portraits/men/4.jpg",
  ),
  User(
    name: "Dianne Russell",
    followers: "97.16K Followers",
    isFollowing: true,
    imageUrl: "https://randomuser.me/api/portraits/women/5.jpg",
  ),
  User(
    name: "Floyd Miles",
    followers: "86.3K Followers",
    isFollowing: false,
    imageUrl: "https://randomuser.me/api/portraits/men/6.jpg",
  ),
  User(
    name: "Annette Black",
    followers: "65.72K Followers",
    isFollowing: true,
    imageUrl: "https://randomuser.me/api/portraits/women/7.jpg",
  ),
];

final List<Map<String, String>> hashtags = [
  {"tag": "#news", "count": "199.19K"},
  {"tag": "#hotnews", "count": "82.12K"},
  {"tag": "#trendingnews", "count": "86.67K"},
  {"tag": "#latestnews", "count": "84.59K"},
  {"tag": "#newspedia", "count": "97.16K"},
  {"tag": "#usanews", "count": "86.3K"},
  {"tag": "#uknews", "count": "65.72K"},
  {"tag": "#newsdaily", "count": "44.12K"},
];

List<Map<String, dynamic>> socialStats = [
  {'News': 156, 'Followers': 2.279, 'Following': 178},
];

final List<Map<String, dynamic>> settingsItems = [
  {"title": "Edit Profile", "icon": Icons.person},
  {"title": "Notification", "icon": Icons.notifications},
  {"title": "Security", "icon": Icons.lock},
  {"title": "Appearance", "icon": Icons.remove_red_eye},
  {"title": "Help", "icon": Icons.info},
  {"title": "Invite Friends", "icon": Icons.group},
];

final settingScreens = [
  EditProfileSettingScreen(),
  NotificationSettingScreen(),
  SecuritySettingScreen(),
  AppearanceSettingScreen(),
  HelpSettingScreen(),
  InviteFriendsSettingScreen(),
];
