import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meal.dart';

class MealProvider with ChangeNotifier {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };
  List<Meal> avilableMeals = DUMMY_MEALS;
  List<Meal> favourites = [];

  void setFilters(Map<String, bool> filterData) {
    filters = filterData;

    avilableMeals = DUMMY_MEALS.where((meal) {
      if (filters['gluten']! && !meal.isGlutenFree) {
        return false;
      }
      if (filters['lactose']! && !meal.isLactoseFree) {
        return false;
      }
      if (filters['vegan']! && !meal.isVegan) {
        return false;
      }
      if (filters['vegetarian']! && !meal.isVegetarian) {
        return false;
      } else {
        return true;
      }
    }).toList();
  }

  void toggileFavorites(String mealId) {
    final existingIdx = favourites.indexWhere((meal) => meal.id == mealId);
    if (existingIdx >= 0) {
      favourites.removeAt(existingIdx);
    } else {
      favourites.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
    }
  }

  bool ismealFavorite(String id) {
    return favourites.any((meal) => meal.id == id);
  }
}
