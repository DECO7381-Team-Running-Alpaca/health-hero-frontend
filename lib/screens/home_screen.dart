import 'package:flutter/material.dart';
import 'package:health_hero/screens/home_page.dart';
import 'package:health_hero/screens/profile_page.dart';
import 'package:health_hero/screens/scan_page.dart';
import 'package:health_hero/screens/weekly_plan_page.dart';
import 'package:health_hero/widgets/bottom_navBar.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  Function changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  final pages = [
    HomePage(),
    WeeklyPlanPage(),
    ScanPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/homeBackGround.jpg'),
                fit: BoxFit.cover),
          ),
          child: pages[currentIndex]),
      bottomNavigationBar: BottomNavBar(
        onTap: changePage,
        currentIndex: currentIndex,
      ),
    );
  }
}
