import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../utils/helpers/date_handler.dart';
import '../utils/helpers/process_plan_data.dart';
import '../utils/services/local_storage_servcie.dart';
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

  double get dailyCalories {
    var todayStatus = this._clockInStatus[today];
    double dailyCalories = 0;
    if (!this._detailedPlan.isEmpty) {
      for (var i = 0; i < todayStatus.length; i++) {
        if (todayStatus[i]) {
          dailyCalories += this._detailedPlan[abbrToFull(today)][i].calories;
        }
      }
    }
    return dailyCalories;
  }

  Map<String, String> getWeeklyNutritions() {
    Map<String, String> weeklyReport;
    double caloriesW = 0;
    double proteinW = 0;
    double carbW = 0;
    double fatW = 0;

    this._detailedPlan.forEach((date, meals) {
      // there is a clockin status today
      if (_clockInStatus[date.substring(0, 3)].contains(true)) {
        // check whether there is a clock in
        for (var i = 0; i < meals.length; i++) {
          if (_clockInStatus[date.substring(0, 3)][i]) {
            // Update sum of nutritions
            caloriesW += meals[i].calories;
            proteinW += meals[i].protein;
            carbW += meals[i].carbs;
            fatW += meals[i].fat;
          }
        }
      }
    });

    weeklyReport = {
      'calories': caloriesW.toStringAsFixed(2),
      'protein': proteinW.toStringAsFixed(2),
      'carb': carbW.toStringAsFixed(2),
      'fat': fatW.toStringAsFixed(2),
    };
    return weeklyReport;
  }

  void setClockInStatus(String date, int type) {
    this._clockInStatus[date][type] = !this._clockInStatus[date][type];
    storeClockInStatus(this._clockInStatus);
  }

  Future<void> getWeeklyPlan() async {
    // try {
      _weeklyMeals = [];
      _detailedPlan = {
        'Sunday': [],
        'Monday': [],
        'Tuesday': [],
        'Wednesday': [],
        'Thursday': [],
        'Friday': [],
        'Saturday': [],
      };
      
      await fetchDetailedPlan().then((data) {
        for (int i = 0; i < data.length; i++) {
          // // Intialise each meal based on response
          final meal = generateOneMeal(i, data);

          // // Add meal to 'neat & clean' container: detailed Plan
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
    // } catch (error) {
    //   print(error);
    //   throw error;
    // }
  }

  Future<void> generateBrandNewPlan() async {
    try {
      _weeklyMeals = [];
      _detailedPlan = {
        'Sunday': [],
        'Monday': [],
        'Tuesday': [],
        'Wednesday': [],
        'Thursday': [],
        'Friday': [],
        'Saturday': [],
      };
      
      await createWeeklyPlan().then((data) {
        for (var i = 0; i < data.length; i++) {
          final meal = generateNewMeal(i, data);
          _detailedPlan[meal.date].add(meal);
        }

        _detailedPlan.forEach((date, meals) {
          final oneDayMeal =
              new DailyMeals(threeMeals: meals, dateId: meals[0].dateId);
          _weeklyMeals.add(oneDayMeal);
        });
      });

      await storeClockInStatus(this._clockInStatus);
    } catch (error) {
      print(error);
      throw error;
    }
  }
}
