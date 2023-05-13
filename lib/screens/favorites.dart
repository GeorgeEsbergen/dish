// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_items.dart';

class FavoritesScreen extends StatelessWidget {
  List<Meal> favourites;
  FavoritesScreen(this.favourites);

  @override
  Widget build(BuildContext context) {

    if(favourites.isEmpty){
      return Center(child: Text('Favorites is empty'),);
    }
    else{
      return  ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favourites[index].id ,
            imageUrl: favourites[index].imageUrl,
            title: favourites[index].title,
            duration: favourites[index].duration,
            complexity: favourites[index].complexity,
            affordability: favourites[index].affordability,
          );
        },
        itemCount: favourites.length,
      );
    }


  }
}
