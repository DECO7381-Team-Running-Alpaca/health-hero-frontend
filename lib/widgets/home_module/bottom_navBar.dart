import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  Function onTap;
  int currentIndex;
  BottomNavBar({this.onTap, this.currentIndex});
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: widget.currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromRGBO(144, 165, 126, 1),
        fixedColor: Colors.white,
        iconSize: 35,
        selectedLabelStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        unselectedItemColor: Color.fromRGBO(255, 255, 255, 0.6),
        unselectedFontSize: 19,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.content_paste),
            label: 'Plan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        onTap: widget.onTap);
  }
}
