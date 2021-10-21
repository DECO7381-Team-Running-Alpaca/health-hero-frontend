import 'dart:ui';

// Reference: 
// https://github.com/leopoldmaillard/diet-vision-flutter/blob/master/lib/pages/model_results.dart

List<int> pascalVOCLabelColors = [
  Color.fromARGB(255, 0, 0, 0).value, // background
  Color.fromARGB(255, 128, 0, 0).value, // leafy_greens
  Color.fromARGB(255, 0, 128, 0).value, // stem_vegetables
  Color.fromARGB(255, 128, 128, 0).value, // non-starchy_roots
  Color.fromARGB(255, 0, 0, 128).value, // vegetables | otherxw
  Color.fromARGB(255, 128, 0, 128).value, // fruits
  Color.fromARGB(255, 0, 128, 128).value, // protein | meat
  Color.fromARGB(255, 128, 128, 128).value, // protein | poultry
  Color.fromARGB(255, 64, 0, 0).value, // protein | seafood
  Color.fromARGB(255, 192, 0, 0).value, // protein | eggs
  Color.fromARGB(255, 64, 128, 0).value, // protein | beans/nuts
  Color.fromARGB(255, 192, 128, 0).value, // starches/grains | baked_goods
  Color.fromARGB(255, 64, 0, 128)
      .value, // starches/grains | rice/grains/cereals
  Color.fromARGB(255, 192, 0, 128).value, // starches/grains | noodles/pasta
  Color.fromARGB(255, 255, 64, 64)
      .value, // starches/grains | starchy_vegetables
  Color.fromARGB(255, 192, 128, 128).value, // starches/grains | other
  Color.fromARGB(255, 0, 64, 0).value, // soups/stews
  Color.fromARGB(255, 128, 64, 0).value, // herbs/spices
  Color.fromARGB(255, 0, 192, 0).value, // dairy
  Color.fromARGB(255, 128, 192, 0).value, // snacks
  Color.fromARGB(255, 0, 64, 128).value, // sweets/desserts
  Color.fromARGB(255, 128, 64, 64).value, // beverages
  Color.fromARGB(255, 64, 64, 128).value, // fats/oils/sauces
  Color.fromARGB(255, 64, 64, 64).value, // food_containers
  Color.fromARGB(255, 192, 192, 192).value, // dining_tools
  Color.fromARGB(255, 192, 64, 64).value, // other_food
];

Map<String, String> segmentClasses = {
  '[0, 0, 0, 255]': 'Background',
  '[128, 0, 0, 255]': 'Leafy Greens',
  '[0, 128, 0, 255]': 'Stem Vegetables',
  '[128, 128, 0, 255]': 'Non-starchy Roots',
  '[0, 0, 128, 255]': 'Vegetables | Other',
  '[128, 0, 128, 255]': 'Fruits',
  '[0, 128, 128, 255]': 'Protein | Meat',
  '[128, 128, 128, 255]': 'Protein | Poultry',
  '[64, 0, 0, 255]': 'Protein | Seafood',
  '[192, 0, 0, 255]': 'Protein | Eggs',
  '[64, 128, 0, 255]': 'Protein | Beans/nuts',
  '[192, 128, 0, 255]': 'Starches/grains | Baked Goods',
  '[64, 0, 128, 255]': 'Starches/grains | rice/grains/cereals',
  '[192, 0, 128, 255]': 'Starches/grains | Noodles/pasta',
  '[255, 64, 64, 255]': 'Starches/grains | Starchy Vegetables',
  '[192, 128, 128, 255]': 'Starches/grains | Other',
  '[0, 64, 0, 255]': 'Soups/stews',
  '[128, 64, 0, 255]': 'Herbs/spices',
  '[0, 192, 0, 255]': 'Dairy',
  '[128, 192, 0, 255]': 'Snacks',
  '[0, 64, 128, 255]': 'Sweets/desserts',
  '[128, 64, 64, 255]': 'Beverages',
  '[64, 64, 128, 255]': 'Fats/oils/sauces',
  '[64, 64, 64, 255]': 'Food Containers',
  '[192, 192, 192, 255]': 'Dining Tools',
  '[192, 64, 64, 255]': 'Other Food'
};

final rgbaCodes = segmentClasses.keys.toList();
final foodClasses = segmentClasses.values.toList();