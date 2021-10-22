class Record {}

class FoodSources {
  final String name;
  final int fat;
  final int dietaryFibre;
  final int protein;
  final int carbohydrate;
  final int calories;

  FoodSources({
    this.name,
    this.fat,
    this.dietaryFibre,
    this.protein,
    this.carbohydrate,
    this.calories,
  });


}

final List<FoodSources> foods = [
  FoodSources(
    name: 'Butter',
    fat: 300,
    dietaryFibre: 0,
    protein: 0,
    carbohydrate: 0,
    calories: 0,
  ),
  FoodSources(
    name: 'Salad',
    fat: 200,
    dietaryFibre: 0,
    protein: 0,
    carbohydrate: 0,
    calories: 0,
  ),
  FoodSources(
    name: 'Fries',
    fat: 100,
    dietaryFibre: 0,
    protein: 0,
    carbohydrate: 0,
    calories: 0,
  ),
  FoodSources(
    name: 'Strawberry',
    fat: 0,
    dietaryFibre: 1000,
    protein: 0,
    carbohydrate: 0,
    calories: 0,
  ),
  FoodSources(
    name: 'Banana',
    fat: 0,
    dietaryFibre: 2000,
    protein: 0,
    carbohydrate: 0,
    calories: 0,
  ),
  FoodSources(
    name: 'Milk',
    fat: 0,
    dietaryFibre: 0,
    protein: 800,
    carbohydrate: 0,
    calories: 0,
  ),
  FoodSources(
    name: 'Tuna',
    fat: 0,
    dietaryFibre: 0,
    protein: 200,
    carbohydrate: 0,
    calories: 0,
  ),
  FoodSources(
    name: 'Fish',
    fat: 0,
    dietaryFibre: 0,
    protein: 2000,
    carbohydrate: 0,
    calories: 0,
  ),
  FoodSources(
    name: 'Honey',
    fat: 0,
    dietaryFibre: 0,
    protein: 0,
    carbohydrate: 200,
    calories: 0,
  ),
];


