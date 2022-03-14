import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_meals_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

import './screens/categories_screen.dart';
import './screens/categories_meals_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
      home: TabsScreen(),
      routes: {
        CategoriesMealsScreen.routeName: (context) => CategoriesMealsScreen(),
        MealDetailScreen.routeName: (context) => MealDetailScreen()
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) {
          return CategoriesMealsScreen();
        });
      },
    );
  }
}
