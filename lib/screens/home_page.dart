import 'package:flutter/material.dart';
import 'package:health_hero/widgets/home_module/today_plan.dart';
import 'package:health_hero/widgets/home_module/tomorrow_plan.dart';

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
                              fontSize: 30,
                              color: Color.fromRGBO(100, 110, 91, 1),
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.settings_backup_restore,
                          size: 50,
                          color: Colors.transparent,
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
                height: 520,
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
            GestureDetector(
              onTap: null,
              child: Container(
                transform: Matrix4.translationValues(150, -20, 0),
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Icon(
                      Icons.add_to_photos,
                      color: Color.fromRGBO(100, 110, 91, 1),
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Clock In With My Own Recipe',
                      style: TextStyle(
                          color: Color.fromRGBO(100, 110, 91, 1),
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
