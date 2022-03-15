import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import './screens/categories_meals_screen.dart';
import './screens/filters_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import './models/filter.dart';
import './dummy_data.dart';
import './models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Filter> filters = [
    Filter('Gluten-free', 'Only includes gluten-free meals.'),
    Filter('Vegetarian', 'Only includes vegetarian meals.'),
    Filter('Vegan', 'Only includes vegan meals.'),
    Filter('Lactose-free', 'Only includes lactose-free meals.'),
  ];

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(List<Filter> filterData) {
    setState(() {
      this.filters = filterData;
      List<Filter> enabledFilters = filters.where((filter) => filter.isEnabled).toList();

      if (enabledFilters.length == 0) {
        _availableMeals = DUMMY_MEALS;
        return;
      }

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (enabledFilters.firstWhereOrNull((filter) => filter.title == 'Gluten-free') != null &&
            !meal.isGlutenFree) return false;
        if (enabledFilters.firstWhereOrNull((filter) => filter.title == 'Vegetarian') != null &&
            !meal.isVegetarian) return false;
        if (enabledFilters.firstWhereOrNull((filter) => filter.title == 'Vegan') != null &&
            !meal.isVegan) return false;
        if (enabledFilters.firstWhereOrNull((filter) => filter.title == 'Lactose-free') != null &&
            !meal.isLactoseFree) return false;
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      final existingIndex =
          _favoriteMeals.indexWhere((favoriteMeal) => favoriteMeal.title == meal.title);
      if (existingIndex >= 0) {
        _favoriteMeals.removeAt(existingIndex);
      } else {
        _favoriteMeals.add(meal);
      }
    });
  }

  bool _isMealFavorite(Meal meal) {
    return _favoriteMeals.any((favoriteMeal) => favoriteMeal.title == meal.title);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyMedium: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyLarge: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              titleMedium: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoCondensed',
              )),
          colorScheme:
              ColorScheme.fromSwatch(primarySwatch: Colors.pink).copyWith(secondary: Colors.amber)),
      routes: {
        TabsScreen.routeName: (context) => TabsScreen(_favoriteMeals),
        CategoriesMealsScreen.routeName: (context) => CategoriesMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(_toggleFavorite, _isMealFavorite),
        FiltersScreen.routeName: (context) => FiltersScreen(_setFilters, filters),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) {
          return TabsScreen(_favoriteMeals);
        });
      },
    );
  }
}
