import '../../models/meal.dart';

Meal generateOneMeal(int mealIndex, dynamic rawData) {
  final mealExtraInfo = calculateDateAndType(mealIndex);
  final date = mealExtraInfo['date'];
  final mealType = mealExtraInfo['mealType'];
  final dateId = mealExtraInfo['dateId'];

  final mealName = rawData[mealIndex][0]['title'];
  final imageUrl = rawData[mealIndex][0]['image'];
  final ytbVideoID = rawData[mealIndex][0]['videoId'];
  final ingredients = rawData[mealIndex][0]['ingredients'].join(',');
  var directions = '';
  if (rawData[mealIndex][0]['instructions'] == null) {
    directions = 'Bugs to be fixed by backend developers';
  } else {
    directions = rawData[mealIndex][0]['instructions'];
  }
  
  final calories = rawData[mealIndex][0]['nutrients']['calories'].toDouble();
  final fat = rawData[mealIndex][0]['nutrients']['fat'].toDouble();
  final protein = rawData[mealIndex][0]['nutrients']['protein'].toDouble();
  final carbs = rawData[mealIndex][0]['nutrients']['carbohydrates'].toDouble();

  var newMeal = new Meal(
    mealName: mealName,
    calories: calories,
    imageUrl: imageUrl,
    dateId: dateId,
    mealType: mealType,
    date: date,
    ingredients: ingredients,
    directions: directions,
    ytbVideoID: ytbVideoID,
  );

  newMeal.fat = fat;
  newMeal.carbs = carbs;
  newMeal.protein = protein;

  return newMeal;
}

Map<String, dynamic> calculateDateAndType(int mealIndex) {
  return {
    'date': numToDate(mealIndex ~/ 3),
    'mealType': numToType(mealIndex % 3),
    'dateId': [mealIndex ~/ 3]
  };
}

String numToType(int num) {
  switch (num) {
    case 0:
      return 'Breakfast';
    case 1:
      return 'Lunch';
    case 2:
      return 'Dinner';
    default:
      return 'Can not defined';
  }
}

String numToDate(int num) {
  switch (num) {
    case 0:
      return 'Sunday';
    case 1:
      return 'Monday';
    case 2:
      return 'Tuesday';
    case 3:
      return 'Wednesday';
    case 4:
      return 'Thursday';
    case 5:
      return 'Friday';
    case 6:
      return 'Saturday';
    default:
      return 'Can not defined';
  }
}
