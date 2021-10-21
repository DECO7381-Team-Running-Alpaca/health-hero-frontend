import 'package:flutter/material.dart';

import './home_page.dart';
import './profile_page.dart';
import './weekly_plan_page.dart';
import './health_profile_page.dart';
import '../widgets/home_module/bottom_navBar.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  final pages = [
    HomePage(),
    WeeklyPlanPage(),
    HealthProfilePage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background-75%.jpg'),
              fit: BoxFit.cover),
        ),
        child: pages[currentIndex],
      ),
      bottomNavigationBar: BottomNavBar(
        onTap: changePage,
        currentIndex: currentIndex,
      ),
    );
  }
}
