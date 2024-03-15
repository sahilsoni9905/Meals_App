//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:meals_app/meal_details.dart';
import 'package:meals_app/mealitem.dart';
import 'package:meals_app/models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {super.key,
      required this.title,
      required this.meals,
      required this.onToggleFavourite});
  final String title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavourite;
  void selectMeal(BuildContext context, meal) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealDetails(
              meal: meal,
              onToggleFovourite: onToggleFavourite,
            )));
  }

  @override
  Widget build(context) {
    Widget content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) => MealItem(
            meal: meals[index],
            onSelectMeal: (meal) {
              selectMeal(context, meal);
            }));
    if (meals.isEmpty) {
      content = const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Uh oh .... nothing here!!',
              style: TextStyle(fontSize: 30, color: Colors.white70),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Try selecting a different one ',
              style: TextStyle(fontSize: 20, color: Colors.white70),
            )
          ],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
