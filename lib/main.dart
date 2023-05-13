import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/category_meal_screen.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';

void main() => runApp(MyApp());


class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

   Map<String ,bool> _filters={
     'gluten':false,
     'lactose' :false,
     'vegan':false,
     'vegetarian' :false

  };
   List<Meal> _avilableMeals= DUMMY_MEALS;
   List<Meal> _favourites= [];
   void _setFilters(Map<String , bool> _filterData){
     setState(() {
       _filters=_filterData;

       _avilableMeals=DUMMY_MEALS.where((meal) {
         if(_filters['gluten']! && !meal.isGlutenFree){
           return false;
         }
         if(_filters['lactose']! && !meal.isLactoseFree){
           return false;
         }
         if(_filters['vegan']! && !meal.isVegan){
           return false;
         }
         if(_filters['vegetarian']! && !meal.isVegetarian){
           return false;
         }
         else {
           return true ;
         }
       } ).toList();
     });
   }
   void _toggileFavorites(String mealId){
    final existingIdx= _favourites.indexWhere((meal) =>meal.id==mealId );
    if(existingIdx>=0){
      setState(() {
        _favourites.removeAt(existingIdx);
      });
    }
    else{
      setState(() {
        _favourites.add(DUMMY_MEALS.firstWhere((meal) =>meal.id==mealId));
      });
    }
   }
   bool _ismealFavorite(String id){
     return _favourites.any((meal) =>meal.id==id );
   }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dish Dash',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 245, 230, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(
            color: Color.fromRGBO(20, 50, 50, 1),
          ),
          bodyText2: TextStyle(color: Color.fromRGBO(20, 50, 50, 1),),
        ),
      ),
      routes: {
        '/' : (context)=> TabsScreen(_favourites),
        CategoryMealScreen.routeName: (context)=> CategoryMealScreen(_avilableMeals),
        MealDetailScreen.routeName: (context)=> MealDetailScreen(_toggileFavorites ,_ismealFavorite ),
        FiltersScreen.routeName: (context)=> FiltersScreen(  _setFilters ,_filters ),

      },
    );
  }
}

// _setFilters as Function()

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal App '),
        actions: [

        ],
      ),
      body: CategoriesScreen(),


    );
  }
}
