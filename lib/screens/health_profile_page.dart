import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_hero/models/meal.dart';
import 'package:health_hero/models/record.dart';
import 'package:health_hero/provider/meals.dart';
import 'package:health_hero/utils/helpers/date_handler.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'health_report_page.dart';

class HealthProfilePage extends StatefulWidget {
  @override
  _HealthProfilePageState createState() => _HealthProfilePageState();
}

class _HealthProfilePageState extends State<HealthProfilePage> {
  Map<String, String> weeklyReport = {};
  var today = DateTime.now();

  @override
  void initState() {
    super.initState();
    weeklyReport = Provider.of<Meals>(context, listen: false).getWeeklyNutritions();
    print(weeklyReport['calories']);
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background-75%.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              children: [
                SafeArea(
                  child: Container(
                    margin: EdgeInsets.only(left: 40, right: 40, top: 40),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Health Profile',
                              style: TextStyle(
                                fontSize: 30,
                                color: Color.fromRGBO(100, 110, 91, 1),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        // Rename sizebox overflow
                        // SizedBox(
                        //   height: 10,
                        // ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: 60, left: 35, right: 35, bottom: 40),
                  padding:
                      EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 5),
                  height: 550,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.grey.shade400,
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 90,
                        padding: EdgeInsets.only(
                            left: 5, top: 10, right: 5, bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                            DateFormat.MMMd().format(DateTime(today.year, today.month, today.day - today.weekday)) + ' - ' + DateFormat.yMMMd().format(today),
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total Calories',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  '2000.00 KCAL',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromRGBO(151, 168, 132, 1),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey.shade500,
                      ),
                      Container(
                        height: 358,
                        padding: EdgeInsets.only(
                            left: 5, top: 10, right: 5, bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.lens,
                                  size: 10,
                                  color: Color.fromRGBO(104, 110, 95, 1),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'EATEN',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 20, top: 5, bottom: 5),
                              child: Text(
                                weeklyReport['calories'] + ' KCAL',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromRGBO(151, 168, 132, 1),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Stack(
                              children: [
                                Container(
                                  height: 250,
                                  width: 300,
                                  padding: EdgeInsets.only(
                                      top: 20, bottom: 50, left: 60, right: 60),
                                  child: CircularProgressIndicator(
                                    value: double.parse(weeklyReport['calories']) / 2000,
                                    backgroundColor:
                                        Color.fromRGBO(243, 245, 248, 1),
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Color.fromRGBO(151, 168, 132, 1)),
                                    strokeWidth: 10,
                                  ),
                                ),
                                Container(
                                  height: 220,
                                  width: 300,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        (2000 - double.parse(weeklyReport['calories'])).toStringAsFixed(2),
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(104, 110, 95, 1),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        'KCAL LEFT',
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(104, 110, 95, 1),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.lens,
                                  size: 10,
                                  color: Color.fromRGBO(251, 229, 79, 1),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'PROTEIN',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(
                                  width: 37.8,
                                ),
                                Icon(
                                  Icons.lens,
                                  size: 10,
                                  color: Color.fromRGBO(197, 181, 79, 1),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'CARBS',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(
                                  width: 37.8,
                                ),
                                Icon(
                                  Icons.lens,
                                  size: 10,
                                  color: Color.fromRGBO(126, 145, 41, 1),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'FAT',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 116,
                                  padding: EdgeInsets.only(
                                      left: 20, top: 5, bottom: 5),
                                  child: Text(
                                    weeklyReport['protein'] + 'g',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color.fromRGBO(151, 168, 132, 1),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 102,
                                  padding: EdgeInsets.only(
                                      left: 20, top: 5, bottom: 5),
                                  child: Text(
                                    weeklyReport['carb'] + 'g',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color.fromRGBO(151, 168, 132, 1),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 81,
                                  padding: EdgeInsets.only(
                                      left: 20, top: 5, bottom: 5),
                                  child: Text(
                                    weeklyReport['fat'] + 'g',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color.fromRGBO(151, 168, 132, 1),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey.shade500,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(HealthReportPage.routeName);
                        },
                        child: Text(
                          'View Full Report',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// foods[0].name