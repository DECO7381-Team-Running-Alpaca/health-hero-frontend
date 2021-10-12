import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../utils/services/rest_api_service.dart';

class Meals with ChangeNotifier {
  List<Meal> _meals = [];
  final String authToken;
  final String userId;
  int selectedCategoryId = 0;

  Meals(this.authToken, this.userId, this._meals);

  List<Meal> get meals {
    return [...meals];
  }
  
  void updateCategoryId(int selectedCategoryId) {
    this.selectedCategoryId = selectedCategoryId;
    notifyListeners();
  }
}
