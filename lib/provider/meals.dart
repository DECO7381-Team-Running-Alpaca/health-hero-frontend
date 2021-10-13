import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../utils/services/rest_api_service.dart';


class Meals with ChangeNotifier {
  WeeklyMeals _meals;
  final String authToken;
  final String userId;
  int selectedCategoryId = 0;

  Meals(this.authToken, this.userId, this._meals);

  WeeklyMeals get meals {
    return _meals;
  }
}
