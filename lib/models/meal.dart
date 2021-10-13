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

  Meal({
    this.date,
    this.ingredients,
    this.calories,
    this.mealName,
    this.directions,
    this.mealType,
    this.imageUrl,
    this.dateId,
  });
}

class WeeklyMeals {
  final List<Meal> dailyMeals;
  final List dateId;

  WeeklyMeals({this.dailyMeals, this.dateId});
}

final sun12June = Meal(
    date: "Sunday, 12 Jun",
    mealType: "BREAKFAST",
    calories: "500KCAL",
    mealName: "LOREM IPSUM DOLO",
    // image: AssetImage('assets/images/carrot.jpg'),
    ingredients: "Ingredients:\nEgg 100g, Milk 150g, Chicken 150g, Water 200g",
    directions:
        "Directions: \n1.Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet. 2. consectetur Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet, consectetur 3.Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet. 4. consectetur Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet, consectetur",
    dateId: [0]);

final mon13June = Meal(
    date: "Monday, 13 Jun",
    mealType: "BREAKFAST",
    calories: "600KCAL",
    mealName: "LOREM IPSUM DOLO",
    // image: AssetImage('assets/images/beef.jpg'),
    ingredients: "Ingredients:Egg 100g, Milk 150g, Chicken 150g, Water 200g",
    directions:
        "Directions: 1.Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet. 2. consectetur Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet, consectetur 3.Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet. 4. consectetur Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet, consectetur",
    dateId: [1]);

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
