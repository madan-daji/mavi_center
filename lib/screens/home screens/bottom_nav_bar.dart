import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:my_school/screens/home%20screens/home_page.dart';
import '../bottom bar/calendar_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../bottom bar/profile_screen.dart';

class BottomNavBar extends StatefulWidget {
  final User user;
  const BottomNavBar({super.key, required this.user});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentTabIndex = 0;

  late List<Widget> screens;
  late Widget currentScreen;
  late HomeScreen homeScreen;
  late CalendarScreen calendarScreen;
  late ProfileScreen profileScreen;

  @override
  void initState() {
    homeScreen = HomeScreen(user: widget.user);
    calendarScreen = CalendarScreen();
    profileScreen = ProfileScreen(user: widget.user);
    screens = [homeScreen, calendarScreen, profileScreen];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        backgroundColor: Colors.grey.shade300,
        color: Color(0xFF674AEF),
        animationDuration: Duration(milliseconds: 300),
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
          });
        },
        items: const [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.calendar_month,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            color: Colors.white,
          ),
        ],
      ),
      body: screens[currentTabIndex],
    );
  }
}
