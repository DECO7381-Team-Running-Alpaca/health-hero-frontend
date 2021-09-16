import 'package:flutter/material.dart';
import 'package:health_hero/models/meal.dart';
import 'package:health_hero/widgets/breakfast_lunch_dinner_selector.dart';

class DateMealWidget extends StatelessWidget {
  final EveryDayMeal everyDayMeal;

  const DateMealWidget({Key key, this.everyDayMeal}) : super(key: key);

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
                  everyDayMeal.date,
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(100, 110, 91, 1),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(everyDayMeal.calories,
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(100, 110, 91, 1),
                      fontWeight: FontWeight.w700,
                    )),
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
                        everyDayMeal.mealType,
                        style: TextStyle(
                          color: Color.fromRGBO(100, 110, 91, 1),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        everyDayMeal.breakfastCal,
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
                        Text(everyDayMeal.mealName),
                        Image(image: everyDayMeal.image)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(everyDayMeal.ingredients),
                        SizedBox(
                          height: 10,
                        ),
                        Text(everyDayMeal.directions),
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
