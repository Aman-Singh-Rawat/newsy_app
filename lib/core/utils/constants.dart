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

final List<Map<String, String>> faqData = [
  {
    "question": "What is Berita?",
    "answer":
        "Berita is one of the greatest News Reader Mobile App platforms, providing you the latest news from around the world in an easy-to-read format.",
  },
  {
    "question": "How to use Berita?",
    "answer":
        "To use Berita, simply download the app, sign up or log in, and start exploring news articles. You can browse by categories, search for topics, and save your favorite articles.",
  },
  {
    "question": "Can I create my own news?",
    "answer":
        "Yes, you can create your own news articles on Berita. You just need to register as a contributor and follow the guidelines for submitting news content.",
  },
  {
    "question": "How to create news on Berita?",
    "answer":
        "After registering as a contributor, go to the 'Create News' section, write your article, add images if needed, and submit it. The editorial team will review it before publishing.",
  },
  {
    "question": "How can I upload images?",
    "answer":
        "When creating news, you can upload images directly from your phone or tablet. Simply click the 'Add Image' button in the news editor and select the images you want to attach.",
  },
  {
    "question": "Is there a free tips to use this app?",
    "answer":
        "Yes! Berita offers free tips and tutorials within the app to help you navigate features, improve your news writing, and make the most of the platform.",
  },
];

