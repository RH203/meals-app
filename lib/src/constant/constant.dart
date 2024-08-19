import 'package:flutter/material.dart';

class Constant {
  Constant._();

  // Color palette
  static const Color darkRed = Color(0xffB82626);
  static const Color brightRed = Color(0xffE02222);
  static const Color blackishGrey = Color(0xff1D1D1D);
  static const Color warmWhite = Color(0xffFAFAFA);
  static const Color white = Color(0xffFFFFFF);

  // HTTP Get data
  static const String categoryUrl =
      "https://themealdb.com/api/json/v1/1/categories.php";

  static const String randomMealUrl =
      "https://themealdb.com/api/json/v1/1/random.php";

  // Search meal by name
  static const String searchByName =
      "https://themealdb.com/api/json/v1/1/search.php?s=";

  // Category icon
  static const Map<String, Icon> categoryIcons = {
    "Beef": const Icon(Icons.food_bank, color: Colors.red),
    "Chicken": const Icon(Icons.local_dining, color: Colors.orange),
    "Dessert": const Icon(Icons.cake, color: Colors.pink),
    "Lamb": const Icon(Icons.restaurant, color: Colors.green),
    "Miscellaneous": const Icon(Icons.category, color: Colors.grey),
    "Pasta": const Icon(Icons.local_pizza, color: Colors.yellow),
    "Pork": const Icon(Icons.fastfood, color: Colors.brown),
    "Seafood": const Icon(Icons.set_meal, color: Colors.blue),
    "Side": const Icon(Icons.dining, color: Colors.purple),
    "Starter": const Icon(Icons.apps, color: Colors.lightBlue),
    "Vegan": const Icon(Icons.eco, color: Colors.green),
    "Vegetarian": const Icon(Icons.grass, color: Colors.greenAccent),
    "Breakfast": const Icon(Icons.breakfast_dining, color: Colors.yellowAccent),
    "Goat": const Icon(Icons.local_florist, color: Colors.lightGreen),
  };
}
