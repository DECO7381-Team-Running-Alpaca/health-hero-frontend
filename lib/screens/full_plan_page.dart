import 'package:flutter/material.dart';
import 'package:health_hero/models/meal.dart';
import 'package:health_hero/provider/meals.dart';
import 'package:health_hero/screens/profile_page.dart';
import 'package:health_hero/screens/weekly_plan_page.dart';
import 'package:health_hero/widgets/home_module/bottom_navBar.dart';
import 'package:health_hero/widgets/weekly_plan_module/day_selector.dart';
import 'package:health_hero/widgets/weekly_plan_module/detailed_oneday_meal.dart';
import 'package:provider/provider.dart';

import 'health_profile_page.dart';
import 'home_page.dart';

class FullPlanPage extends StatefulWidget {
  static const routeName = '/fullPlan';
  @override
  _FullPlanPageState createState() => _FullPlanPageState();
}

class _FullPlanPageState extends State<FullPlanPage> {
  int currentIndex = 1;
  List<String> dayList = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background-75%.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 40, right: 40, top: 40),
                  width: 2300,
                  child: Text(
                    'Weekly Diet Plan',
                    style: TextStyle(
                        fontSize: 30,
                        color: Color.fromRGBO(100, 110, 91, 1),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 80,
                    margin: EdgeInsets.only(left: 17),
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_left_sharp,
                          size: 30,
                        ),
                        Text('back')
                      ],
                    ),
                  ),
                ),
                Stack(
                  children: [
                    // Image(
                    //   image: AssetImage('assets/images/preference-bottom.png'),
                    // ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      // decoration: BoxDecoration(border: Border.all(width: 2)),
                      height: 730,
                      child: ListView(
                        children: [
                          for (var x in dayList) DetailedOneDay(day: x)
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavBar(
      //   onTap: null,
      //   currentIndex: currentIndex,
      // ),
    );
  }
}