final List<Map<String, String>> countries = [
  {"code": "AF", "name": "Afghanistan", "flag": "🇦🇫"},
  {"code": "AL", "name": "Albania", "flag": "🇦🇱"},
  {"code": "DZ", "name": "Algeria", "flag": "🇩🇿"},
  {"code": "AD", "name": "Andorra", "flag": "🇦🇩"},
  {"code": "AO", "name": "Angola", "flag": "🇦🇴"},
  {"code": "AG", "name": "Antigua and Barbuda", "flag": "🇦🇬"},
  {"code": "AR", "name": "Argentina", "flag": "🇦🇷"},
  {"code": "AM", "name": "Armenia", "flag": "🇦🇲"},
  {"code": "AU", "name": "Australia", "flag": "🇦🇺"},
  {"code": "AT", "name": "Austria", "flag": "🇦🇹"},
  {"code": "AZ", "name": "Azerbaijan", "flag": "🇦🇿"},
  {"code": "BS", "name": "Bahamas", "flag": "🇧🇸"},
  {"code": "BH", "name": "Bahrain", "flag": "🇧🇭"},
  {"code": "BD", "name": "Bangladesh", "flag": "🇧🇩"},
  {"code": "BB", "name": "Barbados", "flag": "🇧🇧"},
  {"code": "BY", "name": "Belarus", "flag": "🇧🇾"},
  {"code": "BE", "name": "Belgium", "flag": "🇧🇪"},
  {"code": "BZ", "name": "Belize", "flag": "🇧🇿"},
  {"code": "BJ", "name": "Benin", "flag": "🇧🇯"},
  {"code": "BT", "name": "Bhutan", "flag": "🇧🇹"},
  {"code": "BO", "name": "Bolivia", "flag": "🇧🇴"},
  {"code": "BA", "name": "Bosnia and Herzegovina", "flag": "🇧🇦"},
  {"code": "BW", "name": "Botswana", "flag": "🇧🇼"},
  {"code": "BR", "name": "Brazil", "flag": "🇧🇷"},
  {"code": "BN", "name": "Brunei", "flag": "🇧🇳"},
  {"code": "BG", "name": "Bulgaria", "flag": "🇧🇬"},
  {"code": "BF", "name": "Burkina Faso", "flag": "🇧🇫"},
  {"code": "BI", "name": "Burundi", "flag": "🇧🇮"},
  {"code": "KH", "name": "Cambodia", "flag": "🇰🇭"},
  {"code": "CM", "name": "Cameroon", "flag": "🇨🇲"},
  {"code": "CA", "name": "Canada", "flag": "🇨🇦"},
  {"code": "CV", "name": "Cape Verde", "flag": "🇨🇻"},
  {"code": "CF", "name": "Central African Republic", "flag": "🇨🇫"},
  {"code": "TD", "name": "Chad", "flag": "🇹🇩"},
  {"code": "CL", "name": "Chile", "flag": "🇨🇱"},
  {"code": "CN", "name": "China", "flag": "🇨🇳"},
  {"code": "CO", "name": "Colombia", "flag": "🇨🇴"},
  {"code": "KM", "name": "Comoros", "flag": "🇰🇲"},
  {"code": "CG", "name": "Congo", "flag": "🇨🇬"},
  {"code": "CR", "name": "Costa Rica", "flag": "🇨🇷"},
  {"code": "HR", "name": "Croatia", "flag": "🇭🇷"},
  {"code": "CU", "name": "Cuba", "flag": "🇨🇺"},
  {"code": "CY", "name": "Cyprus", "flag": "🇨🇾"},
  {"code": "CZ", "name": "Czech Republic", "flag": "🇨🇿"},
  {"code": "DK", "name": "Denmark", "flag": "🇩🇰"},
  {"code": "DJ", "name": "Djibouti", "flag": "🇩🇯"},
  {"code": "DM", "name": "Dominica", "flag": "🇩🇲"},
  {"code": "DO", "name": "Dominican Republic", "flag": "🇩🇴"},
  {"code": "EC", "name": "Ecuador", "flag": "🇪🇨"},
  {"code": "EG", "name": "Egypt", "flag": "🇪🇬"},
  {"code": "SV", "name": "El Salvador", "flag": "🇸🇻"},
  {"code": "GQ", "name": "Equatorial Guinea", "flag": "🇬🇶"},
  {"code": "ER", "name": "Eritrea", "flag": "🇪🇷"},
  {"code": "EE", "name": "Estonia", "flag": "🇪🇪"},
  {"code": "ET", "name": "Ethiopia", "flag": "🇪🇹"},
  {"code": "FJ", "name": "Fiji", "flag": "🇫🇯"},
  {"code": "FI", "name": "Finland", "flag": "🇫🇮"},
  {"code": "FR", "name": "France", "flag": "🇫🇷"},
  {"code": "GA", "name": "Gabon", "flag": "🇬🇦"},
  {"code": "GM", "name": "Gambia", "flag": "🇬🇲"},
  {"code": "GE", "name": "Georgia", "flag": "🇬🇪"},
  {"code": "DE", "name": "Germany", "flag": "🇩🇪"},
  {"code": "GH", "name": "Ghana", "flag": "🇬🇭"},
  {"code": "GR", "name": "Greece", "flag": "🇬🇷"},
  {"code": "GD", "name": "Grenada", "flag": "🇬🇩"},
  {"code": "GT", "name": "Guatemala", "flag": "🇬🇹"},
  {"code": "GN", "name": "Guinea", "flag": "🇬🇳"},
  {"code": "GW", "name": "Guinea-Bissau", "flag": "🇬🇼"},
  {"code": "GY", "name": "Guyana", "flag": "🇬🇾"},
  {"code": "HT", "name": "Haiti", "flag": "🇭🇹"},
  {"code": "HN", "name": "Honduras", "flag": "🇭🇳"},
  {"code": "HU", "name": "Hungary", "flag": "🇭🇺"},
  {"code": "IS", "name": "Iceland", "flag": "🇮🇸"},
  {"code": "IN", "name": "India", "flag": "🇮🇳"},
  {"code": "ID", "name": "Indonesia", "flag": "🇮🇩"},
  {"code": "IR", "name": "Iran", "flag": "🇮🇷"},
  {"code": "IQ", "name": "Iraq", "flag": "🇮🇶"},
  {"code": "IE", "name": "Ireland", "flag": "🇮🇪"},
  {"code": "IL", "name": "Israel", "flag": "🇮🇱"},
  {"code": "IT", "name": "Italy", "flag": "🇮🇹"},
  {"code": "JM", "name": "Jamaica", "flag": "🇯🇲"},
  {"code": "JP", "name": "Japan", "flag": "🇯🇵"},
  {"code": "JO", "name": "Jordan", "flag": "🇯🇴"},
  {"code": "KZ", "name": "Kazakhstan", "flag": "🇰🇿"},
  {"code": "KE", "name": "Kenya", "flag": "🇰🇪"},
  {"code": "KI", "name": "Kiribati", "flag": "🇰🇮"},
  {"code": "KP", "name": "North Korea", "flag": "🇰🇵"},
  {"code": "KR", "name": "South Korea", "flag": "🇰🇷"},
  {"code": "KW", "name": "Kuwait", "flag": "🇰🇼"},
  {"code": "KG", "name": "Kyrgyzstan", "flag": "🇰🇬"},
  {"code": "LA", "name": "Laos", "flag": "🇱🇦"},
  {"code": "LV", "name": "Latvia", "flag": "🇱🇻"},
  {"code": "LB", "name": "Lebanon", "flag": "🇱🇧"},
  {"code": "LS", "name": "Lesotho", "flag": "🇱🇸"},
  {"code": "LR", "name": "Liberia", "flag": "🇱🇷"},
  {"code": "LY", "name": "Libya", "flag": "🇱🇾"},
  {"code": "LT", "name": "Lithuania", "flag": "🇱🇹"},
  {"code": "LU", "name": "Luxembourg", "flag": "🇱🇺"},
  {"code": "MK", "name": "North Macedonia", "flag": "🇲🇰"},
  {"code": "MG", "name": "Madagascar", "flag": "🇲🇬"},
  {"code": "MW", "name": "Malawi", "flag": "🇲🇼"},
  {"code": "MY", "name": "Malaysia", "flag": "🇲🇾"},
  {"code": "MV", "name": "Maldives", "flag": "🇲🇻"},
  {"code": "ML", "name": "Mali", "flag": "🇲🇱"},
  {"code": "MT", "name": "Malta", "flag": "🇲🇹"},
  {"code": "MH", "name": "Marshall Islands", "flag": "🇲🇭"},
  {"code": "MR", "name": "Mauritania", "flag": "🇲🇷"},
  {"code": "MU", "name": "Mauritius", "flag": "🇲🇺"},
  {"code": "MX", "name": "Mexico", "flag": "🇲🇽"},
  {"code": "FM", "name": "Micronesia", "flag": "🇫🇲"},
  {"code": "MD", "name": "Moldova", "flag": "🇲🇩"},
  {"code": "MC", "name": "Monaco", "flag": "🇲🇨"},
  {"code": "MN", "name": "Mongolia", "flag": "🇲🇳"},
  {"code": "ME", "name": "Montenegro", "flag": "🇲🇪"},
  {"code": "MA", "name": "Morocco", "flag": "🇲🇦"},
  {"code": "MZ", "name": "Mozambique", "flag": "🇲🇿"},
  {"code": "MM", "name": "Myanmar", "flag": "🇲🇲"},
  {"code": "NA", "name": "Namibia", "flag": "🇳🇦"},
  {"code": "NR", "name": "Nauru", "flag": "🇳🇷"},
  {"code": "NP", "name": "Nepal", "flag": "🇳🇵"},
  {"code": "NL", "name": "Netherlands", "flag": "🇳🇱"},
  {"code": "NZ", "name": "New Zealand", "flag": "🇳🇿"},
  {"code": "NI", "name": "Nicaragua", "flag": "🇳🇮"},
  {"code": "NE", "name": "Niger", "flag": "🇳🇪"},
  {"code": "NG", "name": "Nigeria", "flag": "🇳🇬"},
  {"code": "NO", "name": "Norway", "flag": "🇳🇴"},
  {"code": "OM", "name": "Oman", "flag": "🇴🇲"},
  {"code": "PK", "name": "Pakistan", "flag": "🇵🇰"},
  {"code": "PW", "name": "Palau", "flag": "🇵🇼"},
  {"code": "PS", "name": "Palestine", "flag": "🇵🇸"},
  {"code": "PA", "name": "Panama", "flag": "🇵🇦"},
  {"code": "PG", "name": "Papua New Guinea", "flag": "🇵🇬"},
  {"code": "PY", "name": "Paraguay", "flag": "🇵🇾"},
  {"code": "PE", "name": "Peru", "flag": "🇵🇪"},
  {"code": "PH", "name": "Philippines", "flag": "🇵🇭"},
  {"code": "PL", "name": "Poland", "flag": "🇵🇱"},
  {"code": "PT", "name": "Portugal", "flag": "🇵🇹"},
  {"code": "QA", "name": "Qatar", "flag": "🇶🇦"},
  {"code": "RO", "name": "Romania", "flag": "🇷🇴"},
  {"code": "RU", "name": "Russia", "flag": "🇷🇺"},
  {"code": "RW", "name": "Rwanda", "flag": "🇷🇼"},
  {"code": "WS", "name": "Samoa", "flag": "🇼🇸"},
  {"code": "SM", "name": "San Marino", "flag": "🇸🇲"},
  {"code": "SA", "name": "Saudi Arabia", "flag": "🇸🇦"},
  {"code": "SN", "name": "Senegal", "flag": "🇸🇳"},
  {"code": "RS", "name": "Serbia", "flag": "🇷🇸"},
  {"code": "SC", "name": "Seychelles", "flag": "🇸🇨"},
  {"code": "SL", "name": "Sierra Leone", "flag": "🇸🇱"},
  {"code": "SG", "name": "Singapore", "flag": "🇸🇬"},
  {"code": "SK", "name": "Slovakia", "flag": "🇸🇰"},
  {"code": "SI", "name": "Slovenia", "flag": "🇸🇮"},
  {"code": "SB", "name": "Solomon Islands", "flag": "🇸🇧"},
  {"code": "SO", "name": "Somalia", "flag": "🇸🇴"},
  {"code": "ZA", "name": "South Africa", "flag": "🇿🇦"},
  {"code": "ES", "name": "Spain", "flag": "🇪🇸"},
  {"code": "LK", "name": "Sri Lanka", "flag": "🇱🇰"},
  {"code": "SD", "name": "Sudan", "flag": "🇸🇩"},
  {"code": "SR", "name": "Suriname", "flag": "🇸🇷"},
  {"code": "SZ", "name": "Eswatini", "flag": "🇸🇿"},
  {"code": "SE", "name": "Sweden", "flag": "🇸🇪"},
  {"code": "CH", "name": "Switzerland", "flag": "🇨🇭"},
  {"code": "SY", "name": "Syria", "flag": "🇸🇾"},
  {"code": "TW", "name": "Taiwan", "flag": "🇹🇼"},
  {"code": "TJ", "name": "Tajikistan", "flag": "🇹🇯"},
  {"code": "TZ", "name": "Tanzania", "flag": "🇹🇿"},
  {"code": "TH", "name": "Thailand", "flag": "🇹🇭"},
  {"code": "TL", "name": "Timor-Leste", "flag": "🇹🇱"},
  {"code": "TG", "name": "Togo", "flag": "🇹🇬"},
  {"code": "TO", "name": "Tonga", "flag": "🇹🇴"},
  {"code": "TT", "name": "Trinidad and Tobago", "flag": "🇹🇹"},
  {"code": "TN", "name": "Tunisia", "flag": "🇹🇳"},
  {"code": "TR", "name": "Turkey", "flag": "🇹🇷"},
  {"code": "TM", "name": "Turkmenistan", "flag": "🇹🇲"},
  {"code": "TV", "name": "Tuvalu", "flag": "🇹🇻"},
  {"code": "UG", "name": "Uganda", "flag": "🇺🇬"},
  {"code": "UA", "name": "Ukraine", "flag": "🇺🇦"},
  {"code": "AE", "name": "United Arab Emirates", "flag": "🇦🇪"},
  {"code": "GB", "name": "United Kingdom", "flag": "🇬🇧"},
  {"code": "US", "name": "United States", "flag": "🇺🇸"},
  {"code": "UY", "name": "Uruguay", "flag": "🇺🇾"},
  {"code": "UZ", "name": "Uzbekistan", "flag": "🇺🇿"},
  {"code": "VU", "name": "Vanuatu", "flag": "🇻🇺"},
  {"code": "VA", "name": "Vatican City", "flag": "🇻🇦"},
  {"code": "VE", "name": "Venezuela", "flag": "🇻🇪"},
  {"code": "VN", "name": "Vietnam", "flag": "🇻🇳"},
  {"code": "YE", "name": "Yemen", "flag": "🇾🇪"},
  {"code": "ZM", "name": "Zambia", "flag": "🇿🇲"},
  {"code": "ZW", "name": "Zimbabwe", "flag": "🇿🇼"},
];

