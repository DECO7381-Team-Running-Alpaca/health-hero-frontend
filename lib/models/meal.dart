import 'package:flutter/rendering.dart';

class Meal {
  // final String date, title, description, location, duration, punchLine1, punchLine2;
  // final List categoryIds, galleryImages;
  final String date;
  final String calories;
  final String mealType;
  final String breakfastCal;
  final String mealName;
  final AssetImage image;
  final String ingredients;
  final String directions;
  final List dateId;

  Meal({
    this.date,
    this.ingredients,
    this.calories,
    this.mealName,
    this.breakfastCal,
    this.directions,
    this.mealType,
    this.image,
    this.dateId,
  });
}

final sun12June = Meal(
    date: "Sunday, 12 Jun",
    calories: "3000KCAL",
    mealType: "BREAKFAST",
    breakfastCal: "500KCAL",
    mealName: "LOREM IPSUM DOLO",
    image: AssetImage('assets/images/carrot.jpg'),
    ingredients: "Ingredients:\nEgg 100g, Milk 150g, Chicken 150g, Water 200g",
    directions:
        "Directions: \n1.Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet. 2. consectetur Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet, consectetur 3.Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet. 4. consectetur Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet, consectetur",
    dateId: [0]);

final mon13June = Meal(
    date: "Monday, 13 Jun",
    calories: "5000KCAL",
    mealType: "BREAKFAST",
    breakfastCal: "600KCAL",
    mealName: "LOREM IPSUM DOLO",
    image: AssetImage('assets/images/beef.jpg'),
    ingredients: "Ingredients:Egg 100g, Milk 150g, Chicken 150g, Water 200g",
    directions:
        "Directions: 1.Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet. 2. consectetur Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet, consectetur 3.Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet. 4. consectetur Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet, consectetur",
    dateId: [1]);

// final fiveKmRunEvent = EveryDayMeal(
//     imagePath: "assets/event_images/5_km_downtown_run.jpeg",
//     title: "5 Kilometer Downtown Run",
//     description: "",
//     location: "Pleasant Park",
//     duration: "3h",
//     punchLine1: "Marathon!",
//     punchLine2: "The latest fad in foodology, get the inside scoup.",
//     galleryImages: [],
//     categoryIds: [0, 1]);

final meals = [
  sun12June,
  mon13June,
];
