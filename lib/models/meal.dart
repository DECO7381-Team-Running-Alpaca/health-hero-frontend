import 'package:flutter/foundation.dart';

class Meal {
  final double calories;
  final String mealName;
  final String imageUrl;
  final String ingredients;
  final String directions;
  double protein = 0.00;
  double carbs = 0.00;
  double fat = 0.00;

  final String date;
  final String mealType;
  final List dateId;
  final String ytbVideoID;

  Meal(
      {@required this.date,
      @required this.ingredients,
      @required this.calories,
      @required this.mealName,
      @required this.directions,
      @required this.mealType,
      @required this.imageUrl,
      @required this.dateId,
      @required this.ytbVideoID});

  @override
  String toString() {
    final info = 'Mealname: $mealName';
    return info;
  }
}

class DailyMeals {
  // length = 3, contains three meals of the day
  final List<Meal> threeMeals;
  // starting from 0: Sunday
  final List dateId;

  DailyMeals({@required this.threeMeals, @required this.dateId});
}
