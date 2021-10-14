import 'package:flutter/material.dart';
import 'package:health_hero/models/meal.dart';
import 'package:health_hero/provider/meals.dart';
import 'package:health_hero/utils/services/rest_api_service.dart';
import 'package:health_hero/widgets/weekly_plan_module/breakfast_lunch_dinner_selector.dart';
import 'package:provider/provider.dart';

import '../../widgets/weekly_plan_module/video_player.dart';

class DateMealWidget extends StatefulWidget {
  // Change this to recieve the daily meal list (length = 3)
  final Meal everyDayMeal;

  const DateMealWidget({Key key, this.everyDayMeal}) : super(key: key);

  @override
  State<DateMealWidget> createState() => _DateMealWidgetState();
}

class _DateMealWidgetState extends State<DateMealWidget> {
  List<DailyMeals> testMeals;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 30,
        left: 20,
        right: 20,
      ),
      height: 540,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.everyDayMeal.date,
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(100, 110, 91, 1),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                // Text(everyDayMeal.calories,
                //     style: TextStyle(
                //       fontSize: 20,
                //       color: Color.fromRGBO(100, 110, 91, 1),
                //       fontWeight: FontWeight.w700,
                //     )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BreakfastLunchDinnerSelector(
                    mealTime: 'breakfast',
                  ),
                  BreakfastLunchDinnerSelector(
                    mealTime: 'lunch',
                  ),
                  BreakfastLunchDinnerSelector(
                    mealTime: 'dinner',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        widget.everyDayMeal.mealType,
                        style: TextStyle(
                          color: Color.fromRGBO(100, 110, 91, 1),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        widget.everyDayMeal.calories,
                        style: TextStyle(
                          color: Color.fromRGBO(100, 110, 91, 1),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Column(
                      children: [
                        Text(widget.everyDayMeal.mealName),
                        VideoPlayer(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(widget.everyDayMeal.ingredients),
                        SizedBox(
                          height: 10,
                        ),
                        Text(widget.everyDayMeal.directions),
                        TextButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                          ),
                          onPressed: () async {
                            // await fetchDetailedPlan();
                            await Provider.of<Meals>(context, listen: false)
                                .getWeeklyPlan()
                                .then((_) {
                              print('finished');
                            });
                          },
                          child: Text('Store Meals'),
                        ),
                        TextButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.green),
                          ),
                          onPressed: () {
                            // Sunday Lunch details
                            print(Provider.of<Meals>(context, listen: false)
                                .weeklyMeals[0].threeMeals[1]);
                            
                            // The id (example is Sunday) u need for switch around days 
                            // (one element array)
                            print(Provider.of<Meals>(context, listen: false)
                                .weeklyMeals[0].dateId);
                          },
                          child: Text('Get Meals'),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
