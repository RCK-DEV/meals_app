import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  final Function(Meal) favoriteHandler;
  final Function(Meal) isFavoriteHandler;

  MealDetailScreen(this.favoriteHandler, this.isFavoriteHandler);

  @override
  Widget build(BuildContext context) {
    final meal = (ModalRoute.of(context).settings.arguments as Map<String, Meal>)['meal'];
    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: buildScaffoldBody(context, meal),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavoriteHandler(meal) ? Icons.star : Icons.star_border),
        onPressed: () {
          favoriteHandler(meal);
          // Navigator.of(context).pop(meal);
        },
      ),
    );
  }

  buildScaffoldBody(BuildContext context, Meal meal) {
    return SingleChildScrollView(
      child: Container(
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
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 6),
                      Text('${meal.complexityText}')
                    ],
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
            ),
            buildTitleWidget(context, 'Ingredients'),
            buildContainer(ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Theme.of(context).colorScheme.secondary,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(meal.ingredients[index]),
                    ),
                  );
                })),
            buildTitleWidget(context, 'Steps'),
            buildContainer(ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(child: Text('${index + 1}')),
                        title: Text(
                          meal.steps[index],
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      Divider()
                    ],
                  );
                })),
          ],
        ),
      ),
    );
  }

  // Note: If the app theme changes you should convert this builder
  // method into a seperate widget in order to prevent unnecessary
  // rebuilds of the MealDetailScreen widget since the Theme.of
  // is used in here which triggers the build method whenever the
  // Theme gets changed. Since currently the theme doesn't change
  // it doesn't matter and using a builder method is fine.
  Container buildTitleWidget(BuildContext context, String title) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ));
  }

  Container buildContainer(Widget child) {
    return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.grey)),
        height: 170,
        width: 300,
        child: child);
  }
}
