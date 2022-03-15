import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatefulWidget {
  final List<Meal> _favoriteMeals;
  const FavoritesScreen(this._favoriteMeals);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<Meal> _favoriteMeals;

  @override
  void initState() {
    super.initState();
    _favoriteMeals = widget._favoriteMeals;
  }

  @override
  Widget build(BuildContext context) {
    if (_favoriteMeals.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    } else {
      return ListView.builder(
        itemCount: _favoriteMeals.length,
        itemBuilder: ((context, index) {
          return MealItem(meal: _favoriteMeals[index], updateHandler: updateFavoriteMealsHandler);
        }),
      );
    }
  }

  void updateFavoriteMealsHandler() {
    setState(() {
      _favoriteMeals = widget._favoriteMeals;
    });
  }
}
