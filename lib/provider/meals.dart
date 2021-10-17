import 'package:flutter/material.dart';
import 'package:health_hero/utils/helpers/date_handler.dart';
import 'package:health_hero/utils/helpers/process_plan_data.dart';
import 'package:health_hero/utils/services/local_storage_servcie.dart';

import '../models/meal.dart';
import '../utils/services/rest_api_service.dart';

class Meals with ChangeNotifier {
  List<DailyMeals> _weeklyMeals = [];
  String today = currentDate("no");

  Map<String, List<Meal>> _detailedPlan = {
    'Sunday': [],
    'Monday': [],
    'Tuesday': [],
    'Wednesday': [],
    'Thursday': [],
    'Friday': [],
    'Saturday': [],
  };

  Map<String, List<bool>> _clockInStatus = {
    'Sun': [false, false, false],
    'Mon': [false, false, false],
    'Tue': [false, false, false],
    'Wed': [false, false, false],
    'Thu': [false, false, false],
    'Fri': [false, false, false],
    'Sat': [false, false, false],
  };

  List<DailyMeals> get weeklyMeals {
    return [...this._weeklyMeals];
  }

  Map<String, List<Meal>> get detailedPlan {
    return this._detailedPlan;
  }

  Map<String, List<bool>> get clockInStatus {
    return this._clockInStatus;
  }

  void setClockInStatus(String date, int type) {
    this._clockInStatus[date][type] = !this._clockInStatus[date][type];
    storeClockInStatus(this._clockInStatus);
  }

  Future<void> getWeeklyPlan() async {
    try {
      _weeklyMeals = [];
      await fetchDetailedPlan().then((data) {
        for (var i = 0; i < data.length; i++) {
          // Intialise each meal based on response
          final meal = generateOneMeal(i, data);

          // Add meal to 'neat & clean' container: detailed Plan
          _detailedPlan[meal.date].add(meal);
        }

        // Initialise Daily Meals and add to weekly meals
        _detailedPlan.forEach((date, meals) {
          final oneDayMeal =
              new DailyMeals(threeMeals: meals, dateId: meals[0].dateId);
          _weeklyMeals.add(oneDayMeal);
        });
      });

      // Get or initialise ClockIn status
      await getClockInStatus(this.today).then((data) async {
        if (data != null) {
          // Iterate the data and update clockin status
          data.forEach((key, value) {
            if (data[key].contains(true)) {
              for (var i = 0; i < data[key].length; i++) {
                this._clockInStatus[key][i] = data[key][i];
              }
            }
          });
        } else {
          await storeClockInStatus(this._clockInStatus);
        }
      });
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }
}
