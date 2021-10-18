import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/full_plan_page.dart';
import '../widgets/home_module/date_meal_widget.dart';
import '../widgets/weekly_plan_module/day_selector.dart';
import '../provider/app_state.dart';
import '../provider/meals.dart';
import '../utils/helpers/date_handler.dart';

class WeeklyPlanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weeklyList = generateWeekList();
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
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, FullPlanPage.routeName);
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.date_range,
                              size: 40,
                              color: Color.fromRGBO(100, 110, 91, 1),
                            ),
                            Text(
                              'Full Plan',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromRGBO(100, 110, 91, 1),
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
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
                          date: weeklyList['Sun'],
                        ),
                        DaySelector(
                          selfIndex: 1,
                          day: 'MON',
                          date: weeklyList['Mon'],
                        ),
                        DaySelector(
                          selfIndex: 2,
                          day: 'TUE',
                          date: weeklyList['Tue'],
                        ),
                        DaySelector(
                          selfIndex: 3,
                          day: 'WED',
                          date: weeklyList['Wed'],
                        ),
                        DaySelector(
                          selfIndex: 4,
                          day: 'THU',
                          date: weeklyList['Thu'],
                        ),
                        DaySelector(
                          selfIndex: 5,
                          day: 'FRI',
                          date: weeklyList['Fri'],
                        ),
                        DaySelector(
                          selfIndex: 6,
                          day: 'SAT',
                          date: weeklyList['Sat'],
                        ),
                      ],
                    ),
                  ),
                ),
                Consumer<AppState>(
                  builder: (context, appState, _) => Column(
                    children: [
                      // final meals in weeklyMeals
                      for (final meal in Provider.of<Meals>(context,
                              listen: false)
                          .weeklyMeals
                          .where((e) =>
                              e.dateId.contains(appState.selectedCategoryId)))
                        // This should pass meals.dailyMeals
                        DateMealWidget(
                          dailyMeals: meal,
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
