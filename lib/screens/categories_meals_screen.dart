import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../models/meal_category.dart';
import '../widgets/meal_item.dart';

class CategoriesMealsScreen extends StatefulWidget {
  // final Category category;
  // const CategoriesMealsScreen(this.category);
  static const routeName = '/category-meals';
  List<Meal> _availableMeals;

  CategoriesMealsScreen(this._availableMeals);

  @override
  State<CategoriesMealsScreen> createState() => _CategoriesMealsScreenState();
}

class _CategoriesMealsScreenState extends State<CategoriesMealsScreen> {
  MealCategory category;
  bool _loadedInitData = false;

  // If the context wasn't required we could have use initState.
  // context isn't yet available in initState and thus didChangeDependencies
  // is used in this case.
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_loadedInitData) return;
    var routeArgs = (ModalRoute.of(context).settings.arguments as Map<String, MealCategory>);
    category = (ModalRoute.of(context).settings.arguments as Map<String, MealCategory>)['category'];
    widget._availableMeals =
        widget._availableMeals.where((meal) => meal.categories.contains(category.id)).toList();

    _loadedInitData = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: buildScaffoldBody(context),
    );
  }

  Widget buildScaffoldBody(BuildContext context) {
    return ListView.builder(
      itemCount: widget._availableMeals.length,
      itemBuilder: ((context, index) {
        return MealItem(
          meal: widget._availableMeals[index],
          removeItemHandler: removeMealItem,
        );
      }),
    );
  }

  void removeMealItem(Meal meal) {
    setState(() => widget._availableMeals.remove(meal));
  }
}
