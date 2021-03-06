import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/home_module/today_plan.dart';
import '../widgets/home_module/tomorrow_plan.dart';
import '../provider/meals.dart';
import '../provider/auth.dart';
import '../utils/services/rest_api_service.dart';
import '../utils/helpers/date_handler.dart';
import './scan_meal_screen.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _isLoading = false;
  var _isInit = true;
  var twoDayData;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
          _isLoading = true;
        });
        
      if (Provider.of<Meals>(context, listen: false).weeklyMeals.length == 0) {
        Provider.of<Meals>(context, listen: false).getWeeklyPlan().then((_) {
          fetchTwoDayImage(currentDate("dateRequest")).then((data) {
            setState(() {
              _isLoading = false;
              twoDayData = data;
            });
          });
        });
      } else {
        fetchTwoDayImage(currentDate("dateRequest")).then((data) {
          setState(() {
            _isLoading = false;
            twoDayData = data;
          });
        });
      }
    }
    _isInit = false;
    
    super.didChangeDependencies();
  }

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
                          'Hello, ${Provider.of<Auth>(context, listen: false).userName}',
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
                        'You have consumed ${Provider.of<Meals>(context).dailyCalories} calories today',
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
            _isLoading
                ? Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          value: null,
                          color: Color.fromRGBO(205, 214, 169, 100),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Loading...Please wait'),
                      ],
                    ),
                )
                : Container(
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      // decoration: BoxDecoration(border: Border.all(width: 2)),
                      height: 520,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 25),
                            child: TodayPlanBox(twoDayData: twoDayData),
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 25),
                            child: TomorrowPlanBox(twoDayData: twoDayData),
                          ),
                        ],
                      ),
                    ),
                  ),
            GestureDetector(
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
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, ScanMealScrenn.routeName);
                      },
                      child: Text(
                        "Check my meal's nutrients",
                        style: TextStyle(
                            color: Color.fromRGBO(100, 110, 91, 1),
                            fontSize: 15,
                            fontWeight: FontWeight.w700),
                      ),
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
