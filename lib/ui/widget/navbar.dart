import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:karawang_env/ui/screen/faq/faq_screen.dart';
import 'package:karawang_env/ui/screen/home/home_screen.dart';
import 'package:karawang_env/ui/screen/notif/notif_screen.dart';
import 'package:karawang_env/ui/screen/profile/profile_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int selectedIndex = 0;

  final layoutPage = [
    HomeScreen(),
    NotifScreen(),
    FaqScreen(),
    ProfileScreen(),
  ];

  void onTapItem(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(
        Icons.home,
        size: 30,
      ),
      Icon(
        Icons.notifications_active_rounded,
        size: 30,
      ),
      const Icon(
        Icons.format_quote,
        size: 30,
      ),
      Icon(
        Icons.person,
        size: 30,
      ),
    ];
    return Scaffold(
      body: layoutPage.elementAt(selectedIndex),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        items: items,
        height: 60,
        buttonBackgroundColor: Colors.green[200],
        //color: Color(0xFFC8E6C9),
        color: Color(0xFFE8F5E9),
        index: selectedIndex,
        onTap: onTapItem,
      ),
    );
  }
}
