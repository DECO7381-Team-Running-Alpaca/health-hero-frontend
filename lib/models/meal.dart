import 'package:flutter/foundation.dart';

class Meal {
  // Passed by backend
  final String calories;
  final String mealName;
  final String imageUrl;
  final String ingredients;
  final String directions;

  // To be added in frontend
  final String date;
  final String mealType;
  final List dateId;

  // Have not handled
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

final sun12June = Meal(
    date: "Sunday, 12 Jun",
    mealType: "BREAKFAST",
    calories: "500KCAL",
    mealName: "LOREM IPSUM DOLO",
    imageUrl: "AssetImage('assets/images/carrot.jpg')",
    ingredients: "Ingredients:\nEgg 100g, Milk 150g, Chicken 150g, Water 200g",
    directions:
        "Directions: \n1.Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet. 2. consectetur Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet, consectetur 3.Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet. 4. consectetur Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet, consectetur",
    dateId: [0],
    ytbVideoID: 'aaa');

final mon13June = Meal(
    date: "Monday, 13 Jun",
    mealType: "BREAKFAST",
    calories: "600KCAL",
    mealName: "LOREM IPSUM DOLO",
    imageUrl: "AssetImage('assets/images/beef.jpg')",
    ingredients: "Ingredients:Egg 100g, Milk 150g, Chicken 150g, Water 200g",
    directions:
        "Directions: 1.Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet. 2. consectetur Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet, consectetur 3.Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet. 4. consectetur Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet, consectetur",
    dateId: [1],
    ytbVideoID: 'bbb');

final meals = [
  sun12June,
  mon13June,
];

// final monMeals =
//     WeeklyMeals(dateId: sun12June.dateId, meals: [sun12June, mon13June, sun12June]);
// final tueMeals =
//     WeeklyMeals(dateId: mon13June.dateId, meals: [mon13June, sun12June, mon13June]);

// final weeklyMeals = [
//   monMeals,
//   tueMeals,
// ];
