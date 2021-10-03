import 'package:flutter/material.dart';

class Record {}


class foodSources {
  final String name;
  final int fat;
  final int dietaryFibre;
  final int protein;
  final int carbohydrate;
  final int calories;

  foodSources({
    this.name,
    this.fat,
    this.dietaryFibre,
    this.protein,
    this.carbohydrate,
    this.calories,
  });


}

final List<foodSources> foods = [
  foodSources(
    name: 'Butter',
    fat: 300,
    dietaryFibre: 0,
    protein: 0,
    carbohydrate: 0,
    calories: 0,
  ),
  foodSources(
    name: 'Salad',
    fat: 200,
    dietaryFibre: 0,
    protein: 0,
    carbohydrate: 0,
    calories: 0,
  ),
  foodSources(
    name: 'Fries',
    fat: 100,
    dietaryFibre: 0,
    protein: 0,
    carbohydrate: 0,
    calories: 0,
  ),
  foodSources(
    name: 'Strawberry',
    fat: 0,
    dietaryFibre: 1000,
    protein: 0,
    carbohydrate: 0,
    calories: 0,
  ),
  foodSources(
    name: 'Banana',
    fat: 0,
    dietaryFibre: 2000,
    protein: 0,
    carbohydrate: 0,
    calories: 0,
  ),
  foodSources(
    name: 'Milk',
    fat: 0,
    dietaryFibre: 0,
    protein: 800,
    carbohydrate: 0,
    calories: 0,
  ),
  foodSources(
    name: 'Tuna',
    fat: 0,
    dietaryFibre: 0,
    protein: 200,
    carbohydrate: 0,
    calories: 0,
  ),
  foodSources(
    name: 'Fish',
    fat: 0,
    dietaryFibre: 0,
    protein: 2000,
    carbohydrate: 0,
    calories: 0,
  ),
  foodSources(
    name: 'Honey',
    fat: 0,
    dietaryFibre: 0,
    protein: 0,
    carbohydrate: 200,
    calories: 0,
  ),
];


