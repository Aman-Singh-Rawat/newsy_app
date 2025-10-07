import 'package:flutter/material.dart' hide Notification;
import 'package:newsy/core/utils/enums.dart';
import 'package:newsy/models/comment_model.dart';
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
  User(
    name: "Cody Fisher",
    followers: "91.04K Followers",
    isFollowing: true,
    imageUrl: "https://randomuser.me/api/portraits/men/8.jpg",
  ),
  User(
    name: "Savannah Nguyen",
    followers: "99.88K Followers",
    isFollowing: false,
    imageUrl: "https://randomuser.me/api/portraits/women/9.jpg",
  ),
  User(
    name: "Emily Clark",
    followers: "103.45K Followers",
    isFollowing: true,
    imageUrl: "https://randomuser.me/api/portraits/women/10.jpg",
  ),
  User(
    name: "Olivia Martin",
    followers: "112.67K Followers",
    isFollowing: true,
    imageUrl: "https://randomuser.me/api/portraits/women/11.jpg",
  ),
  User(
    name: "Sophia Johnson",
    followers: "89.22K Followers",
    isFollowing: false,
    imageUrl: "https://randomuser.me/api/portraits/women/12.jpg",
  ),
  User(
    name: "Amelia Brown",
    followers: "121.34K Followers",
    isFollowing: true,
    imageUrl: "https://randomuser.me/api/portraits/women/13.jpg",
  ),
  User(
    name: "Charlotte Garcia",
    followers: "76.93K Followers",
    isFollowing: false,
    imageUrl: "https://randomuser.me/api/portraits/women/14.jpg",
  ),
  User(
    name: "Isabella Rodriguez",
    followers: "108.50K Followers",
    isFollowing: true,
    imageUrl: "https://randomuser.me/api/portraits/women/15.jpg",
  ),

  // New 15 users below
  User(
    name: "Ava Martinez",
    followers: "118.75K Followers",
    isFollowing: false,
    imageUrl: "https://randomuser.me/api/portraits/women/16.jpg",
  ),
  User(
    name: "Mia Thompson",
    followers: "91.46K Followers",
    isFollowing: true,
    imageUrl: "https://randomuser.me/api/portraits/women/17.jpg",
  ),
  User(
    name: "Harper Davis",
    followers: "85.28K Followers",
    isFollowing: false,
    imageUrl: "https://randomuser.me/api/portraits/women/18.jpg",
  ),
  User(
    name: "Evelyn Moore",
    followers: "107.31K Followers",
    isFollowing: true,
    imageUrl: "https://randomuser.me/api/portraits/women/19.jpg",
  ),
  User(
    name: "Abigail Taylor",
    followers: "94.18K Followers",
    isFollowing: false,
    imageUrl: "https://randomuser.me/api/portraits/women/20.jpg",
  ),
  User(
    name: "Ella Anderson",
    followers: "121.02K Followers",
    isFollowing: true,
    imageUrl: "https://randomuser.me/api/portraits/women/21.jpg",
  ),
  User(
    name: "Scarlett Thomas",
    followers: "97.84K Followers",
    isFollowing: false,
    imageUrl: "https://randomuser.me/api/portraits/women/22.jpg",
  ),
  User(
    name: "Grace Jackson",
    followers: "105.69K Followers",
    isFollowing: true,
    imageUrl: "https://randomuser.me/api/portraits/women/23.jpg",
  ),
  User(
    name: "Luna White",
    followers: "115.03K Followers",
    isFollowing: true,
    imageUrl: "https://randomuser.me/api/portraits/women/24.jpg",
  ),
  User(
    name: "Zoe Harris",
    followers: "99.45K Followers",
    isFollowing: false,
    imageUrl: "https://randomuser.me/api/portraits/women/25.jpg",
  ),
  User(
    name: "Lily Young",
    followers: "104.76K Followers",
    isFollowing: true,
    imageUrl: "https://randomuser.me/api/portraits/women/26.jpg",
  ),
  User(
    name: "Eleanor King",
    followers: "87.23K Followers",
    isFollowing: false,
    imageUrl: "https://randomuser.me/api/portraits/women/27.jpg",
  ),
  User(
    name: "James Scott",
    followers: "92.19K Followers",
    isFollowing: true,
    imageUrl: "https://randomuser.me/api/portraits/men/28.jpg",
  ),
  User(
    name: "Benjamin Adams",
    followers: "83.57K Followers",
    isFollowing: false,
    imageUrl: "https://randomuser.me/api/portraits/men/29.jpg",
  ),
  User(
    name: "Lucas Nelson",
    followers: "90.11K Followers",
    isFollowing: true,
    imageUrl: "https://randomuser.me/api/portraits/men/30.jpg",
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

final List<String> helpList = [
  "FAQ",
  "Contact us",
  "Terms & Conditions",
  "Privacy Policy",
  "About Us",
];

final helpScreens = [
  FaqSettingScreen(),
  ContactUsSettingScreen(),
  AboutUsSettingScreen(),
];

final settingScreens = [
  EditProfileSettingScreen(),
  NotificationSettingScreen(),
  SecuritySettingScreen(),
  AppearanceSettingScreen(),
  HelpSettingScreen(),
  InviteFriendsSettingScreen(),
];

List<String> faqCategories = ["General", "Login", "Account", "Berita", "Tips"];

final List<String> newsCategories = [
  "Trending",
  "Latest",
  "Politics",
  "Business",
  "Technology",
  "Entertainment",
  "Sports",
  "Health",
  "Science",
  "Education",
  "World",
  "Lifestyle",
  "Travel",
  "Food",
  "Environment",
  "Crime",
  "Opinion",
  "Finance",
  "Culture",
];

List<CommentModel> comments = [
  CommentModel(
    userName: "Jenny Wilson",
    userImage: "https://randomuser.me/api/portraits/women/44.jpg",
    timeAgo: "3 days ago",
    comment:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.",
    likes: 879,
    dislikes: 68,
    comments: 365,
    replies: 187,
  ),
  CommentModel(
    userName: "Sofia Turner",
    userImage: "https://randomuser.me/api/portraits/women/65.jpg",
    timeAgo: "1 day ago",
    comment: "This is so insightful! I completely agree with your point here.",
    likes: 456,
    dislikes: 32,
    comments: 120,
    replies: 54,
  ),
  CommentModel(
    userName: "Emily Carter",
    userImage: "https://randomuser.me/api/portraits/women/71.jpg",
    timeAgo: "2 hours ago",
    comment:
        "Thanks for sharing this! It really helped me understand the topic better.",
    likes: 233,
    dislikes: 15,
    comments: 89,
    replies: 25,
  ),
  CommentModel(
    userName: "Olivia Brown",
    userImage: "https://randomuser.me/api/portraits/women/56.jpg",
    timeAgo: "5 days ago",
    comment:
        "Wow! Such a detailed explanation. Appreciate the effort behind this.",
    likes: 982,
    dislikes: 45,
    comments: 450,
    replies: 210,
  ),
  CommentModel(
    userName: "Sophia Williams",
    userImage: "https://randomuser.me/api/portraits/women/24.jpg",
    timeAgo: "6 hours ago",
    comment: "Absolutely loved this! Keep posting more content like this.",
    likes: 678,
    dislikes: 23,
    comments: 199,
    replies: 80,
  ),
];

final List<Map<String, String>> inviteUser = [
  {
    "name": "Jenny Wilson",
    "phone": "+62-819-5558-60",
    "imageUrl": "https://randomuser.me/api/portraits/women/1.jpg",
  },
  {
    "name": "Cody Fisher",
    "phone": "+62-838-5544-71",
    "imageUrl": "https://randomuser.me/api/portraits/women/2.jpg",
  },
  {
    "name": "Courtney Henry",
    "phone": "+62-819-3344-12",
    "imageUrl": "https://randomuser.me/api/portraits/women/3.jpg",
  },
  {
    "name": "Leslie Alexander",
    "phone": "+62-878-5512-45",
    "imageUrl": "https://randomuser.me/api/portraits/women/4.jpg",
  },
  {
    "name": "Theresa Webb",
    "phone": "+62-838-5554-60",
    "imageUrl": "https://randomuser.me/api/portraits/women/5.jpg",
  },
  {
    "name": "Eleanor Pena",
    "phone": "+62-819-3344-11",
    "imageUrl": "https://randomuser.me/api/portraits/women/6.jpg",
  },
  {
    "name": "Annette Black",
    "phone": "+62-838-5559-21",
    "imageUrl": "https://randomuser.me/api/portraits/women/7.jpg",
  },
  {
    "name": "Kathryn Murphy",
    "phone": "+62-819-8888-90",
    "imageUrl": "https://randomuser.me/api/portraits/women/8.jpg",
  },
  {
    "name": "Eleanor Rigby",
    "phone": "+62-878-5551-22",
    "imageUrl": "https://randomuser.me/api/portraits/women/9.jpg",
  },
  {
    "name": "Jane Cooper",
    "phone": "+62-838-7777-50",
    "imageUrl": "https://randomuser.me/api/portraits/women/10.jpg",
  },
  {
    "name": "Savannah Nguyen",
    "phone": "+62-819-5558-99",
    "imageUrl": "https://randomuser.me/api/portraits/women/11.jpg",
  },
  {
    "name": "Arlene McCoy",
    "phone": "+62-838-2222-31",
    "imageUrl": "https://randomuser.me/api/portraits/women/12.jpg",
  },
  {
    "name": "Darlene Robertson",
    "phone": "+62-819-4444-77",
    "imageUrl": "https://randomuser.me/api/portraits/women/13.jpg",
  },
  {
    "name": "Esther Howard",
    "phone": "+62-878-7777-60",
    "imageUrl": "https://randomuser.me/api/portraits/women/14.jpg",
  },
  {
    "name": "Kristin Watson",
    "phone": "+62-838-3333-91",
    "imageUrl": "https://randomuser.me/api/portraits/women/15.jpg",
  },
  {
    "name": "Bessie Cooper",
    "phone": "+62-819-5555-60",
    "imageUrl": "https://randomuser.me/api/portraits/women/16.jpg",
  },
  {
    "name": "Marvin McKinney",
    "phone": "+62-838-1111-20",
    "imageUrl": "https://randomuser.me/api/portraits/women/17.jpg",
  },
  {
    "name": "Brooklyn Simmons",
    "phone": "+62-819-4444-10",
    "imageUrl": "https://randomuser.me/api/portraits/women/18.jpg",
  },
  {
    "name": "Cameron Williamson",
    "phone": "+62-838-2222-80",
    "imageUrl": "https://randomuser.me/api/portraits/women/19.jpg",
  },
  {
    "name": "Kathleen Smith",
    "phone": "+62-819-5554-70",
    "imageUrl": "https://randomuser.me/api/portraits/women/20.jpg",
  },
];
