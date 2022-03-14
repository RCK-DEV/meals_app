import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final meal = (ModalRoute.of(context).settings.arguments as Map<String, Meal>)['meal'];
    return Scaffold(
        appBar: AppBar(title: Text(meal.title)), body: buildScaffoldBody(context, meal));
  }

  buildScaffoldBody(BuildContext context, Meal meal) {
    return Container(
      child: Column(
        children: [
          Image.network(
            meal.imageUrl,
            fit: BoxFit.cover,
            height: 250,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(Icons.schedule),
                    SizedBox(width: 6),
                    Text('${meal.duration} min')
                  ],
                ),
                Row(
                  children: [Icon(Icons.work), SizedBox(width: 6), Text('${meal.complexityText}')],
                ),
                Row(
                  children: [
                    Icon(Icons.attach_money),
                    SizedBox(width: 6),
                    Text('${meal.affordabilityText}')
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