final List<Map<String, String>> newsTopics = [
  {
    'topic': 'Technology',
    'imageUrl':
        'https://images.unsplash.com/photo-1485827404703-89b55fcc595e?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  },
  {
    'topic': 'Sports',
    'imageUrl':
        'https://images.unsplash.com/photo-1461896836934-ffe607ba8211?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  },
  {
    'topic': 'Business',
    'imageUrl':
        'https://images.unsplash.com/photo-1444653614773-995cb1ef9efa?q=80&w=1176&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  },
  {
    'topic': 'Entertainment',
    'imageUrl':
        'https://images.unsplash.com/photo-1603190287605-e6ade32fa852?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  },
  {
    'topic': 'Health',
    'imageUrl':
        'https://plus.unsplash.com/premium_photo-1669446008968-f7a3e88da218?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  },
  {
    'topic': 'Science',
    'imageUrl':
        'https://plus.unsplash.com/premium_photo-1661436689263-e40739ea8bc2?q=80&w=1172&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  },
  {
    'topic': 'Politics',
    'imageUrl':
        'https://images.unsplash.com/photo-1541872703-74c5e44368f9?q=80&w=1106&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  },
  {
    'topic': 'Art',
    'imageUrl':
        'https://images.unsplash.com/flagged/photo-1572392640988-ba48d1a74457?q=80&w=764&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  },
];
