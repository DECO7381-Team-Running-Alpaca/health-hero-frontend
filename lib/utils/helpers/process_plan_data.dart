import '../../models/meal.dart';
import '../helpers/date_handler.dart';

Meal generateNewMeal(int mealIndex, dynamic rawData) {
  final mealExtraInfo = calculateDateAndType(mealIndex);
  final date = mealExtraInfo['date'];
  final mealType = mealExtraInfo['mealType'];
  final dateId = mealExtraInfo['dateId'];

  final mealName = rawData[mealIndex]['title'];
  final imageUrl = rawData[mealIndex]['image'];

  var ytbVideoID;
  if (rawData[mealIndex]['videoId'] == null) {
    ytbVideoID = 'Fp2li-mzcyc';
  } else {
    ytbVideoID = rawData[mealIndex]['videoId'];
  }

  var ingredients;
  if (rawData[mealIndex]['ingredients'] == null) {
    ingredients = ['Apple', 'Banana', 'Cranberry', 'Durian'];
  } else {
    ingredients = rawData[mealIndex]['ingredients'].join(',');
  }

  var directions = '';
  if (rawData[mealIndex]['instructions'] == '') {
    directions =
        'Cube your plantain, fry and set aside.Chop your vegetables into your salad bowl and tossIn a pan, heat up vegetable oil and stir fry your shrimps and season. Allow to coolToss in your plantain and shrimps once cool into your bowl of vegetables.Sprinkle the parmesan cheese over the saladDrizzle your dressing over and serve cool.  ';
  } else {
    directions = rawData[mealIndex]['instructions'];
  }

  final calories = rawData[mealIndex]['nutrients']['calories'].toDouble();
  final fat = rawData[mealIndex]['nutrients']['fat'].toDouble();
  final protein = rawData[mealIndex]['nutrients']['protein'].toDouble();
  final carbs = rawData[mealIndex]['nutrients']['carbohydrates'].toDouble();

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

Meal createRandomMeal(dynamic rawData) {
  final date = 'random';
  final mealType = 'random';
  final dateId = [0];

  final mealName = rawData['title'];
  final imageUrl = rawData['image'];
  final ytbVideoID = rawData['videoId'];
  final ingredients = rawData['ingredients'].join(',');
  final directions = rawData['instructions'];
  final calories = rawData['nutrients']['calories'].toDouble();

  return new Meal(
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
}

Meal generateOneMeal(int mealIndex, dynamic rawData) {
  final mealExtraInfo = calculateDateAndType(mealIndex);
  final date = mealExtraInfo['date'];
  final mealType = mealExtraInfo['mealType'];
  final dateId = mealExtraInfo['dateId'];

  final mealName = rawData[mealIndex][0]['title'];
  final imageUrl = rawData[mealIndex][0]['image'];

  String ytbVideoID;
  if (rawData[mealIndex][0]['videoId'] == null) {
    ytbVideoID = 'Fp2li-mzcyc';
  } else {
    ytbVideoID = "${rawData[mealIndex][0]['videoId']}";
  }

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
