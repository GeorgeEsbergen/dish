import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = 'meal_detail';
  final Function toggileFavorites;
  final Function ismealFavorite;

  const MealDetailScreen(this.toggileFavorites, this.ismealFavorite);

  Widget buildContainer(Widget child) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.blueGrey)),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              'Ingredients',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 8,
            ),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Colors.pinkAccent.withOpacity(0.5),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Steps',
              style: TextStyle(fontSize: 20),
            ),
            buildContainer(ListView.builder(
              itemBuilder: (ctx, index) => ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.pinkAccent.withOpacity(0.7),
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                title: Text(selectedMeal.steps[index]),
              ),
              itemCount: selectedMeal.steps.length,
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(ismealFavorite(mealId) ? Icons.star : Icons.star_border),
        onPressed: () => toggileFavorites(mealId),
      ),
    );
  }
}
