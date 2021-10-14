import 'package:flutter/material.dart';
import 'package:health_hero/provider/app_state.dart';
import 'package:health_hero/widgets/home_module/date_meal_widget.dart';
import 'package:health_hero/widgets/weekly_plan_module/day_selector.dart';
import 'package:provider/provider.dart';
import 'package:health_hero/models/meal.dart';

class WeeklyPlanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                        'Weekly Diet Plan',
                        style: TextStyle(
                            fontSize: 30,
                            color: Color.fromRGBO(100, 110, 91, 1),
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.date_range,
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
                        color: Colors.transparent,
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          ChangeNotifierProvider<AppState>(
            create: (_) => AppState(),
            child: Column(
              children: [
                Consumer<AppState>(
                  builder: (context, appState, _) => Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DaySelector(
                          selfIndex: 0,
                          day: 'SUN',
                          date: 12,
                        ),
                        DaySelector(
                          selfIndex: 1,
                          day: 'MON',
                          date: 13,
                        ),
                        DaySelector(
                          selfIndex: 2,
                          day: 'TUE',
                          date: 14,
                        ),
                        DaySelector(
                          selfIndex: 3,
                          day: 'WED',
                          date: 15,
                        ),
                        DaySelector(
                          selfIndex: 4,
                          day: 'THU',
                          date: 16,
                        ),
                        DaySelector(
                          selfIndex: 5,
                          day: 'FRI',
                          date: 17,
                        ),
                        DaySelector(
                          selfIndex: 6,
                          day: 'SAT',
                          date: 18,
                        ),
                      ],
                    ),
                  ),
                ),
                Consumer<AppState>(
                  builder: (context, appState, _) => Column(
                    children: [
                      // final meals in weeklyMeals
                      for (final meal in meals.where((e) =>
                          e.dateId.contains(appState.selectedCategoryId)))
                        // This should pass meals.dailyMeals 
                        DateMealWidget(
                          everyDayMeal: meal,
                        )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
