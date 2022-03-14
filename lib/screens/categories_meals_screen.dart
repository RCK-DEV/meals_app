import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../dummy_data.dart';
import '../models/meal_category.dart';
import '../widgets/meal_item.dart';

class CategoriesMealsScreen extends StatelessWidget {
  // final Category category;
  // const CategoriesMealsScreen(this.category);
  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final category =
        (ModalRoute.of(context).settings.arguments as Map<String, MealCategory>)['category'];
    final List<Meal> meals =
        DUMMY_MEALS.where((meal) => meal.categories.contains(category.id)).toList();

    return Scaffold(
        appBar: AppBar(title: Text(category.id)), body: buildScaffoldBody(context, meals));
  }

  Widget buildScaffoldBody(BuildContext context, List<Meal> meals) {
    return ListView.builder(
      itemCount: meals.length,
      itemBuilder: ((context, index) {
        return MealItem(meals[index]);
      }),
    );
  }
}
