import 'package:flutter/material.dart';
import 'package:newsy/view/views/bookmark/bookmark_screen.dart';
import 'package:newsy/view/views/home/home_screen.dart';
import 'package:newsy/view/views/my-news/my_news_screen.dart';
import 'package:newsy/view/views/profile/user-profile/profile_screen.dart';
import 'package:newsy/view/views/search/search_screen.dart';
import 'package:newsy/view/widgets/custom_bottom_navigation_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentBottomSelectedIndex = 0;
  final screens = [
    HomeScreen(),
    SearchScreen(),
    BookmarkScreen(),
    MyNewsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentBottomSelectedIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        onTap: (value) {
          setState(() => _currentBottomSelectedIndex = value);
        },

        currentBottomSelectedIndex: _currentBottomSelectedIndex,
      ),
    );
  }
}
