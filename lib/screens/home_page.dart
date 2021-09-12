import 'package:flutter/material.dart';
import 'package:health_hero/widgets/today_plan.dart';
import 'package:health_hero/widgets/tomorrow_plan.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
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
                            'Hello, User',
                            style: TextStyle(
                                fontSize: 40,
                                color: Color.fromRGBO(100, 110, 91, 1),
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.settings_backup_restore,
                            size: 50,
                            color: Color.fromRGBO(100, 110, 91, 1),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'You have consumed 3500 calories today',
                          style: TextStyle(
                            color: Color.fromRGBO(100, 110, 91, 1),
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  // decoration: BoxDecoration(border: Border.all(width: 2)),
                  height: 480,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 25),
                        child: TodayPlanBox(),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 25),
                        child: TomorrowPlanBox(),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: Text(
                        'Not eating according to help plan?',
                        style: TextStyle(
                            color: Color.fromRGBO(100, 110, 91, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      transform: Matrix4.translationValues(0, -19, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 5),
                                transform: Matrix4.translationValues(0, 12, 0),
                                width: 85,
                                height: 25,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      color: Color.fromRGBO(100, 110, 91, 1),
                                      width: 1.5,
                                    )),
                              ),
                              TextButton(
                                onPressed: null,
                                child: Text(
                                  'Tap here',
                                  style: TextStyle(
                                      color: Color.fromRGBO(100, 110, 91, 1),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'to add your own recipe.',
                            style: TextStyle(
                                color: Color.fromRGBO(100, 110, 91, 1),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}