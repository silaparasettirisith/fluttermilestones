import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  var curr_index = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: (index) {
          setState(() {
            curr_index = index;
          });
        },
        currentIndex: curr_index,
        selectedFontSize: 15,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chats"),
          BottomNavigationBarItem(icon: Icon(Icons.group_work), label: "Channels"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded), label: "Profile")
        ]);
  }
}
