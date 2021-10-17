import '../../models/meal.dart';

Meal generateOneMeal(int mealIndex, dynamic rawData)  {
  final mealExtraInfo = calculateDateAndType(mealIndex);
  final date = mealExtraInfo['date'];
  final mealType = mealExtraInfo['mealType'];
  final dateId = mealExtraInfo['dateId'];
  final caloires = '500';
  final mealName = rawData[mealIndex][0]['title'];
  final imageUrl = rawData[mealIndex][0]['image'];

  var directions = '';
  if (rawData[mealIndex][0]['instructions'] == null) {
    directions = 'Bugs to be fixed by backend developers';
  } else {
    directions = rawData[mealIndex][0]['instructions'];
  }

  final ingredients = rawData[mealIndex][0]['ingredients'].join(',');

  final ytbVideoID = '';

  // print('$date, $mealType, $dateId, $caloires, $mealName, $imageUrl');
  // print(ingredients);
  // print(directions);
  // print('____________________');

  return new Meal(
    mealName: mealName,
    calories: caloires,
    imageUrl: imageUrl,
    dateId: dateId,
    mealType: mealType,
    date: date,
    ingredients: ingredients,
    directions: directions,
    ytbVideoID: ytbVideoID,
  );
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
